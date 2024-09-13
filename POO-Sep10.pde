Jugador elJugador;

void setup(){
  size(500,500);
  elJugador = new Jugador(2);
  
}

void draw(){
   background(255);
  elJugador.display();
  elJugador.mover();
}

class Enemigo{
  //Atributos
  float d;
  color c;
  float x, y;
  int comportamiento; // 0: estatico, 1: aleatorio, 2: constante
  
  Enemigo(float x_, float y_, float d_,int comp_){
    x = x_;
    y = y_;
    d = d_;
    c =  color (0,0,255);
    comportamiento = comp_;
  }
  
  
  //Métodos
  void movimiento(){
  }
  
  void display(){
  }
  
}


class Item{
  //Atributos
  float d;
  color c;
  float x,y;
  
  //Constructor
  Item(float x_, float y_){
    d = 20;
    c =  color(255,255,0);
    x = x_;
    y = y_; 
  }
  
  //Métodos
  void display(){
  }
  
}


class Jugador{
  //Atributos;
  float d;
  color c;
  float x, y;
  // movimiento
  float v;
  float a;
  
  //Constructor
  Jugador(float v_){
    d = 60;
    c = color(255,0,0);
    x = width/2;
    y = height/2;
    a = 0;
    v = v_;
  }
   
   
  //Métodos;
  void display(){
    noStroke();
    fill(c);
    circle(x,y,d);
  }
  
  void mover(){
    float dx = cos(a)*v;
    float dy = sin(a)*v;
    x += dx;
    y += dy;
    if(keyPressed){
      if(key == 'a'){
        a-=0.05;
      }
      if(key == 'd'){
        a+=0.05;
      }
    }
  }
  
  void colision(){
  }
  
  void captura(){
  }
}

