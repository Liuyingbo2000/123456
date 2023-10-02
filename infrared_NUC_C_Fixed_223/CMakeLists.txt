cmake_minimum_required(VERSION 3.20)
project(infrared_NUC_C_Fixed_2 C)

set(CMAKE_C_STANDARD 11)

set(CMAKE_C_FLAGS "-O2 -fopenmp -ftree-vectorize -funroll-loops")

add_executable(infrared_NUC_C_Fixed_2 main.c
        IRNUC.c SSN.c InitParam.c utils.c
        DeNoise.c DeShading.c DeFPN.c
        mat/mat.c
        mat/matCalHist.c  mat/matCalMedCover.c
        mat/matCalGaussian_f32.c
        mat/matCal_s32.c mat/matCalGaussian_s32.c
        mat/matCal_s64.c mat/matCalGaussian_s64.c DeStrip.c DeNU.c
        DeNU_2.c)

target_link_libraries(infrared_NUC_C_Fixed_2 -lpthread -lm)
