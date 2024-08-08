class Particula {  
  PVector pos;
  PVector dir;
  int t;
  int r;
  int g;
  int b;
  
  Particula(int x_, int y_){
    pos = new PVector(x_,y_);
    dir = PVector.random2D();
    t = round(random(80,200));
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
  }
  
  void display(){
    fill(r,g,b);
    noStroke();
    miCirculo(round(pos.x),round(pos.y),t/2);
  }
  
  void mover(){
    pos.add(dir);
    
    if(pos.x  < 0){
    dir.x *=-1;
    }
    if(pos.x  > width){
    dir.x *=-1;
    }
    if(pos.y < 0){
    dir.y *=-1;
    }
    if(pos.y  > height){
    dir.y *=-1;
    }
  } 
  
  void miCirculo(int px_, int py_, int r_){ 
    for(int j = py_-r_ < 0? 0: py_-r_; j<py_+r_ && j<height; j++){
      for(int i=px_-r_ < 0? 0: px_-r_  ; i<px_ +r_ && i<width ; i++ ){
        float distancia = dist(px_,py_,i,j);        
        if(distancia<r_){
          float inten = map(distancia,0,r_,1,0);
          color c = pixels[i +j*width];
          float rojo = red(c);
          float verde = green(c);
          float azul = blue(c);
          pixels[i + j*width] = color(rojo +r*inten,verde +g*inten, azul +b*inten) ;
        }
      }
    }    
  }
}

int x = 200;
int y = 200;
Particula una;
ArrayList <Particula> particulas;

void setup(){
  size(500,500);
  una = new Particula(width/2, height/2);
  particulas = new ArrayList <Particula> ();
  for(int i = 0; i< 100; i++){
    particulas.add(new Particula(width/2,height/2));
  }
}

void draw(){
  loadPixels();
  for(int i = 0; i<pixels.length;i++){
    pixels[i] = color(0,0,0);
  }
  
  una.display();
  una.mover();
  
  for(Particula p:particulas){
    p.mover();
    p.display();
  }
  updatePixels();
}

void miRectangulo(int px_, int py_, int w_, int h_, color c_){ 
    for(int j = py_; j<py_+h_ && j<height; j++){
      for(int i=px_; i<px_ +w_ && i<width ; i++ ){
        pixels[i + j*width] = c_ ;
      }
    }    
}
