int value = 0;

void setup() {
size(1200,600);
colorMode(HSB, 360, 100, 100);

}

void draw() {
  background(0);
  
  float h = map(mouseX, 0, width, 0, 360);
  float b = map(mouseY, 0, height, 10, 100);
  
  fill(h,100,b,128);
  
  stroke(5*b);

  ellipse(mouseX, mouseY, 120,120);
  
  ellipse(width/2,height/2,120,120);
 
}

void mouseClicked() {
  if (value == 0) {
    colorMode(HSB, 360, 100, 100);
  } else {
    colorMode(RGB, 360, 100, 100);
  } 
}
