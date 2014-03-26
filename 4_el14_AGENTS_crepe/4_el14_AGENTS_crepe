// Basato su: P_2_2_5_01.pde
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

// Algoritmo modificato per esercizio durante il corso SEI 2014 @ UnirSM — Più info http://goo.gl/59obuO 


// disegnare cerchi random (senza sovrapposizione) che uniscano i loro centri tramite una linea


int maxCount = 5000; // numero massimo di cerchi
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

  // primo cerchio
  x[0] = 200;
  y[0] = 100;
  r[0] = 50;
  closestIndex[0] = 0;
}



void draw() {
  background(0);

  // posizionamento random
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

  // senza intersezioni, crea un nuovo cerchio
  if (intersection == false) {
    // crea cerchio vicino agli altri
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

  // disegna
  for (int i=0 ; i < currentCount; i++) {
    stroke(255);
    strokeWeight(1.5);
    // ellipse(x[i],y[i], r[i]*2,r[i]*2);
    stroke(226, 185, 0);
    strokeWeight(2);
    int n = closestIndex[i];
    line(x[i],y[i], x[n],y[n]); 
  }

  if (currentCount >= maxCount) noLoop();

  }








