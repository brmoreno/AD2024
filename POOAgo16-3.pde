
float d;
float dx;
void setup(){
  size(500,500);
}
void draw(){
  d +=0.01;
  dx+= 0.02;
  for(int i = 0; i<width; i+=10){
    for(int j = 0; j<height; j+=10){
      float r = noise(dx+i*0.01+4,j*0.01+7,d)*255;
      float g =  noise(dx+i*0.01+10,j*0.01+2,d)*255; 
      float b = noise(dx+i*0.01+7,j*0.01+3,d)*255;
      fill(r,b,g);
      rect(i,j,10,10);
    }
  }
}
