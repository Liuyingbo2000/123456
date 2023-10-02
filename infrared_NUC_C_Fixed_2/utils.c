//
// Created by ozgaga on 2022/11/2.
//

#include "utils.h"
#include <string.h>
#include <stdio.h>
#include <math.h>

float findKthNums_f32(float *nums, int l, int r, int k) {
    if (l >= r) return nums[l];
    int i = l - 1, j = r + 1;
    float mid = nums[(l + r) >> 1];
    while (i < j) {
        do i++; while (nums[i] < mid);
        do j--; while (nums[j] > mid);
        if (i < j) {
            float t = nums[i];
            nums[i] = nums[j];
            nums[j] = t;
        }
    }
    if (j - l + 1 > k) return findKthNums_f32(nums, l, j, k);
    else return findKthNums_f32(nums, j + 1, r, k - (j - l + 1));
}

int findKthNums_s32(int *nums, int l, int r, int k) {
    if (l >= r) return nums[l];
    int i = l - 1, j = r + 1;
    int mid = nums[(l + r) >> 1];
    while (i < j) {
        do i++; while (nums[i] < mid);
        do j--; while (nums[j] > mid);
        if (i < j) {
            int t = nums[i];
            nums[i] = nums[j];
            nums[j] = t;
        }
    }
    if (j - l + 1 > k) return findKthNums_s32(nums, l, j, k);
    else return findKthNums_s32(nums, j + 1, r, k - (j - l + 1));
}

void sortNums_s32(int *nums, int l, int r) {
    if (l >= r) return;
    int i = l - 1, j = r + 1;
    int mid = nums[(l + r) >> 1];
    while (i < j) {
        do i++; while (nums[i] < mid);
        do j--; while (nums[j] > mid);
        if (i < j) {
            int t = nums[i];
            nums[i] = nums[j];
            nums[j] = t;
        }
    }
    sortNums_s32(nums, l, j);
    sortNums_s32(nums, j + 1, r);
}

void sortNums_f32(float *nums, int l, int r) {
    if (l >= r) return;
    int i = l - 1, j = r + 1;
    float mid = nums[(l + r) >> 1];
    while (i < j) {
        do i++; while (nums[i] < mid);
        do j--; while (nums[j] > mid);
        if (i < j) {
            float t = nums[i];
            nums[i] = nums[j];
            nums[j] = t;
        }
    }
    sortNums_f32(nums, l, j);
    sortNums_f32(nums, j + 1, r);
}

void writeRes_TXT(mat_s32 *NUC, int cnt, char *res_path) {
    char string[10] = {0};
    sprintf(string, "%d", cnt);
    char res_name[100];
    strcpy(res_name, res_path);
    strcat(res_name, string);
    strcat(res_name, ".txt");

    printf("%s\n", res_name);

    FILE *res_video = fopen(res_name, "wb");
    for (int i = 0; i < NUC->rows * NUC->cols; i++) {
        fprintf(res_video, "%d\n", NUC->data[i]);
    }
    fclose(res_video);
}


void writeRes_RAW(mat_s32 *NUC, int cnt, char *res_path) {
    char string[10] = {0};
    sprintf(string, "%d", cnt);
    char res_name[100];
    strcpy(res_name, res_path);
    strcat(res_name, string);
    strcat(res_name, ".raw");
    printf("%s\n", res_name);
    FILE *res_raw = fopen(res_name, "wb");
    unsigned short tmp = 0;
    for (int i = 0; i < NUC->rows * NUC->cols; i++) {
        tmp = (unsigned short) NUC->data[i];
        fwrite(&tmp, 2, 1, res_raw);
    }
    fclose(res_raw);
}