PImage imagen; 
float v = 1;
void setup(){
  size(450,450);
  imagen = loadImage("gatocubrebocas.png");
  background(255);
}

void draw(){
  PImage copia = imagen.copy();
  copia.filter(THRESHOLD,v);
  color c = color(random(255),random(255),random(255));
  PImage copia2 = new PImage(450,450,ARGB);
  for(int i = 0; i<copia.pixels.length;i++){
    if(copia.pixels[i] == color(255)){
      copia2.pixels[i] = color(0,0,0,0);
    }
    else{
      copia2.pixels[i] = c;
    }
  }
  copia.updatePixels();
  image(copia2,0,0);
  v-= 0.05;
  if(v < 0){
    v=1 ;
  }
}

void keyPressed(){
  saveFrame("gato.png");
}
