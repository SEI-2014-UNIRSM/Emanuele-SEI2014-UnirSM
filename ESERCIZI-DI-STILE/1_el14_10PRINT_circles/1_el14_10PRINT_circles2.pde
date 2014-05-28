// Based on: 10 PRINT CHR$(205.5+RND(1)); : GOTO 10
// 
// Algorithm modified by Emanuele Lumini for the course SEI2014 @ UnirSM - More info at http://goo.gl/59obuO
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino

// drawing random lines of circles 

int w = 16;
int h = 16;
int index = 0;
float r = random(5)+10;

void setup() {
  size(640, 384);
  background(0);
  strokeWeight(2);
  stroke(255);
  smooth();
}

void draw() {
  int x1 = w*index;
  int x2 = x1 + w;
  int y1 = h*23;
  int y2 = h*24;
  fill(random(256));
  if (random(2) < 1) {
    ellipse(x2, y1, r, r);
  } 
  else {
    ellipse(x1, y1, r, r);
  }
  
  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h*23);
    background(0);
    set(0, 0, p);
    index = 0;
  }
}
