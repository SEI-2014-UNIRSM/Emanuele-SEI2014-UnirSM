// Based on: P_2_2_5_01.pde
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

// drawing random cracks on the screen


int maxCount = 5000; // max number of circles
int currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; //radius
int[] closestIndex = new int[maxCount]; //index

float minRadius = 3;
float maxRadius = 50;


void setup() {
  size(800,800);
  noFill();
  smooth();
  // cursor(CROSS);

  // first circle
  x[0] = 200;
  y[0] = 100;
  r[0] = 50;
  closestIndex[0] = 0;
}



void draw() {
  background(0);

  // prandom position
  float newX = random(0+maxRadius,width-maxRadius);
  float newY = random(0+maxRadius,height-maxRadius);
  float newR = minRadius;

  boolean intersection = false;

  // find out, if new circle intersects with one of the others
  for(int i=0; i < currentCount; i++) {
    float d = dist(newX,newY, x[i],y[i]);
    if (d < (newR + r[i])) {
      intersection = true; 
      break;
    }
  }

  // draw a new circle, if there's no intersection
  if (intersection == false) {
  // draw a circle next to the others
    float newRadius = width;
    for(int i=0; i < currentCount; i++) {
      float d = dist(newX,newY, x[i],y[i]);
      if (newRadius > d-r[i]) {
        newRadius = d-r[i];
        closestIndex[currentCount] = i;
      }
    }

    if (newRadius > maxRadius) newRadius = maxRadius;
    
    x[currentCount] = newX;
    y[currentCount] = newY;
    r[currentCount] = newRadius;
    currentCount++;
  }

  // drawing
  for (int i=0 ; i < currentCount; i++) {
    stroke(255);
    strokeWeight(1.5);
    // ellipse(x[i],y[i], r[i]*2,r[i]*2);
    stroke(226, 185, 0, 60);
    strokeWeight(2);
    int n = closestIndex[i];
    line(x[i],y[i], x[n],y[n]); 
  }

  if (currentCount >= maxCount) noLoop();

  }
