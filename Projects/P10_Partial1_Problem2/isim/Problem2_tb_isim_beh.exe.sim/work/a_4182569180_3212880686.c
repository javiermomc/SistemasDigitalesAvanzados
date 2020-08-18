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
static const char *ng0 = "D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Projects/P10_Partial1_Problem2/Problem2.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_4182569180_3212880686_p_0(char *t0)
{
    char t7[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 4924);
    t3 = (t0 + 1488U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 4U);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 4928);
    *((int *)t1) = 7;
    t2 = (t0 + 4932);
    *((int *)t2) = 0;
    t5 = 7;
    t6 = 0;

LAB2:    if (t5 >= t6)
        goto LAB3;

LAB5:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1488U);
    t2 = *((char **)t1);
    t5 = (0 - 3);
    t12 = (t5 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t2 + t14);
    t16 = *((unsigned char *)t1);
    t23 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t16);
    t3 = (t0 + 2872);
    t4 = (t3 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t15 = *((char **)t9);
    *((unsigned char *)t15) = t23;
    xsi_driver_first_trans_fast_port(t3);
    t1 = (t0 + 2792);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 1488U);
    t4 = *((char **)t3);
    t3 = (t0 + 4888U);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 4928);
    t10 = *((int *)t8);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t8));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t15 = (t9 + t14);
    t16 = *((unsigned char *)t15);
    t17 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t7, t4, t3, t16);
    t18 = (t0 + 1488U);
    t19 = *((char **)t18);
    t18 = (t19 + 0);
    t20 = (t7 + 12U);
    t21 = *((unsigned int *)t20);
    t22 = (1U * t21);
    memcpy(t18, t17, t22);

LAB4:    t1 = (t0 + 4928);
    t5 = *((int *)t1);
    t2 = (t0 + 4932);
    t6 = *((int *)t2);
    if (t5 == t6)
        goto LAB5;

LAB6:    t10 = (t5 + -1);
    t5 = t10;
    t3 = (t0 + 4928);
    *((int *)t3) = t5;
    goto LAB2;

}


extern void work_a_4182569180_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4182569180_3212880686_p_0};
	xsi_register_didat("work_a_4182569180_3212880686", "isim/Problem2_tb_isim_beh.exe.sim/work/a_4182569180_3212880686.didat");
	xsi_register_executes(pe);
}
