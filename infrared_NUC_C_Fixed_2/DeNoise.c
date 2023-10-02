//
// Created by ozgaga on 2022/9/30.
//
#include <stdlib.h>

#include "InitParam.h"
#include "mat/matCal_s32.h"

#include <stdio.h>

extern struct pthread_nuc pthread_DeNoise;

static int sigmaN_square = 0;
static mat_s32 *static_sigmaV_square;

void InitDeNoise(int H, int W) {
    static_sigmaV_square = createMat_s32(H, W);
}

void *updateSigmaN() {
    int H = static_sigmaV_square->rows;
    int W = static_sigmaV_square->cols;

    int median_val = H * W / 2;
    /** find median **/
    mat_s32 *tmp_fl = createMat_s32(H, W);
    matCopy_s32(static_sigmaV_square, tmp_fl);
    median_val = findKthNums_s32(tmp_fl->data, 0, H * W - 1, median_val);
    matRelease_s32(&tmp_fl);
    /** find median **/

    int histSize = 100;
    int range[] = {median_val * 3 / 10, median_val};
    int histVal = matHist_s32(static_sigmaV_square, range, histSize);

    sigmaN_square = (9 * sigmaN_square + (int) (2 * histVal)) / 10;
    pthread_DeNoise.running = false;
    return NULL;
}

void DeNoise(mat_s32 *NUC, int NoiseSize, int cnt_mod1) {
    int row = NUC->rows;
    int col = NUC->cols;

    mat_s32 *local_mean = createMat_s32(NUC->rows, NUC->cols);
    matGaussianBlur_s32(NUC, local_mean, NoiseSize);
    mat_s32 *residual = createMat_s32(NUC->rows, NUC->cols);
    matSub_s32(NUC, local_mean, residual);

    /************ 计算噪声方差 ************/
    mat_s32 *sigmaV_square = createMat_s32(NUC->rows, NUC->cols);
    matAbs_s32(residual, sigmaV_square);
    matGaussianBlur_s32(sigmaV_square, sigmaV_square, NoiseSize);
    for (int i = 0; i < row * col; i++) {
//        int val = sigmaV_square->data[i] >> (dr + nucShift + noiseShift - 15);
//        sigmaV_square->data[i] = val * val;
//
        int64_t val = sigmaV_square->data[i];
        sigmaV_square->data[i] = (int) ((val * val) >> (2 * (nucShift + dr) - 31));
    }

    if (cnt_mod1 == 0 && !pthread_DeNoise.running) {
        pthread_DeNoise.running = true;
        matCopy_s32(sigmaV_square, static_sigmaV_square);
        pthread_create(&pthread_DeNoise.pthread, NULL, updateSigmaN, NULL);
//        pthread_detach(pthread_DeNoise.pthread);     // 并行
        pthread_join(pthread_DeNoise.pthread, NULL);   // 串行
    }

    mat_s32 *sigmaU_square = createMat_s32(row, col);
    matSubS_s32(sigmaV_square, sigmaN_square, sigmaU_square);
    matMaxS_s32(sigmaU_square, 0, sigmaU_square);
    for (int i = 0; i < row * col; i++) {
        int64_t val = (int64_t) sigmaU_square->data[i] * (int64_t) residual->data[i];
        val /= (sigmaV_square->data[i] + 1);
        val += local_mean->data[i];
        NUC->data[i] = (int) (val);
    }

    matRelease_s32(&sigmaU_square);

    matRelease_s32(&sigmaV_square);
    matRelease_s32(&residual);
    matRelease_s32(&local_mean);
}