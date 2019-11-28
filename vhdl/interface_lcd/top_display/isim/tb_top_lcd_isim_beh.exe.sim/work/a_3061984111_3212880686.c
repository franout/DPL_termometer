/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display/translator.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1808404841_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2778267465_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2931903318_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3991088854_1035706684(char *, char *, char *, char *);


static void work_a_3061984111_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 5456);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 5360);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 5456);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3061984111_3212880686_p_1(char *t0)
{
    char t20[16];
    char t21[16];
    char t22[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 10220);
    t5 = (t0 + 5776);
    t13 = (t5 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 10228);
    t5 = (t0 + 5712);
    t13 = (t5 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 10236);
    t5 = (t0 + 5648);
    t13 = (t5 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 10244);
    t5 = (t0 + 5584);
    t13 = (t5 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 10252);
    t5 = (t0 + 5520);
    t13 = (t5 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 8U);
    xsi_driver_first_trans_fast(t5);

LAB3:    t1 = (t0 + 5376);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t6 = (9 - 1);
    t7 = (t6 - 8);
    t8 = (t7 * -1);
    t9 = (1U * t8);
    t10 = (0 + t9);
    t1 = (t5 + t10);
    t11 = *((unsigned char *)t1);
    t12 = (t11 == (unsigned char)3);
    if (t12 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 10172);
    t5 = (t0 + 5520);
    t13 = (t5 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t6 = (9 - 1);
    t8 = (8 - t6);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t1 = (t2 + t10);
    t5 = (t0 + 3688U);
    t13 = *((char **)t5);
    t5 = (t13 + 0);
    memcpy(t5, t1, 8U);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t6 = (9 - 1);
    t8 = (8 - t6);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t1 = (t2 + t10);
    t5 = (t0 + 3808U);
    t13 = *((char **)t5);
    t5 = (t13 + 0);
    memcpy(t5, t1, 8U);

LAB6:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 3688U);
    t2 = *((char **)t1);
    t1 = (t0 + 10040U);
    t5 = ieee_p_1242562249_sub_2778267465_1035706684(IEEE_P_1242562249, t20, t2, t1, 10);
    t13 = (t0 + 3688U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    t15 = (t20 + 12U);
    t8 = *((unsigned int *)t15);
    t9 = (1U * t8);
    memcpy(t13, t5, t9);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 3808U);
    t2 = *((char **)t1);
    t1 = (t0 + 10040U);
    t5 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t20, t2, t1, 10);
    t13 = (t0 + 3808U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    t15 = (t20 + 12U);
    t8 = *((unsigned int *)t15);
    t9 = (1U * t8);
    memcpy(t13, t5, t9);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 10180);
    t5 = (t21 + 0U);
    t13 = (t5 + 0U);
    *((int *)t13) = 0;
    t13 = (t5 + 4U);
    *((int *)t13) = 7;
    t13 = (t5 + 8U);
    *((int *)t13) = 1;
    t6 = (7 - 0);
    t8 = (t6 * 1);
    t8 = (t8 + 1);
    t13 = (t5 + 12U);
    *((unsigned int *)t13) = t8;
    t13 = (t0 + 3688U);
    t14 = *((char **)t13);
    t13 = (t0 + 10040U);
    t15 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t20, t1, t21, t14, t13);
    t16 = (t0 + 5584);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t25 = *((char **)t19);
    memcpy(t25, t15, 8U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 3808U);
    t2 = *((char **)t1);
    t1 = (t0 + 10040U);
    t5 = ieee_p_1242562249_sub_2778267465_1035706684(IEEE_P_1242562249, t20, t2, t1, 10);
    t13 = (t0 + 3688U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    t15 = (t20 + 12U);
    t8 = *((unsigned int *)t15);
    t9 = (1U * t8);
    memcpy(t13, t5, t9);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 3808U);
    t2 = *((char **)t1);
    t1 = (t0 + 10040U);
    t5 = ieee_p_1242562249_sub_1808404841_1035706684(IEEE_P_1242562249, t20, t2, t1, 10);
    t13 = (t0 + 3808U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    t15 = (t20 + 12U);
    t8 = *((unsigned int *)t15);
    t9 = (1U * t8);
    memcpy(t13, t5, t9);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 10188);
    t5 = (t21 + 0U);
    t13 = (t5 + 0U);
    *((int *)t13) = 0;
    t13 = (t5 + 4U);
    *((int *)t13) = 7;
    t13 = (t5 + 8U);
    *((int *)t13) = 1;
    t6 = (7 - 0);
    t8 = (t6 * 1);
    t8 = (t8 + 1);
    t13 = (t5 + 12U);
    *((unsigned int *)t13) = t8;
    t13 = (t0 + 3688U);
    t14 = *((char **)t13);
    t13 = (t0 + 10040U);
    t15 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t20, t1, t21, t14, t13);
    t16 = (t0 + 5648);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t25 = *((char **)t19);
    memcpy(t25, t15, 8U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 3808U);
    t2 = *((char **)t1);
    t1 = (t0 + 10040U);
    t5 = ieee_p_1242562249_sub_2778267465_1035706684(IEEE_P_1242562249, t20, t2, t1, 10);
    t13 = (t0 + 3688U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    t15 = (t20 + 12U);
    t8 = *((unsigned int *)t15);
    t9 = (1U * t8);
    memcpy(t13, t5, t9);
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 10196);
    t5 = (t21 + 0U);
    t13 = (t5 + 0U);
    *((int *)t13) = 0;
    t13 = (t5 + 4U);
    *((int *)t13) = 7;
    t13 = (t5 + 8U);
    *((int *)t13) = 1;
    t6 = (7 - 0);
    t8 = (t6 * 1);
    t8 = (t8 + 1);
    t13 = (t5 + 12U);
    *((unsigned int *)t13) = t8;
    t13 = (t0 + 3688U);
    t14 = *((char **)t13);
    t13 = (t0 + 10040U);
    t15 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t20, t1, t21, t14, t13);
    t16 = (t0 + 5712);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t25 = *((char **)t19);
    memcpy(t25, t15, 8U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t6 = (0 - 8);
    t8 = (t6 * -1);
    t9 = (1U * t8);
    t10 = (0 + t9);
    t1 = (t2 + t10);
    t3 = *((unsigned char *)t1);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 10212);
    t5 = (t0 + 5776);
    t13 = (t5 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 8U);
    xsi_driver_first_trans_fast(t5);

