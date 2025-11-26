void setup()
{
  Serial.begin(9600);
  pinMode(11, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(9, OUTPUT);
}

void loop()
{
  int red = random(256);
  int blue = random(0,256);
  int green = random(0,256);
  
  analogWrite(11,red);
  analogWrite(10,blue);
  analogWrite(9,green);
  
  Serial.print("R: ");
  Serial.print(red);
  Serial.print("\tB: ");
  Serial.print(blue);
  Serial.print("\tG: ");
  Serial.println(green);
  
  delay(2000);
}
