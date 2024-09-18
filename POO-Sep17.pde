Nivel elNivel;

void setup(){
  size(500,500);
  Enemigo uno = new Enemigo(400,400,100,1);
  Enemigo dos = new Enemigo(400,100,90,0);
  Enemigo tres = new Enemigo(100,400,90,2);
  
  elNivel = new Nivel(2,100,100,uno,dos,tres);
}

void draw(){
  background(255);
  switch(elNivel.estado){
   //sigo jugando
  case 0:
  elNivel.funcionamiento();
  break;
  
  //gané
  case 1:
   background(0,255,0);
  break;
  
  // perdí
  case 2:
   background(250,0,0);
  break;  
  }

}


void keyPressed(){
  if(elNivel.estado == 1 ||elNivel.estado == 2){
    Enemigo uno = new Enemigo(400,400,100,1);
    Enemigo dos = new Enemigo(400,100,90,0);
    Enemigo tres = new Enemigo(100,400,90,2);
  
     elNivel = new Nivel(2,100,100,uno,dos,tres);
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
  
  boolean captura(Item i_){
    boolean resultado =false;
    float distancia = dist(this.x,this.y,i_.x,i_.y);
    float sumaRadios = this.d/2 + i_.d/2;
    if(distancia<sumaRadios){
      resultado = true;
    }
    return (resultado);    
  }
}



class Nivel{
  Jugador elJugador;
  Item elItem;
  Enemigo uno ;
  Enemigo dos;
  Enemigo tres;
  Enemigo cuatro;
  int estado;// 0:sigo jugando, 1: gané, 2: perdí 
  
  // Constructor
  Nivel(float v_, int x_, int y_, Enemigo uno_){
    elJugador = new Jugador(v_);
    elItem = new Item(x_, y_);
    uno = uno_;
  }
  
  Nivel(float v_, int x_, int y_, Enemigo uno_, Enemigo dos_){
    elJugador = new Jugador(v_);
    elItem = new Item(x_, y_);
    uno = uno_;
    dos = dos_;
  }
  
  Nivel(float v_, int x_, int y_, Enemigo uno_, Enemigo dos_, Enemigo tres_){
    elJugador = new Jugador(v_);
    elItem = new Item(x_, y_);
    uno = uno_;
    dos = dos_;
    tres = tres_;
  }
  
  Nivel(float v_, int x_, int y_, Enemigo uno_, Enemigo dos_, Enemigo tres_, Enemigo cuatro_){
    elJugador = new Jugador(v_);
    elItem = new Item(x_, y_);
    uno = uno_;
    dos = dos_;
    tres = tres_;
    cuatro = cuatro_;
  } 
    
  //Métodos
  void funcionamiento(){
    elJugador.display();
    elJugador.mover();
    elItem.display();
    if(elJugador.captura(elItem)){
      estado = 1;
    }
    funcionEmemigo(uno);
    funcionEmemigo(dos);
    funcionEmemigo(tres);
    funcionEmemigo(cuatro);
  }
  
  void funcionEmemigo(Enemigo e_){
    if(e_ != null){
      e_.display();
      e_.movimiento();
      if(elJugador.colision(e_)){
        estado = 2;
      }
    }
  }  
}
