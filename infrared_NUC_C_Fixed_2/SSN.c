//
// Created by ozgaga on 2022/11/2.
//

#include "IRNUC.h"
#include "InitParam.h"
#include "mat/matCal_s32.h"
#include <stdio.h>

extern struct GlobalNUC globalNuc;
extern struct GlobalVar globalVar;

extern struct pthread_nuc pthread_DeFPN;
extern struct pthread_nuc pthread_DeStrip;
extern struct pthread_nuc pthread_DeShading;
extern struct pthread_nuc pthread_DeNU;
extern struct pthread_nuc pthread_DeNoise;

// alphaShading*Shading的范围是-2^14~2^14，所以只能放大2^17倍
// Shading归一化后放大2^13, alphaShading4放大2^4，合计2^17
static void deShading(mat_s32 *Shading, int alphaShading, mat_s32 *dst) {
    for (int i = 0; i < dst->rows * dst->cols; i++) {
        dst->data[i] += ((alphaShading * Shading->data[i]) >> (ShShift));
    }
}

// Shading4<2^16，放大2^16, alphaShading4放大2^5
static void deShading4(mat_s32 *Shading4, int alphaShading4, mat_s32 *dst) {
    for (int i = 0; i < dst->rows * dst->cols; i++) {
        dst->data[i] += ((alphaShading4 * Shading4->data[i]) >> (Sh4Shift));
    }
}

static void deFP(mat_s32 *FP, int alphaFP, mat_s32 *dst) {
    for (int i = 0; i < dst->rows * dst->cols; i++) {
        dst->data[i] += ((alphaFP * FP->data[i]) >> (fpShift));
    }
}

static void deStrip(mat_s32 *Strip, mat_s32 *dst) {
    for (int i = 0; i < dst->rows * dst->cols; i++) {
//        dst->data[i] = dst->data[i] - Strip->data[i];
        dst->data[i] -= Strip->data[i];
    }
}

static void deNU(mat_s32 *NU, mat_s32 *dst) {
    for (int i = 0; i < dst->rows * dst->cols; i++) {
        dst->data[i] = ((dst->data[i] << nuShift) - NU->data[i]) >> nuShift;
    }
}

/***
 *
 * @param NUC_s32 输入图像-float32
 * @param ssnParam 算法参数-自定义结构体
 ***/
void SSN(mat_s32 *NUC_s32, struct SSN_param *ssnParam) {
    static int cnt_mod1 = 0, cnt_mod2 = 0;
    static int first_DeNU = 0;

    int ORG_mean = matAvg_s32(NUC_s32);
    matSubS_s32(NUC_s32, ORG_mean, NUC_s32);

    /************** 非均匀性校正 *************/
    switch (cnt_mod1) {
        // case1：更新DeShading参数
        case 1: {
            if (pthread_DeShading.running == false) {
                pthread_DeShading.running = true;
                matCopy_s32(NUC_s32, globalNuc.ORG);
                pthread_create(&pthread_DeShading.pthread, NULL, DeShading, &ssnParam->Shading_Scale);
//                pthread_detach(pthread_DeShading.pthread);    // 并行
                pthread_join(pthread_DeShading.pthread, NULL);  // 串行
            }
            deShading(globalVar.Shading, -globalVar.alphaShading, NUC_s32);
            deShading4(globalVar.Shading4, -globalVar.alphaShading4, NUC_s32);
            deFP(globalVar.FP, -globalVar.alphaFP, NUC_s32);    // Fixed Pattern
            deStrip(globalVar.Strip2, NUC_s32);
            break;
        }
            // case2：更新DeFPN参数
        case 2: {
            deShading(globalVar.Shading, -globalVar.alphaShading, NUC_s32);
            deShading4(globalVar.Shading4, -globalVar.alphaShading4, NUC_s32);
            if (pthread_DeFPN.running == false) {
                pthread_DeFPN.running = true;
                matCopy_s32(NUC_s32, globalNuc.NUC_DeShading);
                pthread_create(&pthread_DeFPN.pthread, NULL, DeFPN_s32, NULL);
//                pthread_detach(pthread_DeFPN.pthread);    // 并行
                pthread_join(pthread_DeFPN.pthread, NULL);  // 串行
            }
            deFP(globalVar.FP, -globalVar.alphaFP, NUC_s32);
            deStrip(globalVar.Strip2, NUC_s32);
            break;
        }
            // case3：更新DeStrip参数
        case 3: {
            deShading(globalVar.Shading, -globalVar.alphaShading, NUC_s32);
            deShading4(globalVar.Shading4, -globalVar.alphaShading4, NUC_s32);
            deFP(globalVar.FP, -globalVar.alphaFP, NUC_s32);
            if (pthread_DeStrip.running == false) {
                pthread_DeStrip.running = true;
                matCopy_s32(NUC_s32, globalNuc.NUC_DeFPN);
                pthread_create(&pthread_DeStrip.pthread, NULL, DeStrip2_s32, &ssnParam->Strip_kSize);  //只传一个参数NUI
//                pthread_detach(pthread_DeStrip.pthread);  // 并行
                pthread_join(pthread_DeStrip.pthread, NULL);  // 串行
            }
            deStrip(globalVar.Strip2, NUC_s32);
            break;
        }
        default: {
            deShading(globalVar.Shading, -globalVar.alphaShading, NUC_s32);
            deShading4(globalVar.Shading4, -globalVar.alphaShading4, NUC_s32);
            deFP(globalVar.FP, -globalVar.alphaFP, NUC_s32);
            deStrip(globalVar.Strip2, NUC_s32);
            break;
        }
    }

    // DeNU模块更新参数
    if (cnt_mod2 == 0) {
        if (first_DeNU == 0) {
            first_DeNU = 1;
            int len = NUC_s32->rows * NUC_s32->cols;
            int low_val = (int) ((float) len * 0.2f);
            int up_val = len - low_val;
            mat_s32 *nuc_tmp = createMat_s32(NUC_s32->rows, NUC_s32->cols);
            matCopy_s32(NUC_s32, nuc_tmp);
            low_val = findKthNums_s32(nuc_tmp->data, 0, len - 1, low_val);
            up_val = findKthNums_s32(nuc_tmp->data, 0, len - 1, up_val);
            matRelease_s32(&nuc_tmp);
            globalVar.D = up_val - low_val;
        }
        if (pthread_DeNU.running == false) {
            pthread_DeNU.running = true;
            for (int i = 0; i < NUC_s32->rows * NUC_s32->cols; i++) {
                globalNuc.NUC_DeStrip->data[i] = NUC_s32->data[i] << nuShift;
            }
            pthread_create(&pthread_DeNU.pthread, NULL, DeNU_s32, &ssnParam->NU_kSize);
//            pthread_detach(pthread_DeNU.pthread);   // 并行
            pthread_join(pthread_DeNU.pthread, NULL);  // 串行
        }
    }

    deNU(globalVar.NU, NUC_s32);

    // DeNoise模块
    if (ssnParam->Noise_kSize != 0) DeNoise(NUC_s32, ssnParam->Noise_kSize, cnt_mod1);

    matAddS_s32(NUC_s32, ORG_mean, NUC_s32);

    cnt_mod1++;
    cnt_mod2++;
    if (cnt_mod1 == ssnParam->FR_half) cnt_mod1 = 0;
    if (cnt_mod2 == ssnParam->FR_fifth) cnt_mod2 = 0;
}