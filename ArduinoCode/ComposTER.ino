#include <Ultrasonic.h>

const int profondeurMaxDetect = 48;
const int animation_delay = 100;
const int delay_after_first_press = 1000;
//COMPOSTER project using an Arduino UNO, HC-SR04

//Press  to play (= 0,1 or 2)
int play;


//Min play time between games
//const int maxPlayTime = 200; //in mseconds
;
//Led strip to switch on depending on the points
const int minPointsLed1 = 2;
const int minPointsLed2 = 10;
const int minPointsLed3 = 20;
const int minPointsLed4 = 35;
const int minPointsLed5 = 10;


//interrupt is the PLAY Button
const int interruptPin = 2;



//relay on/off
const int rON = 255;
const int rOFF = 0;

//Pin of the relay
const int relayPin1 = 3;
const int relayPin2 = 5;
const int relayPin3 = 6;
const int relayPin4 = 9;
const int relayPin5 = 10;

//Pin of the HC-SR04
const int TrigPin = 12;
const int EchoPin = 13;
int i;
Ultrasonic son(TrigPin,EchoPin);


int distance;


void switchLed(int points){
  //Serial.println(points);
  if (points >=minPointsLed1) analogWrite(relayPin1,rON); else analogWrite(relayPin1,rOFF);
  if (points >=minPointsLed2) analogWrite(relayPin2,rON); else analogWrite(relayPin2,rOFF);
  if (points >=minPointsLed3) analogWrite(relayPin3,rON); else analogWrite(relayPin3,rOFF);
  if (points >=minPointsLed4) analogWrite(relayPin4,rON); else analogWrite(relayPin4,rOFF);
  if (points >=minPointsLed5) analogWrite(relayPin5,rON); else analogWrite(relayPin5,rOFF);
};


void animationLed1(){
 //Switch off all LED strips
 analogWrite(relayPin1,rOFF);
 analogWrite(relayPin2,rOFF);
 analogWrite(relayPin3,rOFF);
 analogWrite(relayPin4,rOFF);
 analogWrite(relayPin5,rOFF);
 
 //Switch one by one the 5 LED strips
 analogWrite(relayPin1,rON);
 delay(animation_delay);

 analogWrite(relayPin1,rOFF);
 analogWrite(relayPin2,rON);
 delay(animation_delay);

 analogWrite(relayPin2,rOFF);
 analogWrite(relayPin3,rON);
 delay(animation_delay); 
 
 analogWrite(relayPin3,rOFF);
 analogWrite(relayPin4,rON);
 delay(animation_delay);
 
 analogWrite(relayPin4,rOFF);
 analogWrite(relayPin5,rON);
 delay(animation_delay);
 
 //The same in the reverse order
 analogWrite(relayPin5,rOFF);
 analogWrite(relayPin4,rON);
 delay(animation_delay);
 
 analogWrite(relayPin4,rOFF);
 analogWrite(relayPin3,rON);
 delay(animation_delay);
 
 analogWrite(relayPin3,rOFF);
 analogWrite(relayPin2,rON);
 delay(animation_delay);
 
 analogWrite(relayPin2,rOFF);
 analogWrite(relayPin1,rON);
 delay(animation_delay);
 

 //Switch off/ON all the LED strips
 analogWrite(relayPin1,rOFF);
 analogWrite(relayPin2,rOFF);
 analogWrite(relayPin3,rOFF);
 analogWrite(relayPin4,rOFF);
 analogWrite(relayPin5,rOFF);
 delay(animation_delay);

 analogWrite(relayPin1,rON);
 analogWrite(relayPin2,rON);
 analogWrite(relayPin3,rON);
 analogWrite(relayPin4,rON);
 analogWrite(relayPin5,rON);
 delay(animation_delay);


 analogWrite(relayPin1,rOFF);
 analogWrite(relayPin2,rOFF);
 analogWrite(relayPin3,rOFF);
 analogWrite(relayPin4,rOFF);
 analogWrite(relayPin5,rOFF);
 delay(animation_delay);

 analogWrite(relayPin1,rON);
 analogWrite(relayPin2,rON);
 analogWrite(relayPin3,rON);
 analogWrite(relayPin4,rON);
 analogWrite(relayPin5,rON);
 delay(animation_delay);
 
  analogWrite(relayPin1,rOFF);
 analogWrite(relayPin2,rOFF);
 analogWrite(relayPin3,rOFF);
 analogWrite(relayPin4,rOFF);
 analogWrite(relayPin5,rOFF);
 delay(animation_delay);

 analogWrite(relayPin1,rON);
 analogWrite(relayPin2,rON);
 analogWrite(relayPin3,rON);
 analogWrite(relayPin4,rON);
 analogWrite(relayPin5,rON);
 delay(animation_delay);
 
  analogWrite(relayPin1,rOFF);
 analogWrite(relayPin2,rOFF);
 analogWrite(relayPin3,rOFF);
 analogWrite(relayPin4,rOFF);
 analogWrite(relayPin5,rOFF);
 delay(animation_delay);


};


void setup(){
  play = 0;
    i = 0;
  Serial.begin(9600);
  pinMode(interruptPin, INPUT);
  
  //Set Relay Pins Mode
  pinMode(relayPin1,OUTPUT);
  pinMode(relayPin2,OUTPUT);
  pinMode(relayPin3,OUTPUT);
  pinMode(relayPin4,OUTPUT);
  pinMode(relayPin5,OUTPUT);
  delay(1000);
}



void loop(){
  
  int tmp;
  
  tmp = digitalRead(interruptPin);
  if ((tmp==HIGH)&&(play<2)){
    play++; 
    Serial.println("1");
    if (play==1) delay(delay_after_first_press);
  }
  
  
 if (play==2){
  float cmMsec, inMsec;
  long microsec = son.timing();
  cmMsec = son.convert(microsec, Ultrasonic::CM);
  inMsec = son.convert(microsec, Ultrasonic::IN); 
 // Serial.println(cmMsec); 
  if (cmMsec<profondeurMaxDetect){
    Serial.println("2");
    i++;
    animationLed1();
    switchLed(i);
    play = 0; 
     }
     
 }
  delay(30); 
}
  
  
  

//TEST
//analogWrite(relayPin2,rON);
//delay(1000);
//analogWrite(relayPin2,rOFF);
//delay(1000);
//END OFI TEST


  
  


