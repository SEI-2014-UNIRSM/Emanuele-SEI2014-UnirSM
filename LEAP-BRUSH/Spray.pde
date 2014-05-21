ArrayList history;  
float R, G, B;

void setup() {
  size(800, 600);
  background(0);
  smooth();
  history  = new ArrayList();
}

void draw() {
   /*
  // RGB controls
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      R=0;
      G=0;
      B=230;
     
    }
  } else if (key == 'g' || key == 'G') {
      R=0;
      G=230;
      B=0;
     
    } else if (key == 'r' || key == 'R') {
      R=230;
      G=0;
      B=0;
     
    } else {
      R=230;
      G=230;
      B=230;
     
    }
*/
  if (mousePressed) {
    pennello(mouseX, mouseY, 12, 10);
  }
}

void pennello(float x, float y, int r, int num) { 
  noStroke();
  // fill(R, G, B, 30);
 fill (80,100);

  ellipse(x, y, r, r);

  if (num > 0) {
    float ny = y + sin(random(0, TWO_PI)) * 12.0;   
    float nx = x - sin(random(0, TWO_PI)) * 12.0; 
    pennello(nx, ny, int(random(r/2, r+(num/5))), num-1);
  }
}







