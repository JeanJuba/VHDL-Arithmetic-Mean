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
    unsigned char t11;
    unsigned char t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    int t20;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 5972);
    t5 = (t0 + 3472);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 3392);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 5956);
    t6 = (t0 + 3472);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1968U);
    t6 = *((char **)t2);
    t2 = (t0 + 2088U);
    t7 = *((char **)t2);
    t13 = *((int *)t7);
    t14 = (t13 - 0);
    t15 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 4, 1, t13);
    t16 = (8U * t15);
    t17 = (0 + t16);
    t2 = (t6 + t17);
    t8 = (t0 + 3600);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t18 = (t10 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t2, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 5964);
    t3 = 1;
    if (8U == 8U)
        goto LAB13;

LAB14:    t3 = 0;

LAB15:    if (t3 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB11:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3472);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    t13 = *((int *)t2);
    t3 = (t13 < 4);
    if (t3 != 0)
        goto LAB19;

LAB21:
LAB20:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(59, ng0);
    t8 = (t0 + 3536);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t18 = (t10 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB11;

LAB13:    t15 = 0;

LAB16:    if (t15 < 8U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t6 = (t2 + t15);
    t7 = (t1 + t15);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB14;

LAB18:    t15 = (t15 + 1);
    goto LAB16;

LAB19:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2088U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t20 = (t14 + 1);
    t1 = (t0 + 2088U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((int *)t1) = t20;
    goto LAB20;

}


extern void work_a_3276747723_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3276747723_3212880686_p_0};
	xsi_register_didat("work_a_3276747723_3212880686", "isim/memoria_tb_isim_beh.exe.sim/work/a_3276747723_3212880686.didat");
	xsi_register_executes(pe);
}
