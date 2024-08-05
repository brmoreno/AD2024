int x = 200;
int y = 200;

void setup(){
  size(500,500);
}

void draw(){
  loadPixels();
  for(int i = 0; i<pixels.length;i++){
    pixels[i] = color(255,0,0);
  }
  
  miRectangulo(x,y,100,100,color(255));
  miCirculo(x,y,50,color(0,0,255));
  updatePixels();
}

void miRectangulo(int px_, int py_, int w_, int h_, color c_){ 
    for(int j = py_; j<py_+h_ && j<height; j++){
      for(int i=px_; i<px_ +w_ && i<width ; i++ ){
        pixels[i + j*width] = c_ ;
      }
    }    
}

void miCirculo(int px_, int py_, int r_, color c_){ 
    for(int j = py_-r_; j<py_+r_ && j<height; j++){
      for(int i=px_-r_; i<px_ +r_ && i<width ; i++ ){
        float distancia = dist(px_,py_,i,j);
        if(distancia<r_){
          pixels[i + j*width] = c_ ;
        }
      }
    }    
}
