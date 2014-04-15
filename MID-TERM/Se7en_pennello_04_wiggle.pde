PGraphics tr;
PGraphics wig;

float xoff = 0.0;
float yoff = 0.0;

void setup() {
  size (800, 800);
  tr = createGraphics(width, height);
  wig = createGraphics(width, height);
  smooth();
  background(0);
}

void draw() {
  // background(0);
  xoff = xoff +- 1;
  yoff = yoff +- 1;
  float n = noise(xoff)*width;
  float m = noise(yoff)*height;
  fill(250);


  for ( int i=0;i<10;i++)
  {
    if (mousePressed && (mouseButton == LEFT))
    {  

      tr.beginDraw();
      // tr.background(0);
      tr.fill(250);
      tr.stroke(250);
      tr.strokeWeight(0.5);
      tr.line(mouseX+random(4), mouseY+random(4), pmouseX+random(4), pmouseY+random(4));
      tr.endDraw();
      
      wig.beginDraw();
      wig.fill(200);
      wig.stroke(200);
      wig.strokeWeight(0.25);
      wig.line((mouseX+random(4)*m), (mouseY+random(4)*n), (pmouseX+random(4)*m), (pmouseY+random(4)*n)) ;
      wig.endDraw();
      

      image(tr, 0, 0);
      image(wig,0,0);
    }
  }
}
