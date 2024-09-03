class Circulo{
  float x;
  float y;
  int t;
  color c;
  int estado;  //0:puntero, 1: huir; 2: xsisolo;  
  int contador;
  // 3 estados: moverse hacia el puntero; 
  // huir del puntero;
  // moverse por si solos; 
  
  
  Circulo(int e_){
    x = round(random(width));
    y = round(random(height));;
    t = round(random(50,200));
    c = color(random(255),random(255),random(255));
    estado = e_;
  }
  
  Circulo(int x_, int y_, int e_){
    x = x_;
    y = y_;
    t = 200;
    c = color(0,255,0);
    estado = e_;
  }
  
  Circulo(int x_, int y_, int t_, color c_, int e_){
    x = x_;
    y = y_;
    t = t_;
    c = c_;
    estado = e_;
  }
  
  void display(){
    fill(c);
    ellipse(x,y,t,t);
  }
  
  void mover(){
    contador++;
    if(contador == 200){
      estado = floor(random(3));
      contador =0;
    }
    switch(estado){
      case 0:
        haciaElMouse();
      break;
      case 1:
        huir();
      break;
      case 2:
        solo();
      break;
    }
    x = constrain(x,0,width);
    y = constrain(y,0,width);
  }
  
  void haciaElMouse(){
    float distancia = dist(mouseX,mouseY,x,y);
    float dx = (mouseX-x)/distancia;
    float dy = (mouseY-y)/distancia;
    x+=dx;
    y+=dy;
  }
  
  void huir(){
    float distancia = dist(mouseX,mouseY,x,y);
    float dx = (mouseX-x)/distancia;
    float dy = (mouseY-y)/distancia;
    x-=dx;
    y-=dy;
  }
  
  void solo(){
    x+= random(-2,2);
    y+= random(-2,2);
  }
}


Circulo uno; 
Circulo dos;
Circulo tres;

void setup(){
  size(500,500);
  uno = new Circulo(100,100,60,color(255,0,0),0); 
  dos = new Circulo(1);
  tres = new Circulo(2);
}

void draw(){
  background(255);
  uno.display();
  uno.mover();
  dos.display();
  dos.mover();
  tres.display();
  tres.mover();
}
