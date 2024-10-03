Juego elJuego;

void setup(){
  size(500,500);
  elJuego = new Juego();
}

void draw(){
  background(255);
  elJuego.display();
}

void keyPressed(){
  elJuego.enKeyPressed();
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
    if(x<0 ){
      dx=abs(dx);
    }
    if(x>width){
      dx=-abs(dx);
    }
    if(y<0 ){
      dy=abs(dy);
    }
    if(y>height){
      dy=-abs(dy);
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



class Juego{
  int vidas;
  int estado; //0inicio,1juego,2gané,3perdí,4finjuego,5gameover
  int nivel;
  Nivel n;
  
  Juego(){
    vidas = 3;
    estado = 0 ;
    nivel = 1;
    n = establecerNivel();
  }
  
  void display(){
    println("nivel=" + nivel + " vidas=" +vidas);
    switch(estado){
      case 0:
       background(255,255,0);
      break;
      case 1:
      n.funcionamiento();
        if(n.estado == 1){
          estado = 2;
        }
        if(n.estado == 2){
          estado = 3;
        }
      break;
      case 2:
       background(0,255,0);
      break;
      case 3:
        background(255,0,0);
      break;
      case 4:
        background(255);
      break;
      case 5:
        background(0);
      break;
    }
  }
  
  void enKeyPressed(){
    switch(estado){
      case 0:
        if(key == 'n'){
          estado = 1;
        }
      break;
      case 1:
      break;
      case 2:
        if(key == 'n'){
          if(nivel == 4){
            estado = 4;
          }
          else{
            nivel++;
            n = establecerNivel();
            estado = 1;          
          }
        }
      break;
      case 3:
        if(key == 'n'){
          if(vidas == 0){
            estado = 5;
          }
          else{
            vidas--;
            n = establecerNivel();
            estado = 1;
          }
        }
      break;
      case 4:
        if(key == 'n'){
          vidas = 3;
          nivel = 1;
          estado = 0;
          n = establecerNivel();
        }
      break;
      case 5:
      if(key == 'n'){
          vidas = 3;
          nivel = 1;
          estado = 0;
          n = establecerNivel();
        }      
      break;     
    }
  } 
  
  Nivel establecerNivel(){
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo>();
    Enemigo uno = new Enemigo(400,400,80,0);
    Enemigo dos;
    Enemigo tres;
    Enemigo cuatro;
    enemigos.add(uno);
    Nivel actual = new Nivel(2,100,100,enemigos);     
    switch(nivel){
      case 2:
      enemigos = new ArrayList <Enemigo>();
      uno = new Enemigo(100,400,100,1);
      dos = new Enemigo(400,400,110,1);
      enemigos.add(uno);
      enemigos.add(dos);
      actual = new Nivel(3,100,100,enemigos);
      break;
      case 3:
      enemigos = new ArrayList <Enemigo>();
      uno = new Enemigo(100,400,100,1);
      dos = new Enemigo(400,400,110,1);
      tres = new Enemigo(100,100,110,2);
      enemigos.add(uno);
      enemigos.add(dos);
      enemigos.add(tres);
      actual = new Nivel(3,100,100,enemigos);
      break;
      case 4:
      uno = new Enemigo(100,400,100,1);
      dos = new Enemigo(400,400,110,1);
      tres = new Enemigo(100,100,110,2);
      cuatro = new Enemigo(100,100,110,2);
      enemigos.add(uno);
      enemigos.add(dos);
      enemigos.add(tres);
      enemigos.add(cuatro);
      actual = new Nivel(3,100,100,enemigos);
      break;
    }
    return actual;
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
  ArrayList <Enemigo> enemigos;
  int estado;// 0:sigo jugando, 1: gané, 2: perdí 
  int contador;
  
  // Constructor
  Nivel(float v_, int x_, int y_, ArrayList <Enemigo> enemigos_){
    elJugador = new Jugador(v_);
    elItem = new Item(x_, y_);
    enemigos = enemigos_;
  }
    
  //Métodos
  void funcionamiento(){
    contador++;
    if(contador%100 == 0){
      PVector p = PVector.random2D().mult(350);
      Enemigo e= new Enemigo(width/2+p.x,height/2+p.y,random(50,100),2);
      enemigos.add(e);
    }
    elJugador.display();
    elJugador.mover();
    elItem.display();
    if(elJugador.captura(elItem)){
      estado = 1;
    }
    for(Enemigo e:enemigos){
      funcionEnemigo(e);
    }
  }
  
  void funcionEnemigo(Enemigo e_){
    if(e_ != null){
      e_.display();
      e_.movimiento();
      if(elJugador.colision(e_)){
        estado = 2;
      }
    }
  }  
}
