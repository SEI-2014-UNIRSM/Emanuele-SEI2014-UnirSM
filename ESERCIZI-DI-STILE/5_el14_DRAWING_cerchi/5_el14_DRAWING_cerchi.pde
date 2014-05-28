// Algorithm created by Emanuele Lumini for the course SEI2014 @ UnirSM - More info at http://goo.gl/59obuO
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino

// drawing random circles based on mouse position 

// commands
// mouse click: delete and start a new composition


void setup(){
size(600, 600);
smooth();
noCursor();
background(0,0,0);

}

void draw () {
float h = random(0,360);
float s = random(0,100);
float b = random (0,100);

// delete composition on mouse click
if (mousePressed) {
background(0,0,0);
}

// draw random ellipses
else{
noFill();
stroke(h,s,b);
ellipse(mouseX, mouseY, mouseX-300, mouseY-300);

}
}
