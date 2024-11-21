class Nodo{
  PVector pos;
  PVector v;
  float r;
  float f;
  
  Nodo(){
    pos = new PVector(random(1),random(1));
    r = random(0.1,0.3);
    f = random(-0.1,0.3);
    v = PVector.random2D().mult(0.001);
  }
  
  void mover(){
    pos.add(v);
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
  
  float vmax = 0;
  float vmin = 0;
  for(int i = 0; i<200; i++){
    Nodo n = nodos.get(i);
    px[i] = n.pos.x;
    py[i] = n.pos.y;
    r[i] = n.r;
    f[i] = n.f;
    n.mover();
    if(n.pos.x>0 && n.pos.x<1 && n.pos.y>0 && n.pos.y<1){
      float fsum = 0;
      for(int j = 0; j<200; j++){
        Nodo m = nodos.get(j);
        float dist = dist(n.pos.x,n.pos.y,m.pos.x,m.pos.y);
        if(dist<n.r){
          float inten = (n.r-dist)/n.r;
          inten*= m.f;
          fsum+= inten;
        }
      }
      if(fsum > vmax ){
        vmax = fsum;
      }
      if(fsum<vmin){
        vmin = fsum;
      }
    }
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
  shader.set("vmax",vmax);
  shader.set("vmin",vmin);
  println(vmax+ "  "+ vmin);
  
  rect(0,0,width,height);  
  t++;
