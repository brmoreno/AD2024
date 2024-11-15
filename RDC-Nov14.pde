class Nodo{
  PVector pos;
  PVector v;
  float r;
  float f;
  
  Nodo(){
    pos = new PVector(random(1),random(1));
    r = random(0.1,0.3);
    f = random(-0.1,0.3);
    v = PVector.random2D().mult(0.0001);
  }
  
  void mover(){
    //pos.add(v);
  }
}

ArrayList <Nodo> nodos;

PShader shader;
float t;
void setup(){
  size(400,400,P2D);
  nodos = new ArrayList <Nodo>();
  for(int i = 0; i<200; i++){
    nodos.add(new Nodo());
  }
  shader = loadShader("miShader.glsl");
  
}

void draw(){
  float px[] = new float[200];
  float py[] = new float[200];
  float r[] = new float[200];
  float f[] = new float[200];
  
  for(int i = 0; i<200; i++){
    Nodo n = nodos.get(i);
    px[i] = n.pos.x;
    py[i] = n.pos.y;
    r[i] = n.r;
    f[i] = n.f;
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
  shader.set("f",f);
  rect(0,0,width,height);  
  t++;
  
}
