// Based on: 10 PRINT CHR$(205.5+RND(1)); : GOTO 10
// 
// Algorithm modified by Emanuele Lumini for the course SEI2014 @ UnirSM - More info at http://goo.gl/59obuO
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino

// drawing a line of blurry points 

int w = 16;
int h = 16;
int index = 0;
float r;
float y1;

void setup() {
  size(800, 400);
  background(0);
  strokeWeight(2);
  fill(256, 256, 256);
  noStroke();
  smooth();
  
  y1 = height/2;
  
}

void draw() {
  
  int x1 = w*index;
  r = random(10,18);
  ellipse(x1, y1, r, r);

  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h);
    // background(0);
    set(0, 0, p);
    index = 0;
  }
  
    filter(BLUR, 1);
}
