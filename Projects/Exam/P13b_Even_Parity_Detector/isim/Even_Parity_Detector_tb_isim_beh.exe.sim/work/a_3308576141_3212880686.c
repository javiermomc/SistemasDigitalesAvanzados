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
static const char *ng0 = "D:/ProySisDigAva/P13b_Even_Parity_Detector/Even_Parity_Detector.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_3308576141_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    int t12;
    int t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (7 - 7);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 1648U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    *((unsigned char *)t8) = t7;
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 6;
    xsi_set_current_line(61, ng0);

LAB2:    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t7 = (t3 >= 0);
    if (t7 != 0)
        goto LAB3;

LAB5:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t10 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t7);
    t1 = (t0 + 3152);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t16 = *((char **)t11);
    *((unsigned char *)t16) = t10;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3072);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1648U);
    t8 = *((char **)t1);
    t10 = *((unsigned char *)t8);
    t1 = (t0 + 1032U);
    t9 = *((char **)t1);
    t1 = (t0 + 1768U);
    t11 = *((char **)t1);
    t12 = *((int *)t11);
    t13 = (t12 - 7);
    t4 = (t13 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t12);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t9 + t6);
    t14 = *((unsigned char *)t1);
    t15 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t10, t14);
    t16 = (t0 + 1648U);
    t17 = *((char **)t16);
    t16 = (t17 + 0);
    *((unsigned char *)t16) = t15;
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t12 = (t3 - 1);
    t1 = (t0 + 1768U);
    t8 = *((char **)t1);
    t1 = (t8 + 0);
    *((int *)t1) = t12;
    goto LAB2;

LAB4:;
}


extern void work_a_3308576141_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3308576141_3212880686_p_0};
	xsi_register_didat("work_a_3308576141_3212880686", "isim/Even_Parity_Detector_tb_isim_beh.exe.sim/work/a_3308576141_3212880686.didat");
	xsi_register_executes(pe);
}
