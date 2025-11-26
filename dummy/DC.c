void setup()
{
  pinMode(11, OUTPUT); // DC모터
}

void loop()
{
  int inputValue = analogRead(A0); // 가변저항
  int convertedValue = map(inputValue,0,1023,0,255);
  analogWrite(11,convertedValue);
  delay(100);
}
