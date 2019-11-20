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

LAB0:    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 5144);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4040);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 5144);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4040);
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

LAB0:    t1 = (t0 + 4480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 9576);
    *((int *)t2) = 0;
    t3 = (t0 + 9580);
    *((int *)t3) = 5;
    t7 = 0;
    t8 = 5;

LAB4:    if (t7 <= t8)
        goto LAB5;

LAB7:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9584);
    t9 = 1;
    if (7U == 7U)
        goto LAB18;

LAB19:    t9 = 0;

LAB20:    if (t9 == 0)
        goto LAB16;

LAB17:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t18 = (t17 * 10);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t18);

LAB26:    *((char **)t1) = &&LAB27;

LAB1:    return;
LAB5:    xsi_set_current_line(114, ng0);

LAB10:    t4 = (t0 + 5048);
    *((int *)t4) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 9576);
    t7 = *((int *)t2);
    t3 = (t0 + 9580);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB7;

LAB15:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 9576);
    *((int *)t4) = t7;
    goto LAB4;

LAB8:    t13 = (t0 + 5048);
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

LAB16:    t13 = (t0 + 9591);
    xsi_report(t13, 28U, (unsigned char)3);
    goto LAB17;

LAB18:    t15 = 0;

LAB21:    if (t15 < 7U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB19;

LAB23:    t15 = (t15 + 1);
    goto LAB21;

LAB24:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9619);
    t9 = 1;
    if (7U == 7U)
        goto LAB34;

LAB35:    t9 = 0;

LAB36:    if (t9 == 0)
        goto LAB32;

LAB33:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    t13 = (t0 + 9626);
    xsi_report(t13, 42U, (unsigned char)3);
    goto LAB33;

LAB34:    t15 = 0;

LAB37:    if (t15 < 7U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB35;

LAB39:    t15 = (t15 + 1);
    goto LAB37;

LAB40:    xsi_set_current_line(133, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9668);
    t9 = 1;
    if (7U == 7U)
        goto LAB46;

LAB47:    t9 = 0;

LAB48:    if (t9 == 0)
        goto LAB44;

LAB45:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 9727);
    *((int *)t2) = 0;
    t3 = (t0 + 9731);
    *((int *)t3) = 5;
    t7 = 0;
    t8 = 5;

LAB52:    if (t7 <= t8)
        goto LAB53;

LAB55:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9735);
    t9 = 1;
    if (7U == 7U)
        goto LAB63;

LAB64:    t9 = 0;

LAB65:    if (t9 == 0)
        goto LAB61;

LAB62:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB71:    *((char **)t1) = &&LAB72;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    t13 = (t0 + 9675);
    xsi_report(t13, 52U, (unsigned char)3);
    goto LAB45;

LAB46:    t15 = 0;

LAB49:    if (t15 < 7U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB47;

LAB51:    t15 = (t15 + 1);
    goto LAB49;

LAB53:    xsi_set_current_line(141, ng0);
    t4 = (t0 + 3248U);
    t5 = *((char **)t4);
    t17 = *((int64 *)t5);
    t4 = (t0 + 4288);
    xsi_process_wait(t4, t17);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB54:    t2 = (t0 + 9727);
    t7 = *((int *)t2);
    t3 = (t0 + 9731);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB55;

LAB60:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 9727);
    *((int *)t4) = t7;
    goto LAB52;

LAB56:    goto LAB54;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB61:    t13 = (t0 + 9742);
    xsi_report(t13, 34U, (unsigned char)3);
    goto LAB62;

LAB63:    t15 = 0;

LAB66:    if (t15 < 7U)
        goto LAB67;
    else
        goto LAB65;

LAB67:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB64;

LAB68:    t15 = (t15 + 1);
    goto LAB66;

LAB69:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9776);
    t9 = 1;
    if (7U == 7U)
        goto LAB75;

LAB76:    t9 = 0;

LAB77:    if (t9 == 0)
        goto LAB73;

LAB74:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB83:    *((char **)t1) = &&LAB84;
    goto LAB1;

LAB70:    goto LAB69;

LAB72:    goto LAB70;

LAB73:    t13 = (t0 + 9783);
    xsi_report(t13, 17U, (unsigned char)3);
    goto LAB74;

LAB75:    t15 = 0;

LAB78:    if (t15 < 7U)
        goto LAB79;
    else
        goto LAB77;

LAB79:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB76;

LAB80:    t15 = (t15 + 1);
    goto LAB78;

LAB81:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9800);
    t9 = 1;
    if (7U == 7U)
        goto LAB87;

LAB88:    t9 = 0;

LAB89:    if (t9 == 0)
        goto LAB85;

