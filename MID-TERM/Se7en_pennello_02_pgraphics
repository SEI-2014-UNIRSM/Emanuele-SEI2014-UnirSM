PGraphics tr;

void setup() {
  size (800, 800);
  tr = createGraphics(width,height);
  smooth();
  background(0);
}

void draw() {
  // background(0);
   fill(250);
  
  for ( int i=0;i<10;i++)
  {
    if (mousePressed && (mouseButton == LEFT))
    {  

      tr.beginDraw();
      // tr.background(0);
      tr.fill(250);
      tr.stroke(250);
      tr.strokeWeight(1);
      tr.line(mouseX+random(8), mouseY+random(8), pmouseX+random(8), pmouseY+random(8));
      tr.endDraw();
      
      image(tr, 0, 0); 
      
    }
  }

 }
