PShader miShader;
float nBarras[] = new float [20];
float vel [] = new float[20];
float ancho[] = new float [20];
float rojo[] = new float[20];
float verde[] = new float[20]; 
float azul[] = new float[20];

float nBarras2[] = new float [20];
float vel2 [] = new float[20];
float ancho2[] = new float [20];
float rojo2[] = new float[20];
float verde2[] = new float[20]; 
float azul2[] = new float[20];

float v;
void setup(){
  size(500,500,P2D);
  miShader = loadShader("miShader.glsl");
  for(int i = 0 ; i<20; i++){
    nBarras[i] = random(random(4,15));
    vel[i]= random(-0.1,0.1);
    ancho[i] = random(1);
    rojo[i] = random(0.2);
    verde[i] = random(0.2);
    azul[i] = random(0.2);
    
     nBarras2[i] = random(random(4,15));
    vel2[i]= random(-0.1,0.1);
    ancho2[i] = random(1);
    rojo2[i] = random(0.2);
    verde2[i] = random(0.2);
    azul2[i] = random(0.2);
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
  rect(0,0,width/2,height);
  resetShader();
  
  shader(miShader);
  miShader.set("res",width*1f,height*1f);
  miShader.set("mouse", mouseX*1f/width,1-mouseY*1f/height);
  miShader.set("tiempo",v*1.0);
  miShader.set("nBarras",nBarras2);
  miShader.set("vel",vel2);
  miShader.set("ancho", ancho2);
  miShader.set("rojo", rojo2);
  miShader.set("verde", verde2);
  miShader.set("azul", azul2);  
  rect(width/2,0,width/2,height);
  resetShader();
}
