//
// Created by ozgaga on 2022/11/2.
//

#include <stdlib.h>
#include <math.h>
#include "InitParam.h"
#include "mat/matCal_s32.h"
#include "mat/matCal_s64.h"

#include <stdio.h>

struct GlobalNUC globalNuc;
struct GlobalVar globalVar;

struct pthread_nuc pthread_DeFPN;
struct pthread_nuc pthread_DeStrip;
struct pthread_nuc pthread_DeShading;
struct pthread_nuc pthread_DeNU;
struct pthread_nuc pthread_DeNoise;

// Shading_S64放大了2^ShShift
// Shading4_S64放大了2^Sh4Shift
// FP_S64放大了2^dr
void preProcessShading(mat_s64 *Shading_S64, mat_s64 *Shading4_S64, mat_s64 *FP_S64) {
    int H = FP_S64->rows;
    int W = FP_S64->cols;

    // 三个标量放大 2 ^ 10
    static int sumShift = 10;
    int64_t sum_Shading2_2 = 15567050;
    int64_t sum_Shading2_4 = 11981357;
    int64_t sum_Shading4_4 = 10135232;

    // 放大了 2^(dr+ShShift)=27
    int64_t sum_Shading4_FP = 0;
    for (int i = 0; i < H * W; i++) {
        sum_Shading4_FP += (Shading4_S64->data[i] * FP_S64->data[i]);
    }

    // 放大了 2^(dr+Sh4Shift)=27
    int64_t sum_Shading2_FP = 0;
    for (int i = 0; i < H * W; i++) {
        sum_Shading2_FP += (Shading_S64->data[i] * FP_S64->data[i]);
    }

    // beta放大了 dr + Sh4Shift
    int64_t beta = ((sum_Shading2_2 * sum_Shading4_FP << (Sh4Shift - ShShift)) - sum_Shading2_FP * sum_Shading2_4) /
                   (((sum_Shading2_2 * sum_Shading4_4) >> sumShift) - ((sum_Shading2_4 * sum_Shading2_4) >> sumShift));

    mat_s64 *tmp = createMat_s64(H, W);
    for (int i = 0; i < H * W; i++) {
        tmp->data[i] = ((FP_S64->data[i] << (Sh4Shift + Sh4Shift)) - Shading4_S64->data[i] * beta) >> Sh4Shift;
    }
    int64_t tmp_sum = 0;
    for (int i = 0; i < H * W; i++) {
        tmp_sum += (tmp->data[i] * Shading_S64->data[i]) >> (Sh4Shift - sumShift);
    }

    int64_t alpha = tmp_sum / sum_Shading2_2; // 左移27位 dr+Sh4Shift

    for (int i = 0; i < H * W; i++) {
        FP_S64->data[i] -= (((Shading_S64->data[i] << (Sh4Shift - ShShift)) * alpha + Shading4_S64->data[i] * beta)
                >> (Sh4Shift + Sh4Shift));
    }

    /***** globalVar.FP赋值 *****/
    for (int i = 0; i < H * W; i++) {
        globalVar.FP->data[i] = (int) (FP_S64->data[i] >> (dr - fpShift));
    }
    /***** globalVar.FP赋值 *****/

    matRelease_s64(&tmp);
}


