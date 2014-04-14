PGraphics tr;
Wiggle w;

void setup() {
  size (800, 800);
  tr = createGraphics(width,height);
  smooth();
  w = new Wiggle();
  background(0);
}

void draw() {
  // background(0);
   fill(250);
     w.display();
  w.wiggle();
  
  for ( int i=0;i<10;i++)
  {
    if (mousePressed && (mouseButton == LEFT))
    {  

      tr.beginDraw();
      // tr.background(0);
      tr.fill(250);
      tr.stroke(250);
      tr.strokeWeight(0.5);
      tr.line(mouseX+random(8), mouseY+random(8), pmouseX+random(8), pmouseY+random(8));
      tr.endDraw();
      
      image(tr, 0, 0); 
      
    }
  }

 }


class Wiggle {

  float x, y;
  float yoff =0;
  
  ArrayList<PVector> original;
  
  Wiggle(){
  
  x=width/2;
  y = height/2;
  
  original = new ArrayList<PVector>();
  for (float a = 0; a < TWO_PI; a+=0.2) {
      PVector v = PVector.fromAngle(a);
      v.mult(100);
      original.add(v);
    }
  
  }
  void wiggle() {
    float xoff = 0;
    // Apply an offset to each vertex
    for (int i = 0; i < 30; i++) {
      // Calculate a new vertex location based on noise around "original" location
      PVector pos = original.get(i);
      float a = TWO_PI*noise(xoff,yoff);
      PVector r = PVector.fromAngle(a);
      r.mult(4);
      r.add(pos);
      // Set the location of each vertex to the new one
      // s.setVertex(i, r.x, r.y);
      // increment perlin noise x value
      xoff+= 0.5;
    }
    // Increment perlin noise y value
    yoff += 0.02;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    popMatrix();
  }
}

