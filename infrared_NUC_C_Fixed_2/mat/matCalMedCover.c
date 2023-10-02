//
// Created by ozgaga on 2022/10/4.
//

#include <stdlib.h>
#include <string.h>
#include "mat.h"
#include "../utils.h"

/**
 * @param nums  源数组
 * @param l     左边界-左闭
 * @param r     右边界-右闭
 * @param k     第k个数
 * @return
 */

void matGetMedRow_s32(mat_s32 *src_, mat_s32 *dst_) {
    int H = dst_->rows, W = dst_->cols;
    int *buffer = (int *) malloc(sizeof(int) * W);
    int *src = src_->data;
    int *dst = dst_->data;
    for (int i = 0; i < H; i++, src += W, dst += W) {
        memcpy(buffer, src, sizeof(int) * W);
        int med = findKthNums_s32(buffer, 0, W - 1, W >> 1);
        for (int j = 0; j < W; j++) dst[j] = med;
    }
    free(buffer), buffer = NULL;
}

void matGetMedCol_s32(const mat_s32 *src, mat_s32 *dst) {
    int H = dst->rows, W = dst->cols;
    int *buffer = (int *) malloc(sizeof(int) * H);
    for (int i = 0; i < W; i++) {
        for (int j = 0; j < H; j++) buffer[j] = src->data[j * W + i];
        int med = findKthNums_s32(buffer, 0, H - 1, H >> 1);
        for (int j = 0; j < H; j++) dst->data[j * W + i] = med;
    }
    free(buffer), buffer = NULL;
}

void matGetMedRow_f32(mat_f32 *src_, mat_f32 *dst_) {
    int H = dst_->rows, W = dst_->cols;
    float *buffer = (float *) malloc(sizeof(float) * W);
    float *src = src_->data;
    float *dst = dst_->data;
    for (int i = 0; i < H; i++, src += W, dst += W) {
        memcpy(buffer, src, sizeof(float) * W);
        float med = findKthNums_f32(buffer, 0, W - 1, W >> 1);
        for (int j = 0; j < W; j++) dst[j] = med;
    }
    free(buffer), buffer = NULL;
}

void matGetMedCol_f32(const mat_f32 *src, mat_f32 *dst) {
    int H = dst->rows, W = dst->cols;
    float *buffer = (float *) malloc(sizeof(float) * H);
    for (int i = 0; i < W; i++) {
        for (int j = 0; j < H; j++) buffer[j] = src->data[j * W + i];
        float med = findKthNums_f32(buffer, 0, H - 1, H >> 1);
        for (int j = 0; j < H; j++) dst->data[j * W + i] = med;
    }
    free(buffer), buffer = NULL;
}