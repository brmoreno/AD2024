color fondo;
color c;
int x;
int y ;
int t;

void setup(){
  size(500,500);
  fondo = color(random(255),random(255),random(255));
  c = color(random(255),random(255),random(255));
  x = 0;
  y = 250;
  t = round(random(20,70));
  background(fondo);
}

void draw(){  
  fill(c);
  stroke(255);
   background(fondo);
  ellipse(x,y,t*4,t*4);
  ellipse(x,y,t*3,t*3);
  ellipse(x,y,t*2,t*2);
  ellipse(x,y,t,t);
  x++;
}
