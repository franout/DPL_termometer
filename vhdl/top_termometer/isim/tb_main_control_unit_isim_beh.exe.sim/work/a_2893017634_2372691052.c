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
static const char *ng0 = "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/control_unit/tb_main_control_unit.vhd";
extern char *IEEE_P_2592010699;



static void work_a_2893017634_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 5544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4360);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 5544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4360);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2893017634_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    int t14;
    unsigned int t15;
    int64 t17;
    int64 t18;

LAB0:    t1 = (t0 + 4800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 10364);
    *((int *)t2) = 0;
    t3 = (t0 + 10368);
    *((int *)t3) = 5;
    t7 = 0;
    t8 = 5;

LAB4:    if (t7 <= t8)
        goto LAB5;

LAB7:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10372);
    t9 = 1;
    if (8U == 8U)
        goto LAB18;

LAB19:    t9 = 0;

LAB20:    if (t9 == 0)
        goto LAB16;

LAB17:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t18 = (t17 * 10);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t18);

LAB26:    *((char **)t1) = &&LAB27;

LAB1:    return;
LAB5:    xsi_set_current_line(117, ng0);

LAB10:    t4 = (t0 + 5368);
    *((int *)t4) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 10364);
    t7 = *((int *)t2);
    t3 = (t0 + 10368);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB7;

LAB15:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 10364);
    *((int *)t4) = t7;
    goto LAB4;

LAB8:    t13 = (t0 + 5368);
    *((int *)t13) = 0;
    goto LAB6;

LAB9:    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t10 = *((unsigned char *)t6);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB12;

LAB13:    t9 = (unsigned char)0;

LAB14:    if (t9 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB12:    t5 = (t0 + 1152U);
    t12 = xsi_signal_has_event(t5);
    t9 = t12;
    goto LAB14;

LAB16:    t13 = (t0 + 10380);
    xsi_report(t13, 28U, (unsigned char)3);
    goto LAB17;

LAB18:    t15 = 0;

LAB21:    if (t15 < 8U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB19;

LAB23:    t15 = (t15 + 1);
    goto LAB21;

LAB24:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10408);
    t9 = 1;
    if (8U == 8U)
        goto LAB34;

LAB35:    t9 = 0;

LAB36:    if (t9 == 0)
        goto LAB32;

LAB33:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    t13 = (t0 + 10416);
    xsi_report(t13, 42U, (unsigned char)3);
    goto LAB33;

LAB34:    t15 = 0;

LAB37:    if (t15 < 8U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB35;

LAB39:    t15 = (t15 + 1);
    goto LAB37;

LAB40:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10458);
    t9 = 1;
    if (8U == 8U)
        goto LAB46;

LAB47:    t9 = 0;

LAB48:    if (t9 == 0)
        goto LAB44;

LAB45:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 10518);
    *((int *)t2) = 0;
    t3 = (t0 + 10522);
    *((int *)t3) = 5;
    t7 = 0;
    t8 = 5;

LAB52:    if (t7 <= t8)
        goto LAB53;

LAB55:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10526);
    t9 = 1;
    if (8U == 8U)
        goto LAB63;

LAB64:    t9 = 0;

LAB65:    if (t9 == 0)
        goto LAB61;

LAB62:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB71:    *((char **)t1) = &&LAB72;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    t13 = (t0 + 10466);
    xsi_report(t13, 52U, (unsigned char)3);
    goto LAB45;

LAB46:    t15 = 0;

LAB49:    if (t15 < 8U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB47;

LAB51:    t15 = (t15 + 1);
    goto LAB49;

LAB53:    xsi_set_current_line(144, ng0);
    t4 = (t0 + 3568U);
    t5 = *((char **)t4);
    t17 = *((int64 *)t5);
    t4 = (t0 + 4608);
    xsi_process_wait(t4, t17);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB54:    t2 = (t0 + 10518);
    t7 = *((int *)t2);
    t3 = (t0 + 10522);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB55;

LAB60:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 10518);
    *((int *)t4) = t7;
    goto LAB52;

LAB56:    goto LAB54;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB61:    t13 = (t0 + 10534);
    xsi_report(t13, 34U, (unsigned char)3);
    goto LAB62;

LAB63:    t15 = 0;

LAB66:    if (t15 < 8U)
        goto LAB67;
    else
        goto LAB65;

