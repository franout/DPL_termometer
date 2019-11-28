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
static const char *ng0 = "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display/tb_translator.vhd";



static void work_a_2835949188_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 3840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2760);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 3840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2760);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2835949188_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    unsigned int t14;

LAB0:    t1 = (t0 + 3200U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(88, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 3008);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);

LAB10:    t2 = (t0 + 3520);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t5 = (t0 + 3520);
    *((int *)t5) = 0;
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 3968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 6844);
    t4 = (t0 + 4032);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 9U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(93, ng0);

LAB17:    t2 = (t0 + 3536);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB9:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB12;

LAB13:    t8 = (unsigned char)0;

LAB14:    if (t8 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB12:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB14;

LAB15:    t5 = (t0 + 3536);
    *((int *)t5) = 0;
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6853);
    t8 = 1;
    if (8U == 8U)
        goto LAB24;

LAB25:    t8 = 0;

LAB26:    if (t8 == 0)
        goto LAB22;

LAB23:    xsi_set_current_line(96, ng0);

LAB32:    t2 = (t0 + 3552);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB16:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB19;

LAB20:    t8 = (unsigned char)0;

LAB21:    if (t8 == 1)
        goto LAB15;
    else
        goto LAB17;

LAB18:    goto LAB16;

LAB19:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB21;

LAB22:    t12 = (t0 + 6861);
    xsi_report(t12, 10U, (unsigned char)3);
    goto LAB23;

LAB24:    t14 = 0;

LAB27:    if (t14 < 8U)
        goto LAB28;
    else
        goto LAB26;

LAB28:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB25;

LAB29:    t14 = (t14 + 1);
    goto LAB27;

LAB30:    t5 = (t0 + 3552);
    *((int *)t5) = 0;
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6871);
    t8 = 1;
    if (8U == 8U)
        goto LAB39;

LAB40:    t8 = 0;

LAB41:    if (t8 == 0)
        goto LAB37;

LAB38:    xsi_set_current_line(99, ng0);

LAB47:    t2 = (t0 + 3568);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB48;
    goto LAB1;

LAB31:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB34;

LAB35:    t8 = (unsigned char)0;

LAB36:    if (t8 == 1)
        goto LAB30;
    else
        goto LAB32;

LAB33:    goto LAB31;

LAB34:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB36;

LAB37:    t12 = (t0 + 6879);
    xsi_report(t12, 8U, (unsigned char)3);
    goto LAB38;

LAB39:    t14 = 0;

LAB42:    if (t14 < 8U)
        goto LAB43;
    else
        goto LAB41;

LAB43:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB40;

LAB44:    t14 = (t14 + 1);
    goto LAB42;

LAB45:    t5 = (t0 + 3568);
    *((int *)t5) = 0;
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6887);
    t8 = 1;
    if (8U == 8U)
        goto LAB54;

LAB55:    t8 = 0;

LAB56:    if (t8 == 0)
        goto LAB52;

LAB53:    xsi_set_current_line(102, ng0);

LAB62:    t2 = (t0 + 3584);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB46:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB49;

LAB50:    t8 = (unsigned char)0;

LAB51:    if (t8 == 1)
        goto LAB45;
    else
        goto LAB47;

LAB48:    goto LAB46;

LAB49:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB51;

LAB52:    t12 = (t0 + 6895);
    xsi_report(t12, 8U, (unsigned char)3);
    goto LAB53;

LAB54:    t14 = 0;

LAB57:    if (t14 < 8U)
        goto LAB58;
    else
        goto LAB56;

LAB58:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB55;

LAB59:    t14 = (t14 + 1);
    goto LAB57;

LAB60:    t5 = (t0 + 3584);
    *((int *)t5) = 0;
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6903);
    t8 = 1;
    if (8U == 8U)
        goto LAB69;

LAB70:    t8 = 0;

LAB71:    if (t8 == 0)
        goto LAB67;

LAB68:    xsi_set_current_line(106, ng0);

LAB77:    t2 = (t0 + 3600);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB78;
    goto LAB1;

LAB61:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB64;

LAB65:    t8 = (unsigned char)0;

LAB66:    if (t8 == 1)
        goto LAB60;
    else
        goto LAB62;

LAB63:    goto LAB61;

LAB64:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB66;

LAB67:    t12 = (t0 + 6911);
    xsi_report(t12, 8U, (unsigned char)3);
    goto LAB68;

LAB69:    t14 = 0;

LAB72:    if (t14 < 8U)
        goto LAB73;
    else
        goto LAB71;

LAB73:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB70;

LAB74:    t14 = (t14 + 1);
    goto LAB72;

LAB75:    t5 = (t0 + 3600);
    *((int *)t5) = 0;
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6919);
    t8 = 1;
    if (8U == 8U)
        goto LAB84;

LAB85:    t8 = 0;

