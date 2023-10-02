#include "main.h"

int main() {
    // 初始视频尺寸
    int src_H = 512;
    int src_W = 640;

    // 处理结果图像尺寸
    int dst_H = 512;
    int dst_W = 640;

    // fp图像路径--建议使用绝对路径
//    char file_fp_path[] = "/Users/ozgaga/Documents/MyDocument/Learning/infraNUC/ImgData/FP/fp_indoor.raw";
    char file_fp_path[] = "./1.raw";

    // 待校正视频路径--建议使用绝对路径
//    char file_video_path[] = "/Users/ozgaga/Documents/MyDocument/Learning/infraNUC/ImgData/Video/y16_indoor_random_motion_640X512.raw";
    char file_video_path[] = "./1.raw";

    // 处理结果存放路径--建议使用绝对路径
//    char file_txt_path[] = "/Volumes/PzxNTFS/NUC/IRay/RAW/indoor/S32/NUC_S32_ALL/";
//    char file_txt_path[] = "/Volumes/PzxNTFS/NUC/IRay/TXT/indoor/S32/NUC_S32_ALL/";
//    char file_txt_path[] = "/Volumes/PzxNTFS/NUC/IRay/RAW/outdoor/S32/NUC_S32_ALL/";
//    char file_txt_path[] = "/Volumes/PzxNTFS/NUC/IRay/TXT/outdoor/S32/NUC_S32_ALL/";
    char file_txt_path[] = "./";

    // 参数设置
    int FrameRate = 25;
    int NUIntensity = 2;
    int ShadingIntensity = 1;
    int NoiseIntensity = 3;

    infrared_NUC(src_H, src_W, dst_H, dst_W, file_fp_path, file_video_path, file_txt_path,
                 FrameRate, NUIntensity, ShadingIntensity, NoiseIntensity);

    return 0;
}