LAB67:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB64;

LAB68:    t15 = (t15 + 1);
    goto LAB66;

LAB69:    xsi_set_current_line(156, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10568);
    t9 = 1;
    if (8U == 8U)
        goto LAB75;

LAB76:    t9 = 0;

LAB77:    if (t9 == 0)
        goto LAB73;

LAB74:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB83:    *((char **)t1) = &&LAB84;
    goto LAB1;

LAB70:    goto LAB69;

LAB72:    goto LAB70;

LAB73:    t13 = (t0 + 10576);
    xsi_report(t13, 17U, (unsigned char)3);
    goto LAB74;

LAB75:    t15 = 0;

LAB78:    if (t15 < 8U)
        goto LAB79;
    else
        goto LAB77;

LAB79:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB76;

LAB80:    t15 = (t15 + 1);
    goto LAB78;

LAB81:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10593);
    t9 = 1;
    if (8U == 8U)
        goto LAB87;

LAB88:    t9 = 0;

LAB89:    if (t9 == 0)
        goto LAB85;

LAB86:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 0)
        goto LAB93;

LAB94:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(172, ng0);
    t2 = (t0 + 10649);
    *((int *)t2) = 0;
    t3 = (t0 + 10653);
    *((int *)t3) = 5;
    t7 = 0;
    t8 = 5;

LAB95:    if (t7 <= t8)
        goto LAB96;

LAB98:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10657);
    t9 = 1;
    if (8U == 8U)
        goto LAB106;

LAB107:    t9 = 0;

LAB108:    if (t9 == 0)
        goto LAB104;

