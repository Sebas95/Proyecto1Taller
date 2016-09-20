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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002568855208_2471391207_init();
    work_m_00000000001079929347_2203017034_init();
    work_m_00000000001041789655_1672116380_init();
    work_m_00000000000544325815_1287396606_init();
    work_m_00000000002275759708_3719611828_init();
    work_m_00000000003786273070_4245653546_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003786273070_4245653546");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
