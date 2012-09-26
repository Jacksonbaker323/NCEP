// EEPROM Functions
//Reads the EEPROM and determines which set of coordinates we are headed for. 

int destinationnumber()
{
  if (EEPROM.read(1) == 1)
    {
      destinationLat = REDACTED FLOAT;
      destinationLon = REDACTED FLOAT;
      return 1;
    }
else if(EEPROM.read(2) == 1)
    {
      destinationLat = REDACTED FLOAT;
      destinationLon = REDACTED FLOAT;
      return 2;
    }
else if(EEPROM.read(3) == 1)
     {
      destinationLat = REDACTED FLOAT;
      destinationLon = REDACTED FLOAT;
      return 3;
     }
else if(EEPROM.read(4) == 1)
     {
      destinationLat = REDACTED FLOAT;
      destinationLon = REDACTED FLOAT;
      return 4;  
   }
else if(EEPROM.read(5) == 1)
     {
      destinationLat = REDACTED FLOAT;
      destinationLon = REDACTED FLOAT;
      return 5;
     }
else if(EEPROM.read(6) == 1)
     {
      destinationLat = REDACTED FLOAT;
      destinationLon = REDACTED FLOAT;
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

