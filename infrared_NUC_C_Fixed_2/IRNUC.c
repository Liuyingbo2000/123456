//
// Created by ozgaga on 2022/11/2.
//

#include <sys/time.h>
#include <stdio.h>

#include "IRNUC.h"
#include "InitParam.h"
#include "mat/mat.h"
#include "mat/matCal_s32.h"


void infrared_NUC(int src_H, int src_W, int res_H, int res_W, char *fp_path, char *video_path, char *res_path,
                  int FrameRate, int NUIntensity, int ShadingIntensity, int NoiseIntensity) {

    /******** init global variables ********/
    InitGlobalVar(res_H, res_W, fp_path);

    /****** switch parameters of Intensity ******/
    struct SSN_param ssnParam;
    InitIntensity(FrameRate, NUIntensity, ShadingIntensity, NoiseIntensity, &ssnParam);

    /************** 读取需要处理的视频 **************/
    struct timeval start_time, end_time;

    FILE *video_fp = fopen(video_path, "rb");         // 读
    if (video_fp == NULL) {
        printf("Open file failure: %s\n", video_path);
        return;
    }

    double MIN = 0, MAX = 65535;   // 2^16-1
    int cnt = 0;
    /********** 读取视频帧 *********/
    gettimeofday(&start_time, NULL);
    mat_s32 *NUC = createMat_s32(res_H, res_W);
    while (!feof(video_fp)) {
        mat_u16 *Frame = createMat_u16(src_H, src_W);
        fread(Frame->data, 2, src_H * src_W, video_fp);     //每次读取16bit*H*W,即一帧图片
        matRectConvert_u16_s32(Frame, NUC, 0, 0);
        matRelease_u16(&Frame);

        for (int i = 0; i < res_H * res_W; i++) NUC->data[i] = (NUC->data[i] << nucShift);
        /******* 非均匀性校正 ********/
        SSN(NUC, &ssnParam);
        /******* 非均匀性校正 ********/
        for (int i = 0; i < res_H * res_W; i++) NUC->data[i] = (NUC->data[i] >> nucShift);

        /*** Write in TXT or RAW ***/
//        if (cnt % 10 == 0) {
        writeRes_TXT(NUC, cnt / 10, res_path);   // 写入txt文件
        writeRes_RAW(NUC, cnt / 10, res_path);   // 写入raw文件
//        }
        /*** Write in TXT or RAW ***/

        printf("frame_num: %d\n", cnt);
        cnt++;
    }
    matRelease_s32(&NUC);
    fclose(video_fp);

    gettimeofday(&end_time, NULL);
    printf("total time: %.10f s\n", (double) (end_time.tv_sec - start_time.tv_sec) +
                                    (double) (end_time.tv_usec - start_time.tv_usec) / 1000000);
}