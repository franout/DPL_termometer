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
/*gpio pin 5 - 6 for communicating with sensors ( pin on boards are  29 -31 )*/

RPI_GetGpio()->GPFSEL0|=0x01248000;
	

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
	RPI_GetGpio()->GPFSEL1=0x010012000; 
	RPI_GetGpio()->GPFSEL2=;0x00009200; 




	/*clear all pin */
	RPI_GetGpio()->GPCLR0|=0xFFFFFFFF;
	RPI_GetGpio()->GPCLR1|=0x3FFFFFFF;

}

void set_pin ( int value, int pin_num) {


 if(value==1){
	if(pin_num<32) {
		RPI_GetGpio()->SET0|=(value<<pin_num);

	}else {
			RPI_GetGpio()->SET1|=(value<<(pin_num-32));
	}
}else {

		if(pin_num<32) {
	RPI_GetGpio()->GPCLR0|=(1<<pin_num);
	}else {
	RPI_GetGpio()->GPCLR1|=(1<<(pin_num-32));
	}
}


}


int get_value_pin ( int pin_num) {

		if(pin_num<32) {
	return (RPI_GetGpio()->GPLEV01>>pin_num)&0x00000001;
	}else {
	return (RPI_GetGpio()->GPLEV1>>(pin_num-32)) & 0x00000001;
	}


}
