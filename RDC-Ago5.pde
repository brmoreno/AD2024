int x = 100;
int y = 100;

void setup(){
  size(500,500);
}

void draw(){
  loadPixels();
  for(int i = 0; i<pixels.length;i++){
    pixels[i] = color(255,0,0);
  }
  
  miRectangulo(x,y,100,100,color(255));
  updatePixels();
}

void miRectangulo(int px_, int py_, int w_, int h_, color c_){ 
    for(int j = py_; j<py_+h_; j++){
      for(int i=px_; i<px_ +w_ && px_ +w_<width ; i++ ){
        pixels[i + j*width] = c_ ;
      }
    }    
}

void miCirculo(int px_, int py_, int w_, int h_, color c_){ 
    for(int j = py_; j<py_+h_; j++){
      for(int i=px_; i<px_ +w_ && px_ +w_<width ; i++ ){
        pixels[i + j*width] = c_ ;
      }
    }    
}
