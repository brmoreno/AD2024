class Nodo{
  PVector pos;
  PVector v;
  float r;
  float g;
  float b; 
  
  Nodo(){
    pos = new PVector(random(1),random(1));
    r = random(1);
    g = random(1);
    b = random(1);
    v = PVector.random2D().mult(0.001);
  }
  
  void mover(){
    pos.add(v);
  }
}

ArrayList <Nodo> nodos;
PImage gato;

PShader shader;
float t;
void setup(){
  size(400,400,P2D);
  nodos = new ArrayList <Nodo>();
  for(int i = 0; i<200; i++){
    nodos.add(new Nodo());
  }
  shader = loadShader("miShader.glsl");
  gato = loadImage("gatocubrebocas.png");
}

void draw(){
  
  float px[] = new float[200];
  float py[] = new float[200];
  float r[] = new float[200];
  float g[] = new float[200];
  float b[] = new float[200];
  
 
  for(int i = 0; i<200; i++){
    Nodo n = nodos.get(i);
    px[i] = n.pos.x;
    py[i] = n.pos.y;
    r[i] = n.r;
    g[i] = n.g;
    b[i] = n.b;
    n.mover();    
  }
  
  shader(shader);
  shader.set("res",width*1f,height*1f);
  shader.set("tiempo",t);
  shader.set("mouse",mouseX*1f/width, mouseY/height*1f);
  shader.set("seed",random(40,50),random(50,100.0));
  shader.set("px",px);
  shader.set("py",py);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader.set("gato",gato);
  
  rect(0,0,width,height);  
  t++;
  
}
