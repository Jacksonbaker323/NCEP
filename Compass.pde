//Compass Functions

int compasscalc()
{
  
  //BEGIN COMPASS CALCULATIONS
  Wire.beginTransmission(HMC6352SlaveAddress);
  Wire.send(HMC6352ReadAddress);              // The "Get Data" command
  Wire.endTransmission();
  
  //"Get Data. Compensate and Calculate New Heading"
  //time delays required by HMC6352 upon receipt of the command
  //Get Data. Compensate and Calculate New Heading : 6ms
  delay(6);

  Wire.requestFrom(HMC6352SlaveAddress, 2); //get the two data bytes, MSB and LSB

  //"The heading output data will be the value in tenths of degrees
  //from zero to 3599 and provided in binary format over the two bytes."
  byte MSB = Wire.receive();
  byte LSB = Wire.receive();
//Changed from float to int
  int headingSum = (MSB << 8) + LSB; //(MSB / LSB sum)
  int headingInt = headingSum / 10; 
  return headingInt;
//END COMPASS CALCULATIONS
}
