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
static const char *ng0 = "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/comparison/mux4_1.vhd";



static void work_a_3838660672_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 5770);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB7:    t5 = (t0 + 5772);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB8:    t8 = (t0 + 5774);
    t10 = xsi_mem_cmp(t8, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB9:
LAB6:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 3512);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t1 = (t0 + 3432);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(43, ng0);
    t11 = (t0 + 1032U);
    t12 = *((char **)t11);
    t11 = (t0 + 3512);
    t13 = (t11 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t12, 8U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

LAB4:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 3512);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3512);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB10:;
}


extern void work_a_3838660672_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3838660672_3212880686_p_0};
	xsi_register_didat("work_a_3838660672_3212880686", "isim/tb_comparison_isim_beh.exe.sim/work/a_3838660672_3212880686.didat");
	xsi_register_executes(pe);
}
