/*
    Part of the Raspberry-Pi Bare Metal Tutorials
    https://www.valvers.com/rpi/bare-metal/
    Copyright (c) 2013-2018, Brian Sidebotham

    This software is licensed under the MIT License.
    Please see the LICENSE file included with this software.

*/

#include <string.h>
#include <stdlib.h>
#include <stddef.h>

#include "rpi-gpio.h"
#include "rpi-armtimer.h"
#include "rpi-systimer.h"
#include "rpi-interrupts.h"
#include "temp_sensor.h"




extern void _enable_interrupts(void);
extern void _disable_interrupts(void);

/*static functions*/
static void TMP_Sensor_Init(void);
static void Display_Init(void);

/** Main function - we'll never return from here */
void kernel_main( unsigned int r0, unsigned int r1, unsigned int atags )
{
    
    /*GPIO0 -> switches  */
    /* GPIO1 -> sampling sensors temperature */
    /* GPIO2 -> communicating with lcd */


    /*enable GPIO with proper direction */
    RPI_GpioInit();

      /* Setup the ARM Timer for debouncing */
    RPI_ArmTimerInit(0x0000C350); // 50 ms

    TMP_Sensor_Init();
    Display_Init();        
    /* Enable interrupts! */
    _enable_interrupts();
    RPI_ArmTimerEnable();
    
    /*infinite loop, waiting for interrupts*/
    __asm("wfi");
}


static void TMP_Sensor_Init(void ) {
/*
TRANSACTION SEQUENCE
The protocol for accessing the DS18S20 via the 1–Wire port is as follows:
• Initialization
• ROM Function Command
• Memory Function Command
• Transaction/Data


*/





}

static void Display_Init(void ){
/*
14 ( 8 )                      d7 
            15  (10)
            18 (12)

            23 ( 16)
            24 (18 ) 
            25 (22)

            8  (24)
            7 (26)           d0
        for enable
        gpio 12  ( 32)
        for rs
        gpio 16 (36)
        for read/write
        gpio 20( 38)
*/
/*enable lcd*/
     set_pin ( 1, 12);


// clear all bits to 0 wait for 15 ms
 set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 0, 18);
 set_pin ( 0, 23);
 set_pin ( 0, 24);
 set_pin ( 0, 25);
 set_pin ( 0, 8);
 set_pin ( 0, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w
RPI_WaitMicroSeconds(15000);


                        //RS R/W DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
// fucntion set command    0  0    0   0 1 1 x x x x
set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 1, 18);
 set_pin ( 1, 23);

 set_pin ( 0, 24);
 set_pin ( 0, 25);
 set_pin ( 0, 8);
 set_pin ( 0, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w

// wait more than 4.1 ms
RPI_WaitMicroSeconds(50000);

// function set command RS R/W DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
                            //0 0 0 0 1 1 x x x x
set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 1, 18);
 set_pin ( 1, 23);
 
 set_pin ( 0, 24);
 set_pin ( 0, 25);
 set_pin ( 0, 8);
 set_pin ( 0, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w

// Wait more than 100ms
RPI_WaitMicroSeconds(150000);


/*RS R/W DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
0 0 0 0 1 1 x x x x */
set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 1, 18);
 set_pin ( 1, 23);
 
 set_pin ( 0, 24);
 set_pin ( 0, 25);
 set_pin ( 0, 8);
 set_pin ( 0, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w

/*
RS R/W DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
0 0 0 0 1 1 N F x x Function Set (Interface = 8 bits, Set No. of lines and display font)*/
set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 1, 18);
 set_pin ( 1, 23);
 
 set_pin ( 0, 24);
 set_pin ( 0, 25);

 set_pin ( 0, 8);
 set_pin ( 0, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w


 /*
0 0 0 0 0 0 1 0 0 0  Display OFF */

 set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 0, 18);
 set_pin ( 0, 23);
 
 set_pin ( 1, 24);
 set_pin ( 0, 25);
 set_pin ( 0, 8);
 set_pin ( 0, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w

 /*
0 0 0 0 0 0 0 0 0 1 Clear Display */
set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 0, 18);
 set_pin ( 0, 23);
 
 set_pin ( 0, 24);
 set_pin ( 0, 25);
 set_pin ( 0, 8);
 set_pin ( 1, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w

 /*
0 0 0 0 0 0 0 1 I/D S Entry Mode Set: */

set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 0, 18);
 set_pin ( 0, 23);
 
 set_pin ( 0, 24);
 set_pin ( 1, 25);
 set_pin ( 1, 8);
 set_pin ( 0, 7);

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w



 /*
0 0 0 0 0 0 1 1 C B Display ON (Set C and B for cursor/Blink options.)
*/

set_pin ( 0, 14);
 set_pin ( 0, 15); 
 set_pin ( 0, 18);
 set_pin ( 0, 23);
 
 set_pin ( 1, 24);
 set_pin ( 1, 25);
 set_pin ( 0, 8); // no cursor
 set_pin ( 0, 7); // no blink

 set_pin ( 0, 16); // rs
 set_pin ( 0, 20); // r/w



char str[12]={'!','d','l','r','o','w',' ','o','l','l','e','h'};

// display ready  print hello world
for (int i=0;i<12 ;i++) {
    
int tmp=str[i];


    // d7
set_pin ( (tmp & 0x00000080)>>7, 14);
//d6
 set_pin ( (tmp & 0x00000040)>>6, 15); 
 //d5 
 set_pin ( (tmp & 0x00000020)>>5, 18);
 //d4
 set_pin ( (tmp & 0x00000010) >> 4, 23);
 //d3
 set_pin ( (tmp & 0x00000008) >> 3, 24);
 //d2
 set_pin ( (tmp & 0x00000004) >> 2, 25);
 //d1
 set_pin ( (tmp & 0x00000002) >> 1, 8);
 //d0
 set_pin ( (tmp & 0x00000001) >> 0, 7);


}
}



