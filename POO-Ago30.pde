class Particula {
  //atributos;
  color c;
  int t;
  float x;
  float y;
  float dx;
  float dy;
  
  Particula(){
    c = color(random(255),random(255),random(255));
    t = round(random(50,100));
    x = width/2;
    y = height/2;
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  void display(){
    fill(c);
    ellipse(x,y,t,t);
  }  
}

Particula una;
Particula otra;

void setup(){
  size(400,400);
  una = new Particula();
  otra = new Particula();
}

void draw(){
  background(255);
  una.display();
  una.mover();
  otra.display();
  otra.mover();
}
