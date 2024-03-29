//
// Created by ozgaga on 2022/11/2.
//

#ifndef INFRARED_NUC_C_FIXED_IRNUC_H
#define INFRARED_NUC_C_FIXED_IRNUC_H

#include "utils.h"

void SSN(mat_s32 *NUC_s32, struct SSN_param *ssnParam);

void DeNoise(mat_s32 *NUC, int NoiseSize, int cnt_mod1);

void *DeShading(void *value);

void *DeFPN_s32();

void *DeStrip2_s32(void *value);

void *DeNU_s32(void *value);

#endif //INFRARED_NUC_C_FIXED_IRNUC_H
