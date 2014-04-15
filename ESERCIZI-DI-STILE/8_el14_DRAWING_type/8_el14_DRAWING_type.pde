////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Based on: P_3_0_01.pde
// -------------------------------------------------------------------------------------------------------------------------
// Algoritmo modificato per esercizio durante il corso SEI 2014 @ UnirSM — Più info http://goo.gl/59obuO
// Scrivere un testo scegliendo liberamente le lettere da tastiera
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


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

/**
 * changing the size and the position of a letter
 *    
 * MOUSE
 * drag                : draw
 * 
 * KEYS
 * a-z                 : change letter
 * backspace           : delete sketch
 */


PFont font;
String letter = "A";


void setup(){
  size(800, 800);
  background(0);
  fill(255);

  font = createFont("Helvetica", 12);
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw(){
}
// ATTENTION for Emanuele - You have deleted these line,
// are used to display the current letter. But we lose
// the trail, you have to assign a function to keep.
void mouseMoved(){
  background(0);
  textSize(100);
  text(letter, mouseX, mouseY);
}

void mouseDragged(){
  textSize(100);
  text(letter, mouseX, mouseY);
}


void keyReleased() {
  if (key != CODED && (int)key > 32) letter = str(key);
}

// clear with "backspace key"
 void keyPressed() {
 if (key == BACKSPACE) {
 background(0);}
 }
