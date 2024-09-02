PShader miShader;
float nBarras[] = new float [10];
float vel [] = new float[10];
float ancho[] = new float [10];
color misColores[] = {#2EA7A4,#B237CB,#338115,#8E5B0E}; 
float rojo[] = new float [10];
float verde[] = new float [10]; 
float azul[] = new float [10];
float intensidad[] = new float [10];

float v;
void setup(){
  size(500,500,P2D);
  miShader = loadShader("miShader.glsl");
  for(int i = 0 ; i<4; i++){
    rojo[i] = red(misColores[i])/255;
    verde[i] = green(misColores[i])/255;
    azul[i] = blue (misColores[i])/255; 
   }
  for(int i = 0 ; i<10; i++){
    nBarras[i] = random(random(4,15));
    vel[i]= random(-0.1,0.1);
    ancho[i] = random(1);    
    
    intensidad[i] = random(1);
  }
  v= 0;
}

void draw(){
  v+=0.05;
  
  noStroke();
  shader(miShader);
  miShader.set("res",width*1f,height*1f);
  miShader.set("mouse", mouseX*1f/width,1-mouseY*1f/height);
  miShader.set("tiempo",v*1.0);
  miShader.set("nBarras",nBarras);
  miShader.set("vel",vel);
  miShader.set("ancho", ancho);
  miShader.set("rojo", rojo);
  miShader.set("verde", verde);
  miShader.set("azul", azul);  
  miShader.set("intensidad",intensidad);
  rect(0,0,width,height);
  resetShader(); 
}
