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
static const char *ng0 = "C:/Users/Sebastian/Documents/workspace/Contador7Segmentos/FrecuencyDivider.v";
static unsigned int ng1[] = {99999998U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {50000000U, 0U};
static int ng5[] = {0, 0};



static void Always_34_0(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1608);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB6:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) > *((unsigned int *)t7))
        goto LAB8;

LAB9:    t12 = (t8 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB16;

LAB15:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB16;

LAB19:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB17;

LAB18:    t10 = (t8 + 4);
    t13 = *((unsigned int *)t10);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(49, ng0);

LAB24:    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 27, t5, 32);
    t6 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 27, 0LL);

LAB22:
LAB13:    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(39, ng0);

LAB14:    xsi_set_current_line(40, ng0);
    t18 = ((char*)((ng2)));
    t19 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 27, 0LL);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB13;

LAB16:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB18;

LAB17:    *((unsigned int *)t8) = 1;
    goto LAB18;

LAB20:    xsi_set_current_line(44, ng0);

LAB23:    xsi_set_current_line(45, ng0);
    t11 = ((char*)((ng5)));
    t12 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 27, t5, 32);
    t6 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 27, 0LL);
    goto LAB22;

}


extern void work_m_00000000000544325815_1287396606_init()
{
	static char *pe[] = {(void *)Always_34_0};
	xsi_register_didat("work_m_00000000000544325815_1287396606", "isim/DividerTest_isim_beh.exe.sim/work/m_00000000000544325815_1287396606.didat");
	xsi_register_executes(pe);
}