LAB86:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(166, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(167, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 9838);
    *((int *)t2) = 0;
    t3 = (t0 + 9842);
    *((int *)t3) = 5;
    t7 = 0;
    t8 = 5;

LAB93:    if (t7 <= t8)
        goto LAB94;

LAB96:    xsi_set_current_line(171, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9846);
    t9 = 1;
    if (7U == 7U)
        goto LAB104;

LAB105:    t9 = 0;

LAB106:    if (t9 == 0)
        goto LAB102;

LAB103:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(178, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(183, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB112:    *((char **)t1) = &&LAB113;
    goto LAB1;

LAB82:    goto LAB81;

LAB84:    goto LAB82;

LAB85:    t13 = (t0 + 9807);
    xsi_report(t13, 31U, (unsigned char)3);
    goto LAB86;

LAB87:    t15 = 0;

LAB90:    if (t15 < 7U)
        goto LAB91;
    else
        goto LAB89;

LAB91:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB88;

LAB92:    t15 = (t15 + 1);
    goto LAB90;

LAB94:    xsi_set_current_line(169, ng0);
    t4 = (t0 + 3248U);
    t5 = *((char **)t4);
    t17 = *((int64 *)t5);
    t4 = (t0 + 4288);
    xsi_process_wait(t4, t17);

LAB99:    *((char **)t1) = &&LAB100;
    goto LAB1;

LAB95:    t2 = (t0 + 9838);
    t7 = *((int *)t2);
    t3 = (t0 + 9842);
    t8 = *((int *)t3);
    if (t7 == t8)
        goto LAB96;

LAB101:    t14 = (t7 + 1);
    t7 = t14;
    t4 = (t0 + 9838);
    *((int *)t4) = t7;
    goto LAB93;

LAB97:    goto LAB95;

LAB98:    goto LAB97;

LAB100:    goto LAB98;

LAB102:    t13 = (t0 + 9853);
    xsi_report(t13, 23U, (unsigned char)3);
    goto LAB103;

LAB104:    t15 = 0;

LAB107:    if (t15 < 7U)
        goto LAB108;
    else
        goto LAB106;

LAB108:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB105;

LAB109:    t15 = (t15 + 1);
    goto LAB107;

LAB110:    xsi_set_current_line(185, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9876);
    t9 = 1;
    if (7U == 7U)
        goto LAB116;

LAB117:    t9 = 0;

LAB118:    if (t9 == 0)
        goto LAB114;

LAB115:    xsi_set_current_line(189, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(190, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(191, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(192, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(193, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(196, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB124:    *((char **)t1) = &&LAB125;
    goto LAB1;

LAB111:    goto LAB110;

LAB113:    goto LAB111;

LAB114:    t13 = (t0 + 9883);
    xsi_report(t13, 23U, (unsigned char)3);
    goto LAB115;

LAB116:    t15 = 0;

LAB119:    if (t15 < 7U)
        goto LAB120;
    else
        goto LAB118;

LAB120:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB117;

LAB121:    t15 = (t15 + 1);
    goto LAB119;

LAB122:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9906);
    t9 = 1;
    if (7U == 7U)
        goto LAB128;

LAB129:    t9 = 0;

LAB130:    if (t9 == 0)
        goto LAB126;

LAB127:    xsi_set_current_line(200, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(202, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(203, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(204, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(205, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB136:    *((char **)t1) = &&LAB137;
    goto LAB1;

LAB123:    goto LAB122;

LAB125:    goto LAB123;

LAB126:    t13 = (t0 + 9913);
    xsi_report(t13, 24U, (unsigned char)3);
    goto LAB127;

LAB128:    t15 = 0;

LAB131:    if (t15 < 7U)
        goto LAB132;
    else
        goto LAB130;

LAB132:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB129;

LAB133:    t15 = (t15 + 1);
    goto LAB131;

LAB134:    xsi_set_current_line(207, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9937);
    t9 = 1;
    if (7U == 7U)
        goto LAB140;

LAB141:    t9 = 0;

LAB142:    if (t9 == 0)
        goto LAB138;

LAB139:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(212, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(213, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(214, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB148:    *((char **)t1) = &&LAB149;
    goto LAB1;

LAB135:    goto LAB134;

LAB137:    goto LAB135;

LAB138:    t13 = (t0 + 9944);
    xsi_report(t13, 24U, (unsigned char)3);
    goto LAB139;

LAB140:    t15 = 0;

LAB143:    if (t15 < 7U)
        goto LAB144;
    else
        goto LAB142;

LAB144:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB141;

LAB145:    t15 = (t15 + 1);
    goto LAB143;

LAB146:    xsi_set_current_line(218, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9968);
    t9 = 1;
    if (7U == 7U)
        goto LAB152;

LAB153:    t9 = 0;

LAB154:    if (t9 == 0)
        goto LAB150;

LAB151:    xsi_set_current_line(225, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(226, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(227, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(228, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(229, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(231, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB160:    *((char **)t1) = &&LAB161;
    goto LAB1;

LAB147:    goto LAB146;

LAB149:    goto LAB147;

LAB150:    t13 = (t0 + 9975);
    xsi_report(t13, 19U, (unsigned char)3);
    goto LAB151;

LAB152:    t15 = 0;

LAB155:    if (t15 < 7U)
        goto LAB156;
    else
        goto LAB154;

LAB156:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB153;

LAB157:    t15 = (t15 + 1);
    goto LAB155;

LAB158:    xsi_set_current_line(232, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 9994);
    t9 = 1;
    if (7U == 7U)
        goto LAB164;

LAB165:    t9 = 0;

LAB166:    if (t9 == 0)
        goto LAB162;

LAB163:    xsi_set_current_line(236, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(237, ng0);
    t2 = (t0 + 5272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(238, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(239, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(240, ng0);
    t2 = (t0 + 5464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(242, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB172:    *((char **)t1) = &&LAB173;
    goto LAB1;

LAB159:    goto LAB158;

LAB161:    goto LAB159;

LAB162:    t13 = (t0 + 10001);
    xsi_report(t13, 19U, (unsigned char)3);
    goto LAB163;

LAB164:    t15 = 0;

LAB167:    if (t15 < 7U)
        goto LAB168;
    else
        goto LAB166;

LAB168:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB165;

LAB169:    t15 = (t15 + 1);
    goto LAB167;

LAB170:    xsi_set_current_line(243, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10020);
    t9 = 1;
    if (7U == 7U)
        goto LAB176;

LAB177:    t9 = 0;

LAB178:    if (t9 == 0)
        goto LAB174;

LAB175:    xsi_set_current_line(246, ng0);
    t2 = (t0 + 5400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(249, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t17 = *((int64 *)t3);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t17);

LAB184:    *((char **)t1) = &&LAB185;
    goto LAB1;

LAB171:    goto LAB170;

LAB173:    goto LAB171;

LAB174:    t13 = (t0 + 10027);
    xsi_report(t13, 20U, (unsigned char)3);
    goto LAB175;

LAB176:    t15 = 0;

LAB179:    if (t15 < 7U)
        goto LAB180;
    else
        goto LAB178;

LAB180:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB177;

LAB181:    t15 = (t15 + 1);
    goto LAB179;

LAB182:    xsi_set_current_line(250, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 10047);
    t9 = 1;
    if (7U == 7U)
        goto LAB188;

LAB189:    t9 = 0;

LAB190:    if (t9 == 0)
        goto LAB186;

LAB187:    xsi_set_current_line(254, ng0);

LAB196:    *((char **)t1) = &&LAB197;
    goto LAB1;

LAB183:    goto LAB182;

LAB185:    goto LAB183;

LAB186:    t13 = (t0 + 10054);
    xsi_report(t13, 17U, (unsigned char)3);
    goto LAB187;

LAB188:    t15 = 0;

LAB191:    if (t15 < 7U)
        goto LAB192;
    else
        goto LAB190;

LAB192:    t5 = (t3 + t15);
    t6 = (t2 + t15);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB189;

LAB193:    t15 = (t15 + 1);
    goto LAB191;

LAB194:    goto LAB2;

LAB195:    goto LAB194;

LAB197:    goto LAB195;

}

static void work_a_2893017634_2372691052_p_2(char *t0)
{
    char t6[16];
    char t11[16];
    char t15[16];
    char t21[16];
    char t26[16];
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
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    xsi_set_current_line(258, ng0);

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
    t17 = (t0 + 9504U);
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
    t28 = (1U + 1U);
    t29 = (t28 + 1U);
    t30 = (t29 + 2U);
    t31 = (t30 + 1U);
    t32 = (t31 + 1U);
    t33 = (7U != t32);
    if (t33 == 1)
        goto LAB5;

LAB6:    t34 = (t0 + 5528);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t23, 7U);
    xsi_driver_first_trans_fast(t34);

LAB2:    t39 = (t0 + 5064);
    *((int *)t39) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(7U, t32, 0);
    goto LAB6;

}


extern void work_a_2893017634_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2893017634_2372691052_p_0,(void *)work_a_2893017634_2372691052_p_1,(void *)work_a_2893017634_2372691052_p_2};
	xsi_register_didat("work_a_2893017634_2372691052", "isim/tb_main_control_unit_isim_beh.exe.sim/work/a_2893017634_2372691052.didat");
	xsi_register_executes(pe);
}
