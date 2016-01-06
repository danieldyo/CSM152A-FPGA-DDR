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
    work_m_00000000003432625885_1208434039_init();
    work_m_00000000001435810431_2178944355_init();
    work_m_00000000001153383559_1463512774_init();
    work_m_00000000003516009634_3823007873_init();
    work_m_00000000003930181177_3466733168_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003930181177_3466733168");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
