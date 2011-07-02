// EEPROM Functions
//Reads the EEPROM and determines which set of coordinates we are headed for. 

int destinationnumber()
{
  if (EEPROM.read(1) == 1)
    {
      destinationLat = 33.2132;
      destinationLon = -87.5458;
      return 1;
    }
else if(EEPROM.read(2) == 1)
    {
      destinationLat = 33.2084;
      destinationLon = -87.5459;
      return 2;
    }
else if(EEPROM.read(3) == 1)
     {
      destinationLat = 33.2126;
      destinationLon = -87.5440;
      return 3;
     }
else if(EEPROM.read(4) == 1)
     {
      destinationLat = 33.2175;
      destinationLon = -87.5895;
      return 4;  
   }
else if(EEPROM.read(5) == 1)
     {
      destinationLat = 31.2120;
      destinationLon = -85.3946;
      return 5;
     }
else if(EEPROM.read(6) == 1)
     {
      destinationLat = 30.1228;
      destinationLon = -85.7343;
      return 6;
     }
else
{
  openservo();
  destinationLat = Currentlat;
  destinationLon = Currentlon;
  setLineFour();
  clearLCD();
  lcd.print("Box unlocked");
  delay(10000);
  clearLCD();
 return 0;
}



}

