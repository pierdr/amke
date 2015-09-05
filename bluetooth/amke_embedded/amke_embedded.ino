#include "RFduinoBLE.h"

#define PIN 6

int value=0;

void setup() {

pinMode(PIN,OUTPUT);
for(int i=0;i<255;i++)
{
analogWrite(PIN,i);
delay(100);
}
analogWrite(PIN,0);
RFduinoBLE.advertisementData = "CouDow"; // shouldnt be more than 10 characters long RFduinoBLE.deviceName = "Timer"; // name of your RFduino. Will appear when other BLE enabled devices search for it RFduinoBLE.begin(); // begin
RFduinoBLE.begin();
Serial.begin(9600);
}

void loop() {
analogWrite(PIN,value);

}

void RFduinoBLE_onConnect(){
value=255;
}
void RFduinoBLE_onDisconnect(){
value=0;
}
void RFduinoBLE_onRSSI(int rssi){
 // print rssi value via serial
 Serial.print(rssi);
 Serial.print( " "); 
value = (101+rssi)*2;
Serial.println(value);
}
