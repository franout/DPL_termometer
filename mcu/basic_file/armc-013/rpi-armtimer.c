/*
    Part of the Raspberry-Pi Bare Metal Tutorials
    https://www.valvers.com/rpi/bare-metal/
    Copyright (c) 2013-2018, Brian Sidebotham

    This software is licensed under the MIT License.
    Please see the LICENSE file included with this software.

*/

#include <stdint.h>
#include "rpi-armtimer.h"

static rpi_arm_timer_t* rpiArmTimer = (rpi_arm_timer_t*)RPI_ARMTIMER_BASE;

rpi_arm_timer_t* RPI_GetArmTimer(void)
{
    return rpiArmTimer;
}

void RPI_ArmTimerInit(uint32_t time)
{

	  RPI_GetArmTimer()->Control = 0x00000220;

	  RPI_GetArmTimer()->IRQClear=0;
	 RPI_GetArmTimer()->PreDivider=0;

    /* Enable the timer interrupt IRQ */
    RPI_GetIrqController()->Enable_Basic_IRQs = RPI_BASIC_ARM_TIMER_IRQ;

    /* Setup the system timer interrupt */
    RPI_GetArmTimer()->Load = time;


}


    void RPI_ArmTimerEnable(void){

    		RPI_GetArmTimer()->Control|=(1<<7);

    }

    void RPI_ArmTimerStop(void) {

    	   	RPI_GetArmTimer()->Control&=~(1<<7);

    }

    void RPI_ArmTimerReset(void) {

            RPI_GetArmTimer()->Value=  RPI_GetArmTimer()->Load ;


    }