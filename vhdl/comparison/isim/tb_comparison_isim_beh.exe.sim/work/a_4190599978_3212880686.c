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
static const char *ng0 = "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/comparison/comparator.vhd";
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_4081755647_1035706684(char *, char *, char *, char *, char *);


static void work_a_4190599978_3212880686_p_0(char *t0)
{
    char t10[16];
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    char *t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned char t29;
    char *t30;
    char *t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned char t36;
    unsigned char t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3112);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t6 = (8 - 1);
    t7 = (7 - t6);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 7;
    t12 = (t11 + 4U);
    *((int *)t12) = 1;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t13 = (1 - 7);
    t14 = (t13 * -1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t0 + 1192U);
    t15 = *((char **)t12);
    t16 = (8 - 1);
    t14 = (7 - t16);
    t17 = (t14 * 1U);
    t18 = (0 + t17);
    t12 = (t15 + t18);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 7;
    t21 = (t20 + 4U);
    *((int *)t21) = 1;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t22 = (1 - 7);
    t23 = (t22 * -1);
    t23 = (t23 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t23;
    t24 = ieee_p_1242562249_sub_4081755647_1035706684(IEEE_P_1242562249, t1, t10, t12, t19);
    if (t24 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 3192);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(43, ng0);
    t21 = (t0 + 1032U);
    t25 = *((char **)t21);
    t26 = (0 - 7);
    t23 = (t26 * -1);
    t27 = (1U * t23);
    t28 = (0 + t27);
    t21 = (t25 + t28);
    t29 = *((unsigned char *)t21);
    t30 = (t0 + 1192U);
    t31 = *((char **)t30);
    t32 = (0 - 7);
    t33 = (t32 * -1);
    t34 = (1U * t33);
    t35 = (0 + t34);
    t30 = (t31 + t35);
    t36 = *((unsigned char *)t30);
    t37 = (t29 == t36);
    if (t37 != 0)
        goto LAB8;

LAB10:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t6 = (0 - 7);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t3 = *((unsigned char *)t1);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB11;

LAB12:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 3192);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(44, ng0);
    t38 = (t0 + 3192);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    *((unsigned char *)t42) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t38);
    goto LAB9;

LAB11:    xsi_set_current_line(47, ng0);
    t5 = (t0 + 3192);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t20 = *((char **)t15);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB9;

}


extern void work_a_4190599978_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4190599978_3212880686_p_0};
	xsi_register_didat("work_a_4190599978_3212880686", "isim/tb_comparison_isim_beh.exe.sim/work/a_4190599978_3212880686.didat");
	xsi_register_executes(pe);
}
