int flappyWidth = 50; 
int flappyHeight = 30;

float flappyX;
int flappyY;

float velocity = 0.0; 
float gravity = 0.6;
float jump = -10;

float pipeX;
float pipeWidth = 80;
float gapY; // coordinata y del buco 
float gapHeight = 200; // altezza del buco 

boolean gameOver = false;

int point = 0;

PImage flappyImg;
PImage tubeImg; 
