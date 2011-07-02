
PWMServo myservo;

void closeservo()
{
  myservo.attach(9);
  delay(200);
  myservo.write(10);
  delay(200);
  myservo.detach();
  delay(200);
}

void openservo()
{
  myservo.attach(9);
  delay(200);
  myservo.write(180);
  delay(200);
  myservo.detach();
  delay(200);
  
}
