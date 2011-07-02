#include <PWMServo.h>
//#include <Servo.h>
#include <NewSoftSerial.h>
//Connections: SDA - Analog pin 4 ; SCL - Analog pin 5
#include <Wire.h>
#include <TinyGPS.h>
#include <EEPROM.h>

int HMC6352SlaveAddress = 0x42;
int HMC6352ReadAddress = 0x41; //"A" in hex, A command is: 
int headingInt;
float destinationLat;
float destinationLon;
float Currentlat;
float Currentlon;
int destnum;
int servostatus;



#define LCDTX 4 //Digital4 to RX on LCD
#define LCDRX 5 //Digital5 to TX on LCD
#define LCDBAUD 115200

//Define GPS variables
#define GPSRX 2 //Digital2 
#define GPSTX 3 //Digital3
#define GPSBAUD 4800



TinyGPS gps; //Create a new instance of the TinyGPS object



NewSoftSerial lcd(LCDRX, LCDTX); //Setup the LCD Display
NewSoftSerial gpscom(GPSRX, GPSTX);
void gpsdump(TinyGPS &gps);
bool feedgps();
void printFloat(double f, int digits = 2);
void setup(){
  //Serial.begin(9600);
  //Startup serial communications
  gpscom.begin(GPSBAUD);
  lcd.begin(LCDBAUD); 
  //Configure the Compass module.
  HMC6352SlaveAddress = HMC6352SlaveAddress >> 1; // I know 0x42 is less than 127, but this is still required
  Wire.begin();
  //delay(10000);
  servostatus = EEPROM.read(0);
  if(servostatus != 0)
  {
  delay(10000);
  closeservo();
  delay(200);
  EEPROM.write(0,0);
  }
  
}
  
 
 
void loop(){

  Serial.println(servostatus);
 destnum = destinationnumber();

  
  // Get the current heading in degrees
  headingInt = compasscalc();
  
  //Print the current heading to the screen
  lcd.print("Current:");
  lcd.print(headingInt);
  lcd.print(" Deg.");
  
  
  //Print the destination heading to the screen
  setLineTwo();
  float bearing = DirectionToPoint(Currentlat,Currentlon,destinationLat,destinationLon);
  lcd.print("Dest: ");
  lcd.print(bearing);
  lcd.print(" Deg.");
  
  
  //Print the distance to the destination to the screen
  setLineThree();
  lcd.print("Distance:");
  lcd.print("");

 
  // Poll the GPS for the next string
  bool newdata = false;
  unsigned long start = millis();

  // Grab an updated GPS NMEA String every second
  while (millis() - start < 1000)
  {
    if (feedgps())
      newdata = true;
  }
  
  if (newdata)
  {
    //This function prints out the GPS lat and lon to the screen
    gpsdump(gps);
   float DistanceToGo = DistanceBetween2Points(Currentlat,Currentlon,destinationLat,destinationLon);
   
   lcd.print(DistanceToGo);
   lcd.print(" Miles");
   if (DistanceToGo < .01)
   {
   EEPROM.write(destnum,0);
   }
  }
 
 //Wait 2 seconds so that the screen can be read and then clear it so that it can be refreshed. 
  delay(2000);
  clearLCD();

  
 }
 
 
 




