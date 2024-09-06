PShader miShader;
float[] rojo = new float[6];
float[] azul = new float[6];
float [] verde = new float[6];
float [] dir = {1,0,-1};
float [] escala = new float[6];

float v;
void setup(){
  size(500,500,P2D);
  miShader = loadShader("miShader.glsl");
  for(int i = 0; i<6; i++){
    rojo[i] = random(1);
    verde[i] = random(1);
    azul[i] = random(1);
    escala[i] = random(1,PI*5);
  }
}

void draw(){
  v+=0.01;
  
  noStroke();
  shader(miShader);
  miShader.set("res",width*1f,height*1f);
  miShader.set("mouse", mouseX*1f/width,1-mouseY*1f/height);
  miShader.set("tiempo",v*1.0);
  miShader.set("rojo",rojo);
  miShader.set("verde",verde);
  miShader.set("azul",azul);
  miShader.set("dir",dir);
  miShader.set("escala",escala);
  rect(0,0,width,height);
  resetShader(); 
}
