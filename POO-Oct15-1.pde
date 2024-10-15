PImage imagen; 

void setup(){
  size(450,450);
  imagen = loadImage("gatocubrebocas.png");
  background(255);
}

void draw(){  
  int x = round(random(width));
  int y = round(random(height));
  int w = round(random(10,20));
  int h = round(random(50,200));
  PImage recorte = imagen.get(x,y,w,h);
  tint(random(255),random(255),random(255));
  image(recorte, x+random(-10,10),y+random(-20,20));
}

void keyPressed(){
  saveFrame("gato.png");
}
