//Variable Globales
float x;
float y;
int t;
color fondo;
color c;
float dx;
float dy;

float x2;
float y2;
int t2;
color c2;

float x3;
float y3;
int t3;
color c3;

void setup(){
  size(500,500);
  x = width/2;
  y = height/2;
  t = 100;
  fondo = color(255);
  c = color(255,0,0);
  dx = 2;
  dy = 0.7;
  t2 = 100;
  c2 = color(0,0,255);
  x3 = width/2;
  y3 = height/2;
  t3 = 100;
  c3 = color(0,255,0);
}


void draw(){ 
  background(fondo);
  noStroke();
  fill(c);
  ellipse(x,y,t,t);
  x+=dx;
  y+=dy;
  float radio = t/2; 
  if( x >= width - radio  ){
    dx *= -1 ;
  }
  if(x <= radio){
    dx *= -1 ;
  }
  
  if(y >= height - radio){
    dy *= -1;
  }
  
  if( y<= radio){
    dy *= -1;
  }
  
  x2 = mouseX;
  y2 = mouseY;
  if(mousePressed){
    c2 = color(random(255),random(255),random(255));
  }
  fill(c2);
  ellipse(x2,y2,t2,t2);
  
  if(keyPressed){
    switch(key){
      case 'w':
        y3--;
      break;
      case 's':
        y3++;
      break;
      case 'a':
        x3--;
      break;
      case 'd':
        x3++;
      break;
    }
  }  
  fill(c3);
  ellipse(x3,y3,t3,t3);
}
