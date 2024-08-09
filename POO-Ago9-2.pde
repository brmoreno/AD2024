color fondo;
color c;
float x;
int y ;
float t;
float dt;
float dr;
float dg;
float db;

void setup(){
  size(500,500);
  fondo = color(random(255),random(255),random(255));
  c = color(random(255),random(255),random(255));
  x = 0;
  y = 250;
  t = round(random(20,70));
  background(fondo);
  dt = 0;
}

void draw(){ 
  float rojo = map(sin(dr),-1,1,0,255);
  float verde =map(sin(dg),-1,1,0,255);
  float azul= map(sin(db),-1,1,0,255); 
  fill(rojo,verde,azul);
  noStroke();
  ellipse(x%500,y,t,t);
  x+= 0.7;
  t = map(sin(dt),-1,1,20,400);
  dt+= 0.05;
  dr+= 0.1;
  dg+= 0.3;
  db+= 0.5;
}