LAB9:    goto LAB3;

LAB5:    xsi_set_current_line(80, ng0);
    t13 = (t0 + 10164);
    t15 = (t0 + 5520);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t13, 8U);
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t6 = (9 - 1);
    t8 = (8 - t6);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t1 = (t2 + t10);
    t5 = (t22 + 0U);
    t13 = (t5 + 0U);
    *((int *)t13) = 8;
    t13 = (t5 + 4U);
    *((int *)t13) = 1;
    t13 = (t5 + 8U);
    *((int *)t13) = -1;
    t7 = (1 - 8);
    t23 = (t7 * -1);
    t23 = (t23 + 1);
    t13 = (t5 + 12U);
    *((unsigned int *)t13) = t23;
    t13 = ieee_p_1242562249_sub_3991088854_1035706684(IEEE_P_1242562249, t21, t1, t22);
    t14 = ieee_p_1242562249_sub_2931903318_1035706684(IEEE_P_1242562249, t20, t13, t21, 1);
    t15 = (t0 + 3688U);
    t16 = *((char **)t15);
    t15 = (t16 + 0);
    t17 = (t20 + 12U);
    t23 = *((unsigned int *)t17);
    t24 = (1U * t23);
    memcpy(t15, t14, t24);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t6 = (9 - 1);
    t8 = (8 - t6);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t1 = (t2 + t10);
    t5 = (t22 + 0U);
    t13 = (t5 + 0U);
    *((int *)t13) = 8;
    t13 = (t5 + 4U);
    *((int *)t13) = 1;
    t13 = (t5 + 8U);
    *((int *)t13) = -1;
    t7 = (1 - 8);
    t23 = (t7 * -1);
    t23 = (t23 + 1);
    t13 = (t5 + 12U);
    *((unsigned int *)t13) = t23;
    t13 = ieee_p_1242562249_sub_3991088854_1035706684(IEEE_P_1242562249, t21, t1, t22);
    t14 = ieee_p_1242562249_sub_2931903318_1035706684(IEEE_P_1242562249, t20, t13, t21, 1);
    t15 = (t0 + 3808U);
    t16 = *((char **)t15);
    t15 = (t16 + 0);
    t17 = (t20 + 12U);
    t23 = *((unsigned int *)t17);
    t24 = (1U * t23);
    memcpy(t15, t14, t24);
    goto LAB6;

LAB8:    xsi_set_current_line(107, ng0);
    t5 = (t0 + 10204);
    t14 = (t0 + 5776);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 8U);
    xsi_driver_first_trans_fast(t14);
    goto LAB9;

}


extern void work_a_3061984111_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3061984111_3212880686_p_0,(void *)work_a_3061984111_3212880686_p_1};
	xsi_register_didat("work_a_3061984111_3212880686", "isim/tb_top_lcd_isim_beh.exe.sim/work/a_3061984111_3212880686.didat");
	xsi_register_executes(pe);
}
