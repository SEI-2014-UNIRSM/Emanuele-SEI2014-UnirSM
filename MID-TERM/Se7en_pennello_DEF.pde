// Blurry brush for Se7en's movie poster and opening title sequence
// Emanuele Lumini for the course SEI2014 @ UnirSM
// github.com/EmanueleLumini — github.com/SEI2014-UnirSM/Emanuele-SEI2014-UnirSM
// Made for educational purposes, MIT License, April 2014, San Marino


// notes: conoscendo meglio il codice, avrei voluto aggiungere un wiggle al testo in fase di scrittura
//        e uno sdoppiamento dello stesso (per alcuni istanti) con scale diverse. 


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

boolean recordPDF = false;
boolean saveFrame = false;

void setup()
{
  size (600, 600);
  smooth();
  background(0);
  frameRate(30);
  noCursor();
}

void draw() {
  filter(BLUR, 0.6);

  for ( int i=0;i<20;i++)
  {
    if (mousePressed && (mouseButton == LEFT))
    {
      line(mouseX+random(10), mouseY+random(10), pmouseX+random(10), pmouseY+random(10));
      strokeWeight(1);
      stroke(240, 95);
    }
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
