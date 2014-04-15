import com.nootropic.processing.layers.*;

AppletLayers layers;


PFont font;
String letter = "A";
int oldMouseX =0;
int oldMouseY=0;

void setup() {
  size(800, 800);
  background(0);
  fill(255);
  noCursor();
  
  layers = new AppletLayers(this);
  MyLayer m = new MyLayer(this);
  layers.addLayer(m);
}

void draw() {

  if (mousePressed) {
   MyLayer m = new MyLayer(this);
    layers.addLayer(m);
    
    textSize(random(70));
    text(letter, mouseX, mouseY);
    oldMouseX=mouseX;
    oldMouseY=mouseY;

  }
}
void mouseMoved() {
  background(0);
  textSize(100);
  text(letter, mouseX, mouseY);
}

void mouseDragged() {
  textSize(100);
  text(letter, mouseX, mouseY);
}


void keyReleased() {
  if (key != CODED && (int)key > 32) letter = str(key);
}

// clear with "backspace key"
void keyPressed() {
  if (key == BACKSPACE) {
    background(0);
  }

// Inserire le frecce SX e DX per ruotare la lettera e UP, DOWN per zoomare

}

/*
 void paint(java.awt.Graphics g) {
 if (layers != null) {
 layers.paint(this);
 } else {
 super.paint(g);
 }
 }
 */
 
 class MyLayer extends Layer {

  MyLayer(PApplet parent) {
    super(parent); // This is necessary!
  }

  void draw() {
    // background(0, 0); // clear the background every time, but be transparent
    // now draw something
  }

}
