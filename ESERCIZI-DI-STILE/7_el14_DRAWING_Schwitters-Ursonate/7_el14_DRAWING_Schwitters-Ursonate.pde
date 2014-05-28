// Based on: P_2_3_3_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Algorithm modified by Emanuele Lumini for the course SEI2014 @ UnirSM - More info at http://goo.gl/59obuO
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino

// drawing Introduction part of Ursonate on the screen and acting on this with filters

// commands
// backspace : clear screen
// arrow up : angle distortion +
// arrow down : angle distortion -
// e : erode effect
// d : dilate effect
// b: blur effect

// s : save png
// r : start pdf recording
// d : stop pdf recording


import processing.pdf.*;
import java.util.Calendar;

boolean recordPDF = false;

float x = 0, y = 0;
float stepSize = 5.0;

PFont font;
String letters = "Fümms bö wö tää zää Uu, pögiff, kwii Ee. Oooooooooooooooooooooooo, dll rrrrr beeeee bö dll rrrrr beeeee bö fümms bö, rrrrr beeeee bö fümms bö wö, beeeee bö fümms bö wö tää, bö fümms bö wö tää zää, fümms bö wö tää zää Uu:";
int fontSizeMin = 3;
float angleDistortion = 0.0;

int counter = 0;


void setup() {
  // use full screen size 
  size(1200, 800);
  background(0);
  smooth();
  noCursor();

  x = mouseX;
  y = mouseY;

  font = createFont("American Typewriter",10);

  textFont(font,fontSizeMin);
  textAlign(CENTER);

}


void draw() {
  if (mousePressed) {
    float d = dist(x,y, mouseX,mouseY);
    fill(240, random(30,90));

    textFont(font,fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize; 
    }
  }
  
  if (keyPressed) {
  if (key == 'b') filter(BLUR);
  if (key == 'e') filter(ERODE);
  if (key == 'd') filter(DILATE);
  }
}


void mousePressed() {
  x = pmouseX;
  y = pmouseY;
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
 if (key == BACKSPACE) {
  background(0);
 }

  // ------ pdf export ------
  // press 'r' to start pdf recordPDF and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      textAlign(LEFT);
      fill(0);
    }
  } 
  else if (key == 'd' || key =='D') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255); 
    }
  } 
}

void keyPressed() {
  // angleDistortion ctrls arrowkeys up/down 
  if (keyCode == UP) angleDistortion += 0.1;
  if (keyCode == DOWN) angleDistortion -= 0.1; 
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
