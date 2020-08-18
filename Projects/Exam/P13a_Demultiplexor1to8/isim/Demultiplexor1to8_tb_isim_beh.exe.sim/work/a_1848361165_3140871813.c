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
static const char *ng0 = "D:/ProySisDigAva/P13a_Demultiplexor1to8/Demultiplexor1to8.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1848361165_3140871813_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    unsigned char t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 4680);
    *((int *)t1) = 7;
    t2 = (t0 + 4684);
    *((int *)t2) = 0;
    t3 = 7;
    t4 = 0;

LAB2:    if (t3 >= t4)
        goto LAB3;

LAB5:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(83, ng0);
    t5 = (t0 + 4680);
    t6 = (t0 + 1192U);
    t7 = *((char **)t6);
    t6 = (t0 + 4636U);
    t8 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t7, t6);
    t9 = *((int *)t5);
    t10 = (t9 == t8);
    if (t10 != 0)
        goto LAB6;

LAB8:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 4680);
    t8 = *((int *)t1);
    t9 = (t8 - 7);
    t16 = (t9 * -1);
    t17 = (1 * t16);
    t18 = (0U + t17);
    t2 = (t0 + 2912);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, t18, 1, 0LL);

LAB7:
LAB4:    t1 = (t0 + 4680);
    t3 = *((int *)t1);
    t2 = (t0 + 4684);
    t4 = *((int *)t2);
    if (t3 == t4)
        goto LAB5;

LAB9:    t8 = (t3 + -1);
    t3 = t8;
    t5 = (t0 + 4680);
    *((int *)t5) = t3;
    goto LAB2;

LAB6:    xsi_set_current_line(84, ng0);
    t11 = (t0 + 1032U);
    t12 = *((char **)t11);
    t13 = *((unsigned char *)t12);
    t11 = (t0 + 4680);
    t14 = *((int *)t11);
    t15 = (t14 - 7);
    t16 = (t15 * -1);
    t17 = (1 * t16);
    t18 = (0U + t17);
    t19 = (t0 + 2912);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t13;
    xsi_driver_first_trans_delta(t19, t18, 1, 0LL);
    goto LAB7;

}


extern void work_a_1848361165_3140871813_init()
{
	static char *pe[] = {(void *)work_a_1848361165_3140871813_p_0};
	xsi_register_didat("work_a_1848361165_3140871813", "isim/Demultiplexor1to8_tb_isim_beh.exe.sim/work/a_1848361165_3140871813.didat");
	xsi_register_executes(pe);
}
