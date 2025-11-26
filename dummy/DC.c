void setup()
{
  pinMode(11, OUTPUT);
}

void loop()
{
  int inputValue = analogRead(A0);
  int convertedValue = map(inputValue,0,1023,0,255);
  analogWrite(11,convertedValue);
  delay(100);
}
