//
// Created by ozgaga on 2022/11/6.
//

#include "InitParam.h"
#include "mat/matCal_s32.h"
#include "mat/mat.h"

#include <math.h>
#include <stdio.h>


extern struct GlobalNUC globalNuc;
extern struct GlobalVar globalVar;
extern struct pthread_nuc pthread_DeStrip;

void DeStrip_s32(mat_s32 *Y, int L) {
    int H = Y->rows;
    int W = Y->cols;

    mat_s32 *local_mean = createMat_s32(H, W);
    matGaussianBlur_s32(Y, local_mean, L);
    mat_s32 *residual = createMat_s32(H, W);
    matSub_s32(Y, local_mean, residual);

    matAbs_s32(residual, Y);
    matGaussianBlur_s32(Y, Y, L);

//    matPow2_s32(Y, Y);
    for (int i = 0; i < H * W; i++) {
        int val = (Y->data[i] >> (14 + nucShift - 15));
        Y->data[i] = val * val + 1; //最后相当于2^28放大2^3 < 2^31
//        Y->data[i] = val * val; //最后相当于2^28放大2^3 < 2^31
    }

    /** find median **/
    int median_val = (H * W / 2);
    mat_s32 *tmp_Y = createMat_s32(H, W);
    matCopy_s32(Y, tmp_Y);
    median_val = findKthNums_s32(tmp_Y->data, 0, H * W - 1, median_val);
    matRelease_s32(&tmp_Y);
    /** find median **/

    int histSize = 100;
    int range[] = {3 * median_val / 10, median_val};
    int sigmaN_square = matHist_s32(Y, range, histSize);


    mat_s32 *sigmaU_square = createMat_s32(H, W);
    for (int i = 0; i < H * W; i++) sigmaU_square->data[i] = Y->data[i] - sigmaN_square;
    matMaxZero_s32(sigmaU_square, sigmaU_square);

    for (int i = 0; i < H * W; i++) {
        Y->data[i] = (int) ((int64_t) sigmaU_square->data[i] * (int64_t) residual->data[i]) / Y->data[i];
    }

//    matDiv_s32(sigmaU_square, Y, Y);
//    matMul_s32(Y, residual, Y);

    matAdd_s32(Y, local_mean, Y);

    matRelease_s32(&sigmaU_square);
    matRelease_s32(&residual);
    matRelease_s32(&local_mean);
}

void *DeStrip2_s32(void *value) {
    static int first = 0;
    int Strip_kSize = *((int *) value);

    int H = globalNuc.NUC_DeFPN->rows;
    int W = globalNuc.NUC_DeFPN->cols;

    mat_s32 *Y = createMat_s32(H, W);
    matCopy_s32(globalNuc.NUC_DeFPN, Y);

    mat_s32 *tmp = createMat_s32(H, W);
    matSetZero_s32(tmp);
    mat_s32 *S2 = createMat_s32(H, W);
    matSetZero_s32(S2);

    for (int k = 0; k < 9; k++) {
        matSub_s32(Y, S2, tmp);
        DeStrip_s32(tmp, Strip_kSize);
        matSub_s32(Y, tmp, tmp);

        matGetMedCol_s32(tmp, S2);
        matGetMedRow_s32(tmp, tmp);

        matAdd_s32(S2, tmp, S2);
        matSubS_s32(S2, matAvg_s32(S2), S2);
    }
    matRelease_s32(&tmp);

    uint16_t sigma = matStd_s32(S2);
    for (int i = 0; i < H * W; i++) {
        if (S2->data[i] < -sigma) S2->data[i] = -sigma;
        else if (S2->data[i] > sigma) S2->data[i] = sigma;
    }

    if (first == 0) {
        first = 1;
        matCopy_s32(S2, globalVar.Strip2);
    } else {
        for (int i = 0; i < H * W; i++) {
            globalVar.Strip2->data[i] = (globalVar.Strip2->data[i] * 8 + S2->data[i] * 2) / 10;
        }
    }

    matRelease_s32(&S2);
    matRelease_s32(&Y);

    pthread_DeStrip.running = false;

    return NULL;
}