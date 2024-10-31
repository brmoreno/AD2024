PImage gato;
PShader shader;
float t;
PImage valoresColor;


void setup(){
  size(450,450,P2D);
  gato = loadImage("gatocubrebocas.png");
  shader = loadShader("miShader2.glsl");
  valoresColor = createImage(500,1,ARGB);
  for(int i = 0; i<valoresColor.pixels.length; i++){
     valoresColor.pixels[i] = color(random(255),random(255),random(255),random(255));
   }
}

void draw(){ 
  background(255);
  shader(shader);
  shader.set("tiempo",t);
  shader.set("mouse",mouseX*1f/width,1-mouseY*1f/height );
  shader.set("cx",random(-0.3,0.3));
  shader.set("vC",valoresColor);
  image(gato,0,0);
  t++;
}

void keyPressed(){
  if(key == 'q'){
     shader = loadShader("miShader0.glsl");
  }
  
  if(key == 'w'){
     shader = loadShader("miShader1.glsl");
  }
  
  if(key == 'e'){
     shader = loadShader("miShader2.glsl");
  }
  
  if(key == 'a'){
    gato = loadImage("gatocubrebocas.png");
    shader = loadShader("miShader2.glsl");
  }
  
  if(key == 's'){
    gato = loadImage("gatoINV.png");
    shader = loadShader("miShader1.glsl");
  }
}
