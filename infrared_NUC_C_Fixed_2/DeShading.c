//
// Created by ozgaga on 2022/11/3.
//

#include <stdio.h>
#include "InitParam.h"
#include "mat/matCal_s32.h"
#include "mat/mat.h"
#include "utils.h"

extern struct GlobalVar globalVar;
extern struct GlobalNUC globalNuc;
extern struct pthread_nuc pthread_DeShading;

static mat_s32 *resShading, *resShading4;
static int64_t sh_sh, sh_sh4, sh4_sh4;

// 注意常量需要喝矩阵移位一致
#define varShift 10
//#define varShift 20
#define matShift 20
#define scaleTimes 10
#define scaleTimes2 100

void InitDeShading(int H, int W) {
    //sh_sh：0.7606804296 * (1 << varShift) = 779
    //sh_sh4：0.5223224804 * (1 << varShift) = 535
    //sh4_sh4：0.4147914436 * (1 << varShift) = 425
    sh_sh = 779;
    sh_sh4 = 535;
    sh4_sh4 = 425;

    resShading = createMat_s32(H - 100, W - 101);
    FILE *uniform_resShading = fopen("./raw_files/resShading.raw", "rb");
    if (uniform_resShading == NULL) {
        printf("Open file failure: %s\n", "resShading.raw");
        return;
    }
    fread(resShading->data, 4, resShading->rows * resShading->cols, uniform_resShading);
    fclose(uniform_resShading);

    resShading4 = createMat_s32(H - 100, W - 101);
    FILE *uniform_resShading4 = fopen("./raw_files/resShading4.raw", "rb");
    if (uniform_resShading4 == NULL) {
        printf("Open file failure: %s\n", "resShading4.raw");
        return;
    }
    fread(resShading4->data, 4, resShading4->rows * resShading4->cols, uniform_resShading4);
    fclose(uniform_resShading4);
}

void *DeShading(void *value) {
    int scale = (int) *((int *) value);
    int H = globalNuc.ORG->rows;
    int W = globalNuc.ORG->cols;

    mat_s32 *resORG = createMat_s32(H - 100, W - 101);
    matFilter_Rect50_s32(globalNuc.ORG, resORG);
    // 极端情况下，resORG <= 2^18

    /****** 全局参数更新-float32 ******/
    mat_s32 *tmpSh = createMat_s32(H - 100, W - 101);
    // tmpSh <= 2^13 * 2^18 = 2^31
    // sum(tmpSh) < 539*412 * 2^27 < 2^18 * 2^31 < 2^49
    // 维持 sum 与 var（即shading_shading与shading_shading4）的放大倍数一致
    matMul_s32(resShading4, resORG, tmpSh);
    int64_t sum_resShading4_resY = (matSum_s32_re64(tmpSh)) >> (matShift - varShift);
    matMul_s32(resShading, resORG, tmpSh);
    int64_t sum_resShading_resY = (matSum_s32_re64(tmpSh)) >> (matShift - varShift);
    // sum 此时为 2^39，放大了2^nucShift * 2^varShift = 2^4 * 2^10

    // var * sum = 2^10 * 2^39 = 2^49, var放大了2^10倍，sum放大了2^14倍数，共放大了2^24倍
    // 而除数则放大了2^10*2^10=2^20倍
    // scale放大了10倍
    // beta放大了2^4*10倍
    int beta = (int) (((sh_sh * sum_resShading4_resY - sum_resShading_resY * sh_sh4)) *
                      scale / (sh_sh * sh4_sh4 - sh_sh4 * sh_sh4));
    // alpha放大了2^4*100倍
    int alpha = (int) (((sum_resShading_resY) * scaleTimes - beta * sh_sh4) * scale / sh_sh);
    // 这两个参数都放大了2^4倍，即2^nucShift
    globalVar.alphaShading = ((globalVar.alphaShading << 3) * scaleTimes2 + (alpha << 1)) / (10 * scaleTimes2);
    globalVar.alphaShading4 = ((globalVar.alphaShading4 << 3) * scaleTimes + (beta << 1)) / (10 * scaleTimes);
    /****** 全局参数更新-float32 ******/

//    printf("globalVar.alphaShading: %d\n", globalVar.alphaShading >> 4);
//    printf("globalVar.alphaShading4: %d\n", globalVar.alphaShading4 >> 4);

    matRelease_s32(&tmpSh);
    matRelease_s32(&resORG);
    pthread_DeShading.running = false;

    return NULL;
}