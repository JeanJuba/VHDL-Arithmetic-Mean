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

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Usuario/Desktop/calc_media_arit/memoria.vhd";



static void work_a_3276747723_3212880686_p_0(char *t0)
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
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned char t18;
    int t19;

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = xsi_signal_has_event(t1);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4048);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 6884);
    t6 = (t0 + 4160);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 4224);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 2128U);
    t5 = *((char **)t2);
    t2 = (t0 + 2248U);
    t6 = *((char **)t2);
    t11 = *((int *)t6);
    t12 = (t11 - 0);
    t13 = (t12 * 1);
    xsi_vhdl_check_range_of_index(0, 4, 1, t11);
    t14 = (8U * t13);
    t15 = (0 + t14);
    t2 = (t5 + t15);
    t7 = (t0 + 4160);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t16 = *((char **)t10);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 6892);
    t3 = 1;
    if (8U == 8U)
        goto LAB10;

LAB11:    t3 = 0;

LAB12:    if (t3 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 4224);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB8:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB3;

LAB7:    xsi_set_current_line(50, ng0);
    t8 = (t0 + 4224);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast(t8);
    goto LAB8;

LAB10:    t13 = 0;

LAB13:    if (t13 < 8U)
        goto LAB14;
    else
        goto LAB12;

LAB14:    t6 = (t2 + t13);
    t7 = (t1 + t13);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB11;

LAB15:    t13 = (t13 + 1);
    goto LAB13;

LAB16:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 2248U);
    t5 = *((char **)t1);
    t11 = *((int *)t5);
    t18 = (t11 < 4);
    if (t18 != 0)
        goto LAB19;

LAB21:
LAB20:    goto LAB17;

LAB19:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2248U);
    t6 = *((char **)t1);
    t12 = *((int *)t6);
    t19 = (t12 + 1);
    t1 = (t0 + 2248U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = t19;
    goto LAB20;

}

static void work_a_3276747723_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(63, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 4288);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4064);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3276747723_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(64, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4352);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4080);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3276747723_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3276747723_3212880686_p_0,(void *)work_a_3276747723_3212880686_p_1,(void *)work_a_3276747723_3212880686_p_2};
	xsi_register_didat("work_a_3276747723_3212880686", "isim/maquina_tb_isim_beh.exe.sim/work/a_3276747723_3212880686.didat");
	xsi_register_executes(pe);
}
