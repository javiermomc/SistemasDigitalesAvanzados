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
static const char *ng0 = "D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P27_NonSignificativeZeroesCount/NonSignificativeZeroesCount.vhd";



static void work_a_2772409684_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    char *t19;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1488U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 5300);
    *((int *)t1) = 7;
    t2 = (t0 + 5304);
    *((int *)t2) = 0;
    t3 = 7;
    t4 = 0;

LAB2:    if (t3 <= t4)
        goto LAB3;

LAB5:    t1 = (t0 + 2792);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(49, ng0);
    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t5 = (t0 + 5300);
    t7 = *((int *)t5);
    t8 = (t7 - 7);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t5));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t6 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB6;

LAB8:    xsi_set_current_line(52, ng0);
    goto LAB5;

LAB4:    t1 = (t0 + 5300);
    t3 = *((int *)t1);
    t2 = (t0 + 5304);
    t4 = *((int *)t2);
    if (t3 == t4)
        goto LAB5;

LAB10:    t7 = (t3 + 1);
    t3 = t7;
    t5 = (t0 + 5300);
    *((int *)t5) = t3;
    goto LAB2;

LAB6:    xsi_set_current_line(50, ng0);
    t15 = (t0 + 1488U);
    t16 = *((char **)t15);
    t17 = *((int *)t16);
    t18 = (t17 + 1);
    t15 = (t0 + 1488U);
    t19 = *((char **)t15);
    t15 = (t19 + 0);
    *((int *)t15) = t18;

LAB7:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1488U);
    t2 = *((char **)t1);
    t7 = *((int *)t2);
    t1 = (t0 + 2872);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t12 = (t6 + 56U);
    t15 = *((char **)t12);
    *((int *)t15) = t7;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB4;

LAB9:    goto LAB7;

}


extern void work_a_2772409684_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2772409684_2372691052_p_0};
	xsi_register_didat("work_a_2772409684_2372691052", "isim/NonSignificativeZeroesCount_tb_isim_beh.exe.sim/work/a_2772409684_2372691052.didat");
	xsi_register_executes(pe);
}
