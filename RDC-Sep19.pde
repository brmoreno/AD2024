PShader miShader;
float v;
int tam = 150;
float posx [] = new float[tam];
float posy [] = new float[tam];
float dposx [] = new float[tam];
float dposy [] = new float[tam];
float radio [] = new float[tam];
float rojo [] = new float[tam];
float verde [] = new float[tam];
float azul [] = new float[tam];

void setup(){
  size(500,500,P2D);
  miShader = loadShader("miShader.glsl");  
  v= 0;
  for(int i = 0; i<tam; i++){
    posx[i] = random(1);
    posy[i] = random(1);
    radio[i] = random(0.05,0.2);

    rojo[i]=random(-0.5,1);
   
    verde[i]=random(-0.5,1);

    azul[i]=random(-0.5,1);
   
     dposx [i] = random(-0.01,0.01);
     dposy [i] = random(-0.01,0.01);
  }
}

void draw(){
  v+=0.05;  
  noStroke();
  shader(miShader);
  for(int i = 0; i<tam; i++){
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
  miShader.set("radio",radio);

  miShader.set("rojo",rojo);
  miShader.set("verde",verde);
  miShader.set("azul",azul);
  rect(0,0,width,height);
  resetShader(); 
}
