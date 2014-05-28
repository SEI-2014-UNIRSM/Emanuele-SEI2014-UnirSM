// Algorithm created by Emanuele Lumini for the course SEI2014 @ UnirSM - More info at http://goo.gl/59obuO
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino

// creation of colors selector 

// commands
// mouse click: change color mode from HSB to RGB

int value = 0;

void setup() {
size(1200,600);
colorMode(HSB, 360, 100, 100); // color mode: Hue Saturation and Brightness

}

void draw() {
  background(0);
  
  // remapping width and height values
  float h = map(mouseX, 0, width, 0, 360);
  float b = map(mouseY, 0, height, 10, 100);
  
  fill(h,100,b,128);
  
  stroke(5*b);

  // ellipses
  ellipse(mouseX, mouseY, 120,120);
  ellipse(width/2,height/2,120,120);
 
}

// change color mode from HSB to RGB on mouse click
void mouseClicked() {
  if (value == 0) {
    colorMode(HSB, 360, 100, 100);
  } else {
    colorMode(RGB, 360, 100, 100);
  } 
}