void InitGlobalVar(int H, int W, char *fp_path) {
    /***************************** READ-FP ********************************/
    mat_u16 *pData = createMat_u16(H, W);
    FILE *uniform_fp = fopen(fp_path, "rb");
    if (uniform_fp == NULL) {
        printf("Open file failure: %s\n", fp_path);
        return;
    }
    fread(pData->data, 2, H * W, uniform_fp);
    fclose(uniform_fp);

    mat_s64 *FP_S64 = createMat_s64(H, W);
    for (int i = 0; i < FP_S64->rows * FP_S64->cols; i++) {
        FP_S64->data[i] = (int64_t) pData->data[i];
    }
    matRelease_u16(&pData);
    /***************************** READ-FP ********************************/

    /****** 归一化 放大2^14倍 ******/
    int64_t max_v = FP_S64->data[0];
    int64_t min_v = FP_S64->data[0];
    for (int i = 1; i < FP_S64->rows * FP_S64->cols; i++) {
        if (FP_S64->data[i] > max_v) max_v = FP_S64->data[i];
        if (FP_S64->data[i] < min_v) min_v = FP_S64->data[i];
    }
    for (int i = 0; i < FP_S64->rows * FP_S64->cols; i++) {
        FP_S64->data[i] = ((FP_S64->data[i] - min_v) << dr) / (max_v - min_v);
    }
    /****** 归一化 放大2^14倍 ******/

    int64_t fp_avg = matAvg_s64(FP_S64);
    matSubS_s64(FP_S64, fp_avg, FP_S64);

    pthread_DeFPN.running = false;
    pthread_DeStrip.running = false;
    pthread_DeShading.running = false;
    pthread_DeNU.running = false;
    pthread_DeNoise.running = false;

    globalNuc.ORG = createMat_s32(H, W);
    globalNuc.NUC_DeFPN = createMat_s32(H, W);
    globalNuc.NUC_DeShading = createMat_s32(H, W);
    globalNuc.NUC_DeStrip = createMat_s32(H, W);

    globalVar.alphaFP = 0, globalVar.alphaShading = 0, globalVar.alphaShading4 = 0;
    globalVar.D = 1000;
    globalVar.FP = createMat_s32(H, W);
    globalVar.NU = createMat_s32(H, W);       // 记录估计得到的非均匀
    globalVar.Strip2 = createMat_s32(H, W);   // 记录估计得到的行列噪声
    matSetZero_s32(globalVar.NU);
    matSetZero_s32(globalVar.Strip2);

    globalVar.Shading = createMat_s32(H, W);
    globalVar.Shading4 = createMat_s32(H, W);

    FILE *uniform_Shading = fopen("./raw_files/Shading.raw", "rb");
    if (uniform_Shading == NULL) {
        printf("Open file failure: %s\n", "Shading.raw");
        return;
    }
    fread(globalVar.Shading->data, 4, H * W, uniform_Shading);
    fclose(uniform_Shading);

    FILE *uniform_Shading4 = fopen("./raw_files/resShading4.raw", "rb");
    if (uniform_Shading4 == NULL) {
        printf("Open file failure: %s\n", "resShading4.raw");
        return;
    }
    fread(globalVar.Shading4->data, 4, H * W, uniform_Shading4);
    fclose(uniform_Shading4);

    mat_s64 *Shading_S64 = createMat_s64(H, W);
    mat_s64 *Shading4_S64 = createMat_s64(H, W);
    for (int i = 0; i < H * W; i++) {
        Shading_S64->data[i] = globalVar.Shading->data[i];
        Shading4_S64->data[i] = globalVar.Shading4->data[i];
    }

    preProcessShading(Shading_S64, Shading4_S64, FP_S64);  //处理globalVal.FP
    InitDeShading(H, W);
    InitDeFPN(FP_S64);
    InitDeNU(H, W);
    InitDeNoise(H, W);

    matRelease_s64(&FP_S64);
    matRelease_s64(&Shading_S64);
    matRelease_s64(&Shading4_S64);
}

// 初始化中根据Intensity进行选择，避免后续循环中重复选择
void InitIntensity(int FrameRate, int NUIntensity, int ShadingIntensity, int NoiseIntensity,
                   struct SSN_param *ssnParam) {
    if (FrameRate < 25) FrameRate = 25;
    ssnParam->FR_half = (FrameRate >> 1);
    ssnParam->FR_fifth = (int) (FrameRate * 0.2);

    switch (NUIntensity) {
        case 1:
            ssnParam->NU_kSize = 9;
            ssnParam->Strip_kSize = 7;
            break;
        case 2:
            ssnParam->NU_kSize = 17;
            ssnParam->Strip_kSize = 11;
            break;
        case 3:
            ssnParam->NU_kSize = 25;
            ssnParam->Strip_kSize = 15;
            break;
        default:
            ssnParam->NU_kSize = 1;
            ssnParam->Strip_kSize = 0;
            break;
    }
    switch (ShadingIntensity) {
        case 1:
            ssnParam->Shading_Scale = 4;
            break;
        case 2:
            ssnParam->Shading_Scale = 8;
            break;
        case 3:
            ssnParam->Shading_Scale = 10;
            break;
        default:
            ssnParam->Shading_Scale = 0;
            break;
    }
    switch (NoiseIntensity) {
        case 0:
            ssnParam->Noise_kSize = 0;
            break;
        case 1:
            ssnParam->Noise_kSize = 5;
            break;
        case 2:
            ssnParam->Noise_kSize = 9;
            break;
        case 3:
            ssnParam->Noise_kSize = 13;
            break;
        default:
            ssnParam->Noise_kSize = 3;
            break;
    }
}

