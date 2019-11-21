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
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(40, ng0);
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
LAB2:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t1 = (t0 + 5192U);
    t6 = (t0 + 1192U);
    t7 = *((char **)t6);
    t6 = (t0 + 5208U);
    t8 = ieee_p_1242562249_sub_4081755647_1035706684(IEEE_P_1242562249, t5, t1, t7, t6);
    if (t8 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 3192);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(42, ng0);
    t9 = (t0 + 3192);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB6;

}


extern void work_a_4190599978_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4190599978_3212880686_p_0};
	xsi_register_didat("work_a_4190599978_3212880686", "isim/tb_comparison_isim_beh.exe.sim/work/a_4190599978_3212880686.didat");
	xsi_register_executes(pe);
}
