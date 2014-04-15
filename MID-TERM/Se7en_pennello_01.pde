void setup()
{
  size (800, 800);
  smooth();
  background(0);
}

void draw() {

  fill(240);

  for ( int i=0;i<30;i++)
  {
    if (mousePressed && (mouseButton == LEFT))
    {
      line(mouseX+random(10), mouseY+random(10), pmouseX+random(10), pmouseY+random(10));
      strokeWeight(1);
      stroke(240);
    }
  }

}