LAB105:    xsi_set_current_line(181, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(182, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(183, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(185, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB114:    *((char **)t1) = &&LAB115;
    goto LAB1;

LAB82:    goto LAB81;

LAB84:    goto LAB82;

LAB85:    t13 = (t0 + 10601);
    xsi_report(t13, 31U, (unsigned char)3);
    goto LAB86;

LAB87:    t15 = 0;

LAB90:    if (t15 < 8U)
        goto LAB91;
    else
        goto LAB89;

LAB91:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB88;

LAB92:    t15 = (t15 + 1);
    goto LAB90;

LAB93:    t2 = (t0 + 10632);
    xsi_report(t2, 17U, (unsigned char)3);
    goto LAB94;

LAB96:    xsi_set_current_line(173, ng0);
    t4 = (t0 + 3568U);
    t5 = *((char **)t4);
    t17 = *((int64 *)t5);
    t4 = (t0 + 4608);
    xsi_process_wait(t4, t17);

LAB101:    *((char **)t1) = &&LAB102;
    goto LAB1;

LAB97:    t2 = (t0 + 10649);
    t7 = *((int *)t2);
    t3 = (t0 + 10653);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB98;

LAB103:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 10649);
    *((int *)t4) = t7;
    goto LAB95;

LAB99:    goto LAB97;

LAB100:    goto LAB99;

LAB102:    goto LAB100;

LAB104:    t13 = (t0 + 10665);
    xsi_report(t13, 23U, (unsigned char)3);
    goto LAB105;

LAB106:    t15 = 0;

LAB109:    if (t15 < 8U)
        goto LAB110;
    else
        goto LAB108;

LAB110:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB107;

LAB111:    t15 = (t15 + 1);
    goto LAB109;

LAB112:    xsi_set_current_line(189, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10688);
    t9 = 1;
    if (8U == 8U)
        goto LAB118;

LAB119:    t9 = 0;

LAB120:    if (t9 == 0)
        goto LAB116;

LAB117:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(194, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(195, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(196, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(197, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(200, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB126:    *((char **)t1) = &&LAB127;
    goto LAB1;

LAB113:    goto LAB112;

LAB115:    goto LAB113;

LAB116:    t13 = (t0 + 10696);
    xsi_report(t13, 23U, (unsigned char)3);
    goto LAB117;

LAB118:    t15 = 0;

LAB121:    if (t15 < 8U)
        goto LAB122;
    else
        goto LAB120;

LAB122:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB119;

LAB123:    t15 = (t15 + 1);
    goto LAB121;

LAB124:    xsi_set_current_line(202, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10719);
    t9 = 1;
    if (8U == 8U)
        goto LAB130;

LAB131:    t9 = 0;

LAB132:    if (t9 == 0)
        goto LAB128;

LAB129:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(205, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(206, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(208, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(209, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB138:    *((char **)t1) = &&LAB139;
    goto LAB1;

LAB125:    goto LAB124;

LAB127:    goto LAB125;

LAB128:    t13 = (t0 + 10727);
    xsi_report(t13, 24U, (unsigned char)3);
    goto LAB129;

LAB130:    t15 = 0;

LAB133:    if (t15 < 8U)
        goto LAB134;
    else
        goto LAB132;

LAB134:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB131;

LAB135:    t15 = (t15 + 1);
    goto LAB133;

LAB136:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10751);
    t9 = 1;
    if (8U == 8U)
        goto LAB142;

LAB143:    t9 = 0;

LAB144:    if (t9 == 0)
        goto LAB140;

LAB141:    xsi_set_current_line(215, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(219, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(221, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB150:    *((char **)t1) = &&LAB151;
    goto LAB1;

LAB137:    goto LAB136;

LAB139:    goto LAB137;

LAB140:    t13 = (t0 + 10759);
    xsi_report(t13, 24U, (unsigned char)3);
    goto LAB141;

LAB142:    t15 = 0;

LAB145:    if (t15 < 8U)
        goto LAB146;
    else
        goto LAB144;

LAB146:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB143;

LAB147:    t15 = (t15 + 1);
    goto LAB145;

LAB148:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10783);
    t9 = 1;
    if (8U == 8U)
        goto LAB154;

LAB155:    t9 = 0;

LAB156:    if (t9 == 0)
        goto LAB152;

LAB153:    xsi_set_current_line(229, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(230, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(231, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(232, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(233, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(235, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB162:    *((char **)t1) = &&LAB163;
    goto LAB1;

LAB149:    goto LAB148;

LAB151:    goto LAB149;

LAB152:    t13 = (t0 + 10791);
    xsi_report(t13, 19U, (unsigned char)3);
    goto LAB153;

LAB154:    t15 = 0;

LAB157:    if (t15 < 8U)
        goto LAB158;
    else
        goto LAB156;

LAB158:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB155;

LAB159:    t15 = (t15 + 1);
    goto LAB157;

LAB160:    xsi_set_current_line(236, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10810);
    t9 = 1;
    if (8U == 8U)
        goto LAB166;

LAB167:    t9 = 0;

LAB168:    if (t9 == 0)
        goto LAB164;

LAB165:    xsi_set_current_line(240, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(241, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(242, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(243, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(244, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(246, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB174:    *((char **)t1) = &&LAB175;
    goto LAB1;

LAB161:    goto LAB160;

LAB163:    goto LAB161;

LAB164:    t13 = (t0 + 10818);
    xsi_report(t13, 19U, (unsigned char)3);
    goto LAB165;

LAB166:    t15 = 0;

LAB169:    if (t15 < 8U)
        goto LAB170;
    else
        goto LAB168;

LAB170:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB167;

LAB171:    t15 = (t15 + 1);
    goto LAB169;

LAB172:    xsi_set_current_line(247, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10837);
    t9 = 1;
    if (8U == 8U)
        goto LAB178;

LAB179:    t9 = 0;

LAB180:    if (t9 == 0)
        goto LAB176;

LAB177:    xsi_set_current_line(250, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(253, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB186:    *((char **)t1) = &&LAB187;
    goto LAB1;

LAB173:    goto LAB172;

LAB175:    goto LAB173;

LAB176:    t13 = (t0 + 10845);
    xsi_report(t13, 20U, (unsigned char)3);
    goto LAB177;

LAB178:    t15 = 0;

LAB181:    if (t15 < 8U)
        goto LAB182;
    else
        goto LAB180;

LAB182:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB179;

LAB183:    t15 = (t15 + 1);
    goto LAB181;

LAB184:    xsi_set_current_line(254, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10865);
    t9 = 1;
    if (8U == 8U)
        goto LAB190;

LAB191:    t9 = 0;

LAB192:    if (t9 == 0)
        goto LAB188;

LAB189:    xsi_set_current_line(257, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(258, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(259, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(260, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(261, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(263, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t18 = (t17 * 2);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t18);

LAB198:    *((char **)t1) = &&LAB199;
    goto LAB1;

LAB185:    goto LAB184;

LAB187:    goto LAB185;

LAB188:    t13 = (t0 + 10873);
    xsi_report(t13, 17U, (unsigned char)3);
    goto LAB189;

LAB190:    t15 = 0;

LAB193:    if (t15 < 8U)
        goto LAB194;
    else
        goto LAB192;

LAB194:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB191;

LAB195:    t15 = (t15 + 1);
    goto LAB193;

LAB196:    xsi_set_current_line(265, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10890);
    t9 = 1;
    if (8U == 8U)
        goto LAB202;

LAB203:    t9 = 0;

LAB204:    if (t9 == 0)
        goto LAB200;

LAB201:    xsi_set_current_line(270, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(271, ng0);
    t2 = (t0 + 10928);
    *((int *)t2) = 0;
    t3 = (t0 + 10932);
    *((int *)t3) = 5;
    t7 = 0;
    t8 = 5;

LAB208:    if (t7 <= t8)
        goto LAB209;

LAB211:    xsi_set_current_line(274, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10936);
    t9 = 1;
    if (8U == 8U)
        goto LAB222;

LAB223:    t9 = 0;

LAB224:    if (t9 == 0)
        goto LAB220;

LAB221:    xsi_set_current_line(275, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t18 = (t17 * 10);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t18);

LAB230:    *((char **)t1) = &&LAB231;
    goto LAB1;

LAB197:    goto LAB196;

LAB199:    goto LAB197;

LAB200:    t13 = (t0 + 10898);
    xsi_report(t13, 30U, (unsigned char)3);
    goto LAB201;

LAB202:    t15 = 0;

LAB205:    if (t15 < 8U)
        goto LAB206;
    else
        goto LAB204;

LAB206:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB203;

LAB207:    t15 = (t15 + 1);
    goto LAB205;

LAB209:    xsi_set_current_line(272, ng0);

LAB214:    t4 = (t0 + 5384);
    *((int *)t4) = 1;
    *((char **)t1) = &&LAB215;
    goto LAB1;

LAB210:    t2 = (t0 + 10928);
    t7 = *((int *)t2);
    t3 = (t0 + 10932);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB211;

LAB219:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 10928);
    *((int *)t4) = t7;
    goto LAB208;

LAB212:    t13 = (t0 + 5384);
    *((int *)t13) = 0;
    goto LAB210;

LAB213:    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t10 = *((unsigned char *)t6);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB216;

LAB217:    t9 = (unsigned char)0;

LAB218:    if (t9 == 1)
        goto LAB212;
    else
        goto LAB214;

LAB215:    goto LAB213;

LAB216:    t5 = (t0 + 1152U);
    t12 = xsi_signal_has_event(t5);
    t9 = t12;
    goto LAB218;

LAB220:    t13 = (t0 + 10944);
    xsi_report(t13, 28U, (unsigned char)3);
    goto LAB221;

LAB222:    t15 = 0;

LAB225:    if (t15 < 8U)
        goto LAB226;
    else
        goto LAB224;

LAB226:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB223;

LAB227:    t15 = (t15 + 1);
    goto LAB225;

LAB228:    xsi_set_current_line(279, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(280, ng0);
    t2 = (t0 + 10972);
    *((int *)t2) = 0;
    t3 = (t0 + 10976);
    *((int *)t3) = 100;
    t7 = 0;
    t8 = 100;

LAB232:    if (t7 <= t8)
        goto LAB233;

LAB235:    xsi_set_current_line(283, ng0);

LAB246:    t2 = (t0 + 5416);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB247;
    goto LAB1;

LAB229:    goto LAB228;

LAB231:    goto LAB229;

LAB233:    xsi_set_current_line(281, ng0);

LAB238:    t4 = (t0 + 5400);
    *((int *)t4) = 1;
    *((char **)t1) = &&LAB239;
    goto LAB1;

LAB234:    t2 = (t0 + 10972);
    t7 = *((int *)t2);
    t3 = (t0 + 10976);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB235;

LAB243:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 10972);
    *((int *)t4) = t7;
    goto LAB232;

LAB236:    t13 = (t0 + 5400);
    *((int *)t13) = 0;
    goto LAB234;

LAB237:    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t10 = *((unsigned char *)t6);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB240;

LAB241:    t9 = (unsigned char)0;

LAB242:    if (t9 == 1)
        goto LAB236;
    else
        goto LAB238;

LAB239:    goto LAB237;

LAB240:    t5 = (t0 + 1152U);
    t12 = xsi_signal_has_event(t5);
    t9 = t12;
    goto LAB242;

LAB244:    t5 = (t0 + 5416);
    *((int *)t5) = 0;
    xsi_set_current_line(285, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10980);
    t9 = 1;
    if (8U == 8U)
        goto LAB253;

LAB254:    t9 = 0;

LAB255:    if (t9 == 0)
        goto LAB251;

LAB252:    xsi_set_current_line(289, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(290, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(291, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(292, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(293, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(294, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB261:    *((char **)t1) = &&LAB262;
    goto LAB1;

LAB245:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB248;

LAB249:    t9 = (unsigned char)0;

LAB250:    if (t9 == 1)
        goto LAB244;
    else
        goto LAB246;

LAB247:    goto LAB245;

LAB248:    t3 = (t0 + 1152U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB250;

LAB251:    t13 = (t0 + 10988);
    xsi_report(t13, 48U, (unsigned char)3);
    goto LAB252;

LAB253:    t15 = 0;

LAB256:    if (t15 < 8U)
        goto LAB257;
    else
        goto LAB255;

LAB257:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB254;

LAB258:    t15 = (t15 + 1);
    goto LAB256;

LAB259:    xsi_set_current_line(295, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 11036);
    t9 = 1;
    if (8U == 8U)
        goto LAB265;

LAB266:    t9 = 0;

LAB267:    if (t9 == 0)
        goto LAB263;

LAB264:    xsi_set_current_line(296, ng0);
    t2 = (t0 + 5608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(297, ng0);
    t2 = (t0 + 5672);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(298, ng0);
    t2 = (t0 + 5736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(299, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(300, ng0);
    t2 = (t0 + 5864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(301, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4608);
    xsi_process_wait(t2, t17);

LAB273:    *((char **)t1) = &&LAB274;
    goto LAB1;

LAB260:    goto LAB259;

LAB262:    goto LAB260;

LAB263:    t13 = (t0 + 11044);
    xsi_report(t13, 17U, (unsigned char)3);
    goto LAB264;

LAB265:    t15 = 0;

LAB268:    if (t15 < 8U)
        goto LAB269;
    else
        goto LAB267;

LAB269:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB266;

LAB270:    t15 = (t15 + 1);
    goto LAB268;

LAB271:    xsi_set_current_line(302, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 11061);
    t9 = 1;
    if (8U == 8U)
        goto LAB277;

LAB278:    t9 = 0;

LAB279:    if (t9 == 0)
        goto LAB275;

LAB276:    xsi_set_current_line(305, ng0);
    t2 = (t0 + 11100);
    *((int *)t2) = 0;
    t3 = (t0 + 11104);
    *((int *)t3) = 100;
    t7 = 0;
    t8 = 100;

LAB283:    if (t7 <= t8)
        goto LAB284;

LAB286:    xsi_set_current_line(309, ng0);

LAB297:    t2 = (t0 + 5448);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB298;
    goto LAB1;

LAB272:    goto LAB271;

LAB274:    goto LAB272;

LAB275:    t13 = (t0 + 11069);
    xsi_report(t13, 31U, (unsigned char)3);
    goto LAB276;

LAB277:    t15 = 0;

LAB280:    if (t15 < 8U)
        goto LAB281;
    else
        goto LAB279;

LAB281:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB278;

LAB282:    t15 = (t15 + 1);
    goto LAB280;

LAB284:    xsi_set_current_line(306, ng0);

LAB289:    t4 = (t0 + 5432);
    *((int *)t4) = 1;
    *((char **)t1) = &&LAB290;
    goto LAB1;

LAB285:    t2 = (t0 + 11100);
    t7 = *((int *)t2);
    t3 = (t0 + 11104);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB286;

LAB294:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 11100);
    *((int *)t4) = t7;
    goto LAB283;

LAB287:    t13 = (t0 + 5432);
    *((int *)t13) = 0;
    goto LAB285;

LAB288:    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t10 = *((unsigned char *)t6);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB291;

LAB292:    t9 = (unsigned char)0;

LAB293:    if (t9 == 1)
        goto LAB287;
    else
        goto LAB289;

LAB290:    goto LAB288;

LAB291:    t5 = (t0 + 1152U);
    t12 = xsi_signal_has_event(t5);
    t9 = t12;
    goto LAB293;

LAB295:    t5 = (t0 + 5448);
    *((int *)t5) = 0;
    xsi_set_current_line(311, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 11108);
    t9 = 1;
    if (8U == 8U)
        goto LAB304;

LAB305:    t9 = 0;

LAB306:    if (t9 == 0)
        goto LAB302;

LAB303:    xsi_set_current_line(313, ng0);

LAB312:    *((char **)t1) = &&LAB313;
    goto LAB1;

LAB296:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB299;

LAB300:    t9 = (unsigned char)0;

LAB301:    if (t9 == 1)
        goto LAB295;
    else
        goto LAB297;

LAB298:    goto LAB296;

LAB299:    t3 = (t0 + 1152U);
    t12 = xsi_signal_has_event(t3);
    t9 = t12;
    goto LAB301;

LAB302:    t13 = (t0 + 11116);
    xsi_report(t13, 40U, (unsigned char)3);
    goto LAB303;

LAB304:    t15 = 0;

LAB307:    if (t15 < 8U)
        goto LAB308;
    else
        goto LAB306;

LAB308:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB305;

LAB309:    t15 = (t15 + 1);
    goto LAB307;

LAB310:    goto LAB2;

LAB311:    goto LAB310;

LAB313:    goto LAB311;

}

static void work_a_2893017634_2372691052_p_2(char *t0)
{
    char t6[16];
    char t11[16];
    char t15[16];
    char t21[16];
    char t26[16];
    char t31[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;
    char *t22;
    char *t23;
    char *t24;
    unsigned char t25;
    char *t27;
    char *t28;
    char *t29;
    unsigned char t30;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned char t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;

LAB0:    xsi_set_current_line(317, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2152U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t7 = ((IEEE_P_2592010699) + 4024);
    t1 = xsi_base_array_concat(t1, t6, t7, (char)99, t3, (char)99, t5, (char)101);
    t8 = (t0 + 2312U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t12 = ((IEEE_P_2592010699) + 4024);
    t8 = xsi_base_array_concat(t8, t11, t12, (char)97, t1, t6, (char)99, t10, (char)101);
    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t16 = ((IEEE_P_2592010699) + 4024);
    t17 = (t0 + 10292U);
    t13 = xsi_base_array_concat(t13, t15, t16, (char)97, t8, t11, (char)97, t14, t17, (char)101);
    t18 = (t0 + 2632U);
    t19 = *((char **)t18);
    t20 = *((unsigned char *)t19);
    t22 = ((IEEE_P_2592010699) + 4024);
    t18 = xsi_base_array_concat(t18, t21, t22, (char)97, t13, t15, (char)99, t20, (char)101);
    t23 = (t0 + 2792U);
    t24 = *((char **)t23);
    t25 = *((unsigned char *)t24);
    t27 = ((IEEE_P_2592010699) + 4024);
    t23 = xsi_base_array_concat(t23, t26, t27, (char)97, t18, t21, (char)99, t25, (char)101);
    t28 = (t0 + 3112U);
    t29 = *((char **)t28);
    t30 = *((unsigned char *)t29);
    t32 = ((IEEE_P_2592010699) + 4024);
    t28 = xsi_base_array_concat(t28, t31, t32, (char)97, t23, t26, (char)99, t30, (char)101);
    t33 = (1U + 1U);
    t34 = (t33 + 1U);
    t35 = (t34 + 2U);
    t36 = (t35 + 1U);
    t37 = (t36 + 1U);
    t38 = (t37 + 1U);
    t39 = (8U != t38);
    if (t39 == 1)
        goto LAB5;

LAB6:    t40 = (t0 + 5928);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memcpy(t44, t28, 8U);
    xsi_driver_first_trans_fast(t40);

LAB2:    t45 = (t0 + 5464);
    *((int *)t45) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t38, 0);
    goto LAB6;

}


extern void work_a_2893017634_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2893017634_2372691052_p_0,(void *)work_a_2893017634_2372691052_p_1,(void *)work_a_2893017634_2372691052_p_2};
	xsi_register_didat("work_a_2893017634_2372691052", "isim/tb_main_control_unit_isim_beh.exe.sim/work/a_2893017634_2372691052.didat");
	xsi_register_executes(pe);
}