LAB86:    if (t8 == 0)
        goto LAB82;

LAB83:    xsi_set_current_line(110, ng0);

LAB92:    t2 = (t0 + 3616);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB93;
    goto LAB1;

LAB76:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB79;

LAB80:    t8 = (unsigned char)0;

LAB81:    if (t8 == 1)
        goto LAB75;
    else
        goto LAB77;

LAB78:    goto LAB76;

LAB79:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB81;

LAB82:    t12 = (t0 + 6927);
    xsi_report(t12, 9U, (unsigned char)3);
    goto LAB83;

LAB84:    t14 = 0;

LAB87:    if (t14 < 8U)
        goto LAB88;
    else
        goto LAB86;

LAB88:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB85;

LAB89:    t14 = (t14 + 1);
    goto LAB87;

LAB90:    t5 = (t0 + 3616);
    *((int *)t5) = 0;
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6936);
    t8 = 1;
    if (8U == 8U)
        goto LAB99;

LAB100:    t8 = 0;

LAB101:    if (t8 == 0)
        goto LAB97;

LAB98:    xsi_set_current_line(114, ng0);

LAB107:    t2 = (t0 + 3632);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB108;
    goto LAB1;

LAB91:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB94;

LAB95:    t8 = (unsigned char)0;

LAB96:    if (t8 == 1)
        goto LAB90;
    else
        goto LAB92;

LAB93:    goto LAB91;

LAB94:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB96;

LAB97:    t12 = (t0 + 6944);
    xsi_report(t12, 9U, (unsigned char)3);
    goto LAB98;

LAB99:    t14 = 0;

LAB102:    if (t14 < 8U)
        goto LAB103;
    else
        goto LAB101;

LAB103:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB100;

LAB104:    t14 = (t14 + 1);
    goto LAB102;

LAB105:    t5 = (t0 + 3632);
    *((int *)t5) = 0;
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 3968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 6953);
    t4 = (t0 + 4032);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 9U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(118, ng0);

LAB114:    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB115;
    goto LAB1;

LAB106:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB109;

LAB110:    t8 = (unsigned char)0;

LAB111:    if (t8 == 1)
        goto LAB105;
    else
        goto LAB107;

LAB108:    goto LAB106;

LAB109:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB111;

LAB112:    t5 = (t0 + 3648);
    *((int *)t5) = 0;
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 3968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);

LAB121:    t2 = (t0 + 3664);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB122;
    goto LAB1;

LAB113:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB116;

LAB117:    t8 = (unsigned char)0;

LAB118:    if (t8 == 1)
        goto LAB112;
    else
        goto LAB114;

LAB115:    goto LAB113;

LAB116:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB118;

LAB119:    t5 = (t0 + 3664);
    *((int *)t5) = 0;
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6962);
    t8 = 1;
    if (8U == 8U)
        goto LAB128;

LAB129:    t8 = 0;

LAB130:    if (t8 == 0)
        goto LAB126;

LAB127:    xsi_set_current_line(123, ng0);

LAB136:    t2 = (t0 + 3680);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB137;
    goto LAB1;

LAB120:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB123;

LAB124:    t8 = (unsigned char)0;

LAB125:    if (t8 == 1)
        goto LAB119;
    else
        goto LAB121;

LAB122:    goto LAB120;

LAB123:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB125;

LAB126:    t12 = (t0 + 6970);
    xsi_report(t12, 10U, (unsigned char)3);
    goto LAB127;

LAB128:    t14 = 0;

LAB131:    if (t14 < 8U)
        goto LAB132;
    else
        goto LAB130;

LAB132:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB129;

LAB133:    t14 = (t14 + 1);
    goto LAB131;

LAB134:    t5 = (t0 + 3680);
    *((int *)t5) = 0;
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6980);
    t8 = 1;
    if (8U == 8U)
        goto LAB143;

LAB144:    t8 = 0;

LAB145:    if (t8 == 0)
        goto LAB141;

LAB142:    xsi_set_current_line(126, ng0);

LAB151:    t2 = (t0 + 3696);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB152;
    goto LAB1;

LAB135:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB138;

LAB139:    t8 = (unsigned char)0;

LAB140:    if (t8 == 1)
        goto LAB134;
    else
        goto LAB136;

LAB137:    goto LAB135;

LAB138:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB140;

LAB141:    t12 = (t0 + 6988);
    xsi_report(t12, 9U, (unsigned char)3);
    goto LAB142;

LAB143:    t14 = 0;

LAB146:    if (t14 < 8U)
        goto LAB147;
    else
        goto LAB145;

LAB147:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB144;

LAB148:    t14 = (t14 + 1);
    goto LAB146;

LAB149:    t5 = (t0 + 3696);
    *((int *)t5) = 0;
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6997);
    t8 = 1;
    if (8U == 8U)
        goto LAB158;

LAB159:    t8 = 0;

