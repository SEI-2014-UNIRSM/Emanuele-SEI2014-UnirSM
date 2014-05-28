// Algorithm created by Emanuele Lumini for the course SEI2014 @ UnirSM - More info at http://goo.gl/59obuO
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino

// drawing on screen with a spray brush

// commands:
// r : red color
// g : green color
// b : blue colore
// backspace: delete


ArrayList history;  
float R, G, B;

void setup() {
  size(1280, 720);
  background(0);
  smooth();
  history  = new ArrayList();
}

void draw() {

  // RGB controls
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      R=0;
      G=0;
      B=230;
    }

    if (key == 'g' || key == 'G') {
      R=0;
      G=230;
      B=0;
    } 
    if (key == 'r' || key == 'R') {
      R=230;
      G=0;
      B=0;
    } 
    if (key == 'w' || key == 'W') {

      R=230;
      G=230;
      B=230;
    }
  }

  if (mousePressed) {
    pennello(mouseX, mouseY, 12, 10);
  }
}

void pennello(float x, float y, int r, int num) { 
  noStroke();
  fill(R, G, B, 50);

  ellipse(x, y, r, r);

  if (num > 0) {
    float ny = y + sin(random(0, TWO_PI)) * 12.0;   
    float nx = x - sin(random(0, TWO_PI)) * 12.0; 
    pennello(nx, ny, int(random(r/2, r+(num/5))), num-1);
  }
}

void keyReleased() {
  if (key == BACKSPACE) {
    background(0);
  }
}
