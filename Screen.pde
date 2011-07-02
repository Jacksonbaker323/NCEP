//Screen FUNCTIONS

void setLineFour()
{
  //Sets X
     lcd.print(0x7C, BYTE);
     lcd.print(0x18, BYTE);
     lcd.print(0x00, BYTE);
     //Sets Y
     lcd.print(0x7C, BYTE);
     lcd.print(0x19, BYTE);
     lcd.print(0x15, BYTE);
}

void setLineThree()
{
  //Sets X
     lcd.print(0x7C, BYTE);
     lcd.print(0x18, BYTE);
     lcd.print(0x00, BYTE);
     //Sets Y
     lcd.print(0x7C, BYTE);
     lcd.print(0x19, BYTE);
     lcd.print(0x26, BYTE);
}

 void setLineTwo()
{
     //Sets X
     lcd.print(0x7C, BYTE);
     lcd.print(0x18, BYTE);
     lcd.print(0x00, BYTE);
     //Sets Y
     lcd.print(0x7C, BYTE);
     lcd.print(0x19, BYTE);
     lcd.print(0x35, BYTE);
} 
 
   void clearLCD()
{
  lcd.print(0x7C, BYTE);
  lcd.print(0x00, BYTE);
}
 
 



