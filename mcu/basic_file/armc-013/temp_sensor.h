#ifndef __TEMP_SENSOR_H
#define __TEMP_SENSOR_H


#define INDOOR_SENS 5
#define OUTDOOR_SENS 6



// commands for rom 
#define READ_ROM 0x33 /*This command allows the bus master to read the DS18S20’s 8–bit family code, unique 48–bit serial number, and 8–bit CRC.*/
#define MATCH_ROM 0x55 /* The match ROM command, followed by a 64–bit ROM sequence, allows the bus master to address a specific DS18S20 on a multidrop bus.*/
#define SKIP_ROM 0xCC /* This command can save time in a single drop bus system by allowing the bus master to access the memory functions without providing the 64–bit ROM code. */
#define SEARCH_ROM 0xF0 /*When a system is initially brought up, the bus master might not know the number of devices on the 1-Wire bus or their 64–bit ROM codes.*/
#define ALARM_SEARCH 0xEC /*the DS18S20 will
respond to this command only if an alarm condition has been encountered at the last temperature
measurement. An alarm condition is defined as a temperature higher than TH or lower than TL. The
alarm condition remains set as long as the DS18S20 is powered up, or until another temperature
measurement reveals a non–alarming value.*/

// memory commands
#define WRITE_SCRATCHPAD 0x4E /*This command writes to the scratchpad of the DS18S20, starting at the TH register*/
 #define READ_SCRATCHPAD 0xBE /*This command reads the contents of the scratchpad. Reading will commence at byte 0, and will continue
through the scratchpad until the ninth (byte 8, CRC) byte is read. If not all locations are to be read, the
master may issue a reset to terminate reading at any time.*/
#define COPY_SCRATCHPAD 0x48 /*This command copies the scratchpad into the E2 memory of the DS18S20, storing the temperature trigger
bytes in nonvolatile memory.*/
#define CONVERT 0x44 /*This command begins a temperature conversion. No further data is required. The temperature
conversion will be performed and then the DS18S20 will remain idle. If the bus master issues read time
slots following this command, the DS18S20 will output 0 on the bus as long as it is busy making a
temperature conversion; it will return a 1 when the temperature conversion is complete. If parasitepowered,
the bus master has to enable a strong pullup for a time period greater than tconv immediately
after issuing this command.*/
#define RECALL_E2 0xB8 /*This command recalls the temperature trigger values stored in E2 to the scratchpad.*/
#define	READ_PS 0xB4 /*With every read data time slot issued after this command has been sent to the DS18S20, the device will
signal its power mode: 0=parasite power, 1=external power supply provided.*/


    void TMP_Sensor_Init(void );

    void TMP_Read(int sensor);




#endif