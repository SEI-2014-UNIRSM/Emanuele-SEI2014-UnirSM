// Disegnare cerchi random nella posizione del mouse
// Se clicco col mouse, la composizione viene resettata e parte la successiva

void setup(){
size(600, 600);
smooth();
noCursor();
background(0,0,0);

}

void draw () {

float h = random(0,360);
float s = random(0,100);
float b = random (0,100);

if (mousePressed) {
background(0,0,0);
}

else{
noFill();
stroke(h,s,b);
ellipse(mouseX, mouseY, mouseX-300, mouseY-300);

}
}
