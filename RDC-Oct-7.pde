class Particula{
  PVector p;
  PVector v;
  
  Particula(){
    p = new PVector(random(width),random(height));
    v = PVector.random2D();
  }
  
  PVector alShader(){
    return new PVector(p.x/width,p.y/height);
  }
  
  void mover(){
    p.add(v);
    if(p.x<0 || p.x>width){
      v.x*= -1;
    }

    if(p.y<0 || p.y>height){
      v.y*= -1;
    }    
  }
}


PShader miShader;
float v;
ArrayList <Particula> particulas;
float colorP[] = new float[150];

void setup(){
  size(500,500,P2D);
  miShader = loadShader("miShader.glsl");  
  v= 0;
   particulas = new ArrayList <Particula>();
  for(int i =0 ;i<150; i++){
    particulas.add(new Particula());
    colorP[i] = random(1);
  }
}

void draw(){
  v+=0.05;  
  noStroke();
  float [] posx = new float[150];
  float [] posy = new float[150];
  for(int i = 0; i<150; i++){
    particulas.get(i).mover();
    PVector p = particulas.get(i).alShader();
    posx[i] = p.x;
    posy[i] = p.y;
  }
  
  shader(miShader);
  miShader.set("res",width*1f,height*1f);
  miShader.set("mouse", mouseX*1f/width,1-mouseY*1f/height);
  miShader.set("tiempo",v*1.0);
  miShader.set("posx",posx);
  miShader.set("posy",posy);
  miShader.set("colorP",colorP);
  rect(0,0,width,height);
}
