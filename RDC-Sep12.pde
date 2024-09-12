PShader miShader;
float v;
float posx [] = new float[90];
float posy [] = new float[90];
float dposx [] = new float[90];
float dposy [] = new float[90];
float vw [] = new float[90];
float vh [] = new float[90];
float rojo [] = new float[90];
float verde [] = new float[90];
float azul [] = new float[90];
float lim[] = new float[90];
float vel[] = new float[90];
float tam[] = new float[90];
void setup(){
  size(500,500,P2D);
  miShader = loadShader("miShader.glsl");  
  v= 0;
  for(int i = 0; i<90; i++){
    posx[i] = random(1);
    posy[i] = random(1);
    vw[i] = random(0.1,0.4);
    vh[i] = random(0.1,0.4);
    rojo[i]=random(1);
   
    verde[i]=random(1);

    azul[i]=random(1);
   
     dposx [i] = random(-0.01,0.01);
     dposy [i] = random(-0.01,0.01);
     lim[i] = random(0.3,0.7);
     vel[i] = random(-0.1,0.1);
     tam[i] = random(5,20);
  }
}

void draw(){
  v+=0.05;  
  noStroke();
  shader(miShader);
  for(int i = 0; i<90; i++){
    posx[i]+=dposx[i];
    posy[i]+=dposy[i];
    if(posx[i]<0 || posx[i]>1){
      dposx[i]*=-1;
    }
    if(posy[i]<0 || posy[i]>1){
      dposy[i]*=-1;
    }
  }
  miShader.set("res",width*1f,height*1f);
  miShader.set("mouse", mouseX*1f/width,1-mouseY*1f/height);
  miShader.set("tiempo",v*1.0);
  miShader.set("posx",posx);
  miShader.set("posy",posy);
  miShader.set("vw",vw);
  miShader.set("vh",vh);
  miShader.set("rojo",rojo);
  miShader.set("verde",verde);
  miShader.set("azul",azul);
  miShader.set("lim",lim);
  miShader.set("vel",vel);
  miShader.set("tam",tam);
  rect(0,0,width,height);
  resetShader(); 
}
