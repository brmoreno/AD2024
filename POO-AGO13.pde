//Variable Globales
float x;
float y;
int t;
color fondo;
color c;
float dx;

void setup(){
  size(500,500);
  x = width/2;
  y = height/2;
  t = 100;
  fondo = color(255);
  c = color(255,0,0);
  dx = 0.5;
}


void draw(){ 
  background(fondo);
  noStroke();
  fill(c);
  ellipse(x,y,t,t);
  x+=dx;
  float radio = t/2; 
  if( x >= width - radio  ){
    println("la elipse está en el límite");
    dx= -0.5;
  }
}
