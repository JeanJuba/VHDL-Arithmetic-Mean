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
static const char *ng0 = "C:/Users/Usuario/Desktop/calc_media_arit/alu.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t8[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5438);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB6:    t5 = (t0 + 5440);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB7:
LAB5:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 3496);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    memcpy(t9, t2, 8U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t1 = (t0 + 3400);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(48, ng0);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t9 = (t0 + 5324U);
    t11 = (t0 + 1192U);
    t12 = *((char **)t11);
    t11 = (t0 + 5340U);
    t13 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t8, t10, t9, t12, t11);
    t14 = (t8 + 12U);
    t15 = *((unsigned int *)t14);
    t16 = (1U * t15);
    t17 = (8U != t16);
    if (t17 == 1)
        goto LAB9;

LAB10:    t18 = (t0 + 3496);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t13, 8U);
    xsi_driver_first_trans_fast(t18);
    goto LAB2;

LAB4:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5324U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5340U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t8, t2, t1, t5, t3);
    t9 = (t8 + 12U);
    t15 = *((unsigned int *)t9);
    t16 = (1U * t15);
    t17 = (8U != t16);
    if (t17 == 1)
        goto LAB11;

LAB12:    t10 = (t0 + 3496);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t6, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB2;

LAB8:;
LAB9:    xsi_size_not_matching(8U, t16, 0);
    goto LAB10;

LAB11:    xsi_size_not_matching(8U, t16, 0);
    goto LAB12;

}

static void work_a_0832606739_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3560);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3416);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0,(void *)work_a_0832606739_3212880686_p_1};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/maquina_tb_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
