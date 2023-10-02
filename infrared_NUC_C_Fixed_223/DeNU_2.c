// Created by ozgaga on 2022/11/6.
//

#include "InitParam.h"
#include "mat/mat.h"
#include "mat/matCal_s32.h"
#include "mat/matCal_s64.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

extern struct GlobalNUC globalNuc;
extern struct GlobalVar globalVar;
extern struct pthread_nuc pthread_DeNU;

static mat_s32 *sigmaUT = NULL;
static mat_s32 *thetaUT = NULL;

void InitDeNU(int H, int W) {
    sigmaUT = createMat_s32(H, W);
    thetaUT = createMat_s32(H, W);
    for (int i = 0; i < H * W; i++) {
        sigmaUT->data[i] = 1  << (nucShift + nuShift);
        thetaUT->data[i] = 0;
    }
}

void *DeNU_s32(void *value) {
    static int flag = 0;

    int NU_kSize = *((int *) value);
    int H = globalNuc.NUC_DeStrip->rows;
    int W = globalNuc.NUC_DeStrip->cols;

    int mu = (globalVar.D << nuShift) / 1000;  // 迭代步长, 源数据已被放大NUC_Shift

    mat_s32 *local_mean = createMat_s32(H, W);   // local_mean
    matSub_s32(globalNuc.NUC_DeStrip, globalVar.NU, local_mean);
    matGaussianBlur_s64(local_mean, local_mean, NU_kSize);
//    matGaussianBlur_s32(local_mean, local_mean, NU_kSize);

    /****判断相机是否运动****/
    mat_s32 *sigmaU_square = createMat_s32(H, W);   // local_mean sigmaU_square
    matSub_s32(globalNuc.NUC_DeStrip, local_mean, sigmaU_square);
    matAbs_s32(sigmaU_square, sigmaU_square);
    matGaussianBlur_s64(sigmaU_square, sigmaU_square, NU_kSize);
//    matGaussianBlur_s32(sigmaU_square, sigmaU_square, NU_kSize);

    for (int i = 0; i < H * W; i++) thetaUT->data[i] = (thetaUT->data[i] * 8 + globalNuc.NUC_DeStrip->data[i] * 2) / 10;

    for (int i = 0; i < H * W; i++) {
        sigmaUT->data[i] = (sigmaUT->data[i] * 9 +
                            abs(globalNuc.NUC_DeStrip->data[i] - thetaUT->data[i])) / 10;
    }

    int len = (H * W) / 501;
    int total_num = H * W / len;

    mat_s32 *T = createMat_s32(1, total_num);  // local_mean sigmaU_square T
    int pos = len - 1;
    for (int i = 0; i < total_num; i++) {
        T->data[i] = sigmaUT->data[pos];
        pos += len;
    }

    matSort_s32(T, T);

    mat_s32 *S = createMat_s32(1, total_num);  // local_mean sigmaU_square T S
    pos = len - 1;
    for (int i = 0; i < total_num; i++) {
        S->data[i] = sigmaU_square->data[pos];
        pos += len;
    }
    matRelease_s32(&sigmaU_square);  // local_mean S T
    matSort_s32(S, S);

    int rnk = 0;
    int i = 0, j = 0;
    while ((i < total_num) && (j < total_num)) {
        if (S->data[j] < T->data[i]) {
            rnk += (i + j - 1);
            j++;
        } else {
            i++;
        }
    }
    matRelease_s32(&T);  // local_mean S
    matRelease_s32(&S);  // local_mean

    rnk += (total_num * (total_num - j) + (j + total_num - 1) * (total_num - j) / 2);

    /**** 若相机运动则更新NU ****/
    if (flag <= 10) {
        flag++;
    } else {
        if (rnk < (1.45e5)) {
            for (int k = 0; k < H * W; k++) {
                local_mean->data[k] = globalNuc.NUC_DeStrip->data[k] - local_mean->data[k] - globalVar.NU->data[k];
            }
            for (int k = 0; k < H * W; k++) {
                if (local_mean->data[k] < 0) local_mean->data[k] = -1;
                else if (local_mean->data[k] > 0) local_mean->data[k] = 1;
            }
            for (int k = 0; k < H * W; k++) {
                globalVar.NU->data[k] += (local_mean->data[k] * mu * 2);
            }
        }
    }

    matRelease_s32(&local_mean);  // NULL
    pthread_DeNU.running = false;

    return NULL;
}
