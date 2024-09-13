Jugador elJugador;
Enemigo uno;
Enemigo dos;
Enemigo tres;
Item elItem;

void setup(){
  size(500,500);
  elJugador = new Jugador(2);
  elItem = new Item(100,100);
  uno = new Enemigo(400,100,100,0);
  dos = new Enemigo(400,400,60,1);
  tres = new Enemigo(100,400,120,2);
}

void draw(){
  background(255);
  elJugador.display();
  elJugador.mover();
  elItem.display();
  uno.display();
  uno.movimiento();
  dos.display();
  dos.movimiento();
  tres.display();
  tres.movimiento();
  
  if(elJugador.colision(uno)){
    println("colision");
  }
  else if(elJugador.colision(dos)){
    println("colision");
  }
  else if(elJugador.colision(tres)){
    println("colision");
  }
  else{
    println(" ");
  }
}


class Enemigo{
  //Atributos
  float d;
  color c;
  float x, y;
  int comportamiento; // 0: estatico, 1: aleatorio, 2: constante
  float dx,dy;
  
  Enemigo(float x_, float y_, float d_,int comp_){
    x = x_;
    y = y_;
    d = d_;
    c =  color (0,0,255);
    comportamiento = comp_;
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  
  //Métodos
  void display(){
    noStroke();
    fill(c);
    circle(x,y,d);
  }
  
  void movimiento(){
    switch(comportamiento){
      case 0:
        estatico();
      break;
      case 1:
        aleatorio();
      break;
      case 2:
        constante();
      break;
    }
  }
  
  void estatico(){
  }
  
  void aleatorio(){
    x += random(-2,2);
    y += random(-2,2);
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void constante(){
    x+=dx;
    y+=dy;
    if(x<0 || x>width){
      dx*=-1;
    }
    if(y<0 || y>height){
      dy*=-1;
    }
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
    noStroke();
    fill(c);
    circle(x,y,d);
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
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  boolean colision(Enemigo e_){
    boolean resultado = false;
    float distancia = dist(this.x,this.y,e_.x,e_.y);
    float sumaRadios = this.d/2 + e_.d/2;
    if(distancia < sumaRadios){
      resultado = true;
    }
    return(resultado);
  }
  
  void captura(){
  }
}
