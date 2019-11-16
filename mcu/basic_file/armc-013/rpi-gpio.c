/*
    Part of the Raspberry-Pi Bare Metal Tutorials
    https://www.valvers.com/rpi/bare-metal/
    Copyright (c) 2013-2018, Brian Sidebotham

    This software is licensed under the MIT License.
    Please see the LICENSE file included with this software.

*/

#include <stdint.h>
#include "rpi-gpio.h"

static rpi_gpio_t* rpiGpio = (rpi_gpio_t*)RPI_GPIO_BASE;

rpi_gpio_t* RPI_GetGpio(void)
{
    return rpiGpio;
}

void RPI_GpioInit(void)
{


    /*GPIO0 -> switches  */
    /* GPIO1 -> sampling sensors temperature */
    /* GPIO2 -> communicating with lcd */

 /*pin 9 ( 21 on the board) as input*/ 


	RPI_GetGpio()->GPFSEL0=0;
	


/*gpio pin 5 - 6 for communicating with sensors ( pin on boards are  29 -31 )*/




/* for lcd*/
	/* gpio pin for data:   (little endian)
			14 ( 8 )
			15  (10)
			18 (12)
			23 ( 16)
			24 (18 ) 
			25 (22)
			8  (24)
			7 (26)
		for enable
		gpio 12  ( 32)
		for rs
        gpio 16 (36)
		for read/write
		gpio 20( 38)
	*/

}



