#include "rpi-gpio.h"
#include "temp_sensor.h"
#include "rpi-systimer.h"


/*
TRANSACTION SEQUENCE
The protocol for accessing the DS18S20 via the 1–Wire port is as follows:
• Initialization
• ROM Function Command
• Memory Function Command
• Transaction/Data

*/

    void TMP_Sensor_Init(void ){

/*Infinite recovery time can occur between
bits so long as the 1–Wire bus is in the inactive (high) state during the recovery period. If this does not
occur and the bus is left low for more than 480 μs, all components on the bus will be reset.*/

// reset sensor
// indoor
set_pin(0, OUTDOOR_SENS);

// outdorr
set_pin(0,INDOOR_SENS);

RPI_WaitMicroSeconds(500);

//idle 
// indoor
set_pin(1, OUTDOOR_SENS);
// outdorr
set_pin(1,INDOOR_SENS);







    }


 void TMP_Read(int sensor){
 	/*The bus master transmits (TX) a reset pulse (a low signal for a minimum of 480 ms). The bus master
then releases the line and goes into a receive mode (RX). The 1–Wire bus is pulled to a high state via the
5k pullup resistor. After detecting the rising edge on the DQ pin, the DS18S20 waits 15–60 μs and then
transmits the presence pulse (a low signal for 60–240 μs).*/
// indoor
set_pin(0, OUTDOOR_SENS);

// outdorr
set_pin(0,INDOOR_SENS);

RPI_WaitMicroSeconds(500);

// change pin direction 


RPI_WaitMicroSeconds(70);
//read 


    }