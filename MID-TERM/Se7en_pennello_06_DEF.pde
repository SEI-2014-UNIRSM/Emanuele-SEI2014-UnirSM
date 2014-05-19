// Blurry brush for Se7en's movie poster and opening title sequence
// Emanuele Lumini for the course SEI2014 @ UnirSM
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino

// key command:
// d = dilate
// e = erode
// 'backspace' = delete animation on canvas
// r = start recording frame for animation (.png)
// s = stop recording frame for animation (.png)
// t = save a single frame (.tga)
// q = start recording pdf [off]
// w = stop recording pdf [off]

import processing.pdf.*;
import java.util.Calendar;
// import controlP5.*;

// ControlP5 interfaccia;

int spessore = 9; // primary brush stroke
int spessore1 = 40; // secondary brush stroke (outline)
int seed = 2; // background lines seeding
int alphaCopia = 40; // background lines opacity

boolean recordPDF = false;
boolean saveFrame = false;
float F=2;
float xoff = 0.0;

PVector O, P;

void setup()
{
  size (720, 405);
  smooth();
  background(0);
  frameRate(30);
  noCursor();

  // interfaccia = new ControlP5(this);
  /*
  // create a group for all the gui element called ADMIN
   Group ADMIN = interfaccia.addGroup("ADMIN")
   .setPosition(10, 20)
   .setWidth(200)
   .setBackgroundHeight(70)
   .setBackgroundColor(color(150))
   ;
   
   // create a slider for the opacity parameter
   // name, minValue, maxValue, defaultValue, x, y, width, height
   interfaccia.addSlider("opacity background lines", 0, 100, 95, 10, 10, 100, 14)
   .setGroup(ADMIN)
   ;
   
   // create a toggle button to control "delete screen" or not
   interfaccia.addToggle("cancella")
   .setSize(14, 14)
   .setGroup(ADMIN)
   ;
   */
}

void draw() {
  filter(BLUR, 0.6);

  O = new PVector (mouseX, mouseY);
  P = new PVector (pmouseX, pmouseY);

  // noise
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  if (frameCount%20 == 0) {
    F = random(-5, 5);
  }


  for ( int i=0;i<20;i++)
  {
    if (mousePressed && (mouseButton == LEFT))
    {
      strokeWeight(1);
      stroke(240, 95);

      line(O.x+random(spessore), O.y+random(spessore), P.x+random(spessore), P.y+random(spessore));

      stroke(255, alphaCopia);

      line(O.x*F+random(spessore1), O.y*F+random(spessore1), P.x*F+random(spessore1), P.y*F+random(spessore1));
    }
  }

  int oraSi = (int) random(seed);

  if (frameCount%seed == 0 && oraSi == 0 ) {
    strokeWeight(random(4));
    stroke(240, random(50));
    line((random(width)+-random(1))*n, (random(height)+-random(1))*n, (random(width)+-random(1)*n), (random(height)+-random(1)*n));
    line((random(height)+-random(1))*n, (random(width)+-random(1))*n, (random(height)+-random(1)*n), (random(width)+-random(1)*n));
  }


  // start recording frame for animation (.png)
  if (key =='r' || key =='R') {
    saveFrame("Se7en/frame-######.png");
    println(frameCount);
  }

  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      filter(DILATE);
    }
    if (key == 'e' || key == 'E') {
      filter(ERODE);
    }

    // stop recording frame for animation (.png)
    if (key =='s' || key =='S') {
      saveFrame("Se7en/frame-######.png");
      println(frameCount);
    }

    if (key =='t' || key =='T') {
      saveFrame("Se7en/tgaframe-######.tga");
      println(frameCount);
    }
  }
}

// delete animation on canvas
void keyReleased() {
  if (keyCode == BACKSPACE) {
    background(0);
  }

  /*
  // recording PDF  
   if (key =='q' || key =='Q') {
   if (recordPDF == false) {
   beginRecord(PDF, "frame-######.pdf");
   println("recording started");
   recordPDF = true;
   }
   } 
   else if (key == 'w' || key =='W') {
   if (recordPDF) {
   println("recording stopped");
   endRecord();
   recordPDF = false;
   }
   }
   */
}

/*
void keyPressed() {
 // default properties load/save key combinations are
 // alt+shift+l to load properties
 // alt+shift+s to save properties
 if(key=='1') {
 interfaccia.saveProperties(("current_setup.ser"));
 } else if(key=='2') {
 interfaccia.loadProperties(("current_setup.ser"));
 }
 
 
 }
 */