LAB160:    if (t8 == 0)
        goto LAB156;

LAB157:    xsi_set_current_line(129, ng0);

LAB166:    t2 = (t0 + 3712);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB167;
    goto LAB1;

LAB150:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB153;

LAB154:    t8 = (unsigned char)0;

LAB155:    if (t8 == 1)
        goto LAB149;
    else
        goto LAB151;

LAB152:    goto LAB150;

LAB153:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB155;

LAB156:    t12 = (t0 + 7005);
    xsi_report(t12, 8U, (unsigned char)3);
    goto LAB157;

LAB158:    t14 = 0;

LAB161:    if (t14 < 8U)
        goto LAB162;
    else
        goto LAB160;

LAB162:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB159;

LAB163:    t14 = (t14 + 1);
    goto LAB161;

LAB164:    t5 = (t0 + 3712);
    *((int *)t5) = 0;
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 7013);
    t8 = 1;
    if (8U == 8U)
        goto LAB173;

LAB174:    t8 = 0;

LAB175:    if (t8 == 0)
        goto LAB171;

LAB172:    xsi_set_current_line(133, ng0);

LAB181:    t2 = (t0 + 3728);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB182;
    goto LAB1;

LAB165:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB168;

LAB169:    t8 = (unsigned char)0;

LAB170:    if (t8 == 1)
        goto LAB164;
    else
        goto LAB166;

LAB167:    goto LAB165;

LAB168:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB170;

LAB171:    t12 = (t0 + 7021);
    xsi_report(t12, 8U, (unsigned char)3);
    goto LAB172;

LAB173:    t14 = 0;

LAB176:    if (t14 < 8U)
        goto LAB177;
    else
        goto LAB175;

LAB177:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB174;

LAB178:    t14 = (t14 + 1);
    goto LAB176;

LAB179:    t5 = (t0 + 3728);
    *((int *)t5) = 0;
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 7029);
    t8 = 1;
    if (8U == 8U)
        goto LAB188;

LAB189:    t8 = 0;

LAB190:    if (t8 == 0)
        goto LAB186;

LAB187:    xsi_set_current_line(137, ng0);

LAB196:    t2 = (t0 + 3744);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB197;
    goto LAB1;

LAB180:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB183;

LAB184:    t8 = (unsigned char)0;

LAB185:    if (t8 == 1)
        goto LAB179;
    else
        goto LAB181;

LAB182:    goto LAB180;

LAB183:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB185;

LAB186:    t12 = (t0 + 7037);
    xsi_report(t12, 9U, (unsigned char)3);
    goto LAB187;

LAB188:    t14 = 0;

LAB191:    if (t14 < 8U)
        goto LAB192;
    else
        goto LAB190;

LAB192:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB189;

LAB193:    t14 = (t14 + 1);
    goto LAB191;

LAB194:    t5 = (t0 + 3744);
    *((int *)t5) = 0;
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 7046);
    t8 = 1;
    if (8U == 8U)
        goto LAB203;

LAB204:    t8 = 0;

LAB205:    if (t8 == 0)
        goto LAB201;

LAB202:    xsi_set_current_line(141, ng0);

LAB211:    t2 = (t0 + 3760);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB212;
    goto LAB1;

LAB195:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB198;

LAB199:    t8 = (unsigned char)0;

LAB200:    if (t8 == 1)
        goto LAB194;
    else
        goto LAB196;

LAB197:    goto LAB195;

LAB198:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB200;

LAB201:    t12 = (t0 + 7054);
    xsi_report(t12, 13U, (unsigned char)3);
    goto LAB202;

LAB203:    t14 = 0;

LAB206:    if (t14 < 8U)
        goto LAB207;
    else
        goto LAB205;

LAB207:    t5 = (t3 + t14);
    t6 = (t2 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB204;

LAB208:    t14 = (t14 + 1);
    goto LAB206;

LAB209:    t5 = (t0 + 3760);
    *((int *)t5) = 0;
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 3968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(144, ng0);

LAB218:    *((char **)t1) = &&LAB219;
    goto LAB1;

LAB210:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB213;

LAB214:    t8 = (unsigned char)0;

LAB215:    if (t8 == 1)
        goto LAB209;
    else
        goto LAB211;

LAB212:    goto LAB210;

LAB213:    t3 = (t0 + 1152U);
    t11 = xsi_signal_has_event(t3);
    t8 = t11;
    goto LAB215;

LAB216:    goto LAB2;

LAB217:    goto LAB216;

LAB219:    goto LAB217;

}


extern void work_a_2835949188_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2835949188_2372691052_p_0,(void *)work_a_2835949188_2372691052_p_1};
	xsi_register_didat("work_a_2835949188_2372691052", "isim/tb_translator_isim_beh.exe.sim/work/a_2835949188_2372691052.didat");
	xsi_register_executes(pe);
}
