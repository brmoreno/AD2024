class Particula{
  PVector p;
  PVector v;
  float t;
  float r;
  float d;
  float dd;
  color c;
  
  Particula(){
    p = new PVector(random(width),random(height));
    v = PVector.random2D();
    t = random(10,80);
    r = random(-0.01,0.01);
    d = random(TWO_PI);
    dd = random(-0.1,0.1);
    c = imagen.get(round(p.x),round(p.y));
  }
  
  void mover(){
    p.add(v);
    v.rotate(r);
  }
  
  void display(){
    noStroke();
    color actual = imagen.get(round(p.x),round(p.y));
    c = lerpColor(c,actual,0.1);
    fill(c);
    d+=dd;
    circle(p.x,p.y,t*sin(d));
  }
  
  void display2(){
    pushMatrix();
    translate(p.x,p.y);
    image(imagen,0,0,t,t);
    popMatrix();
  }  
}


PImage imagen; 
int v = 10;
ArrayList <Particula> particulas;
void setup(){
  size(450,450);
  imagen = loadImage("gatocubrebocas.png");
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<100; i++){
    particulas.add(new Particula());
  }
  background(255);
}

void draw(){
  
  for(Particula p: particulas){
    p.mover();
    p.display2();
  }
}

void keyPressed(){
  saveFrame("gato.png");
}
