PImage gato;
PShader shader;
PVector dRojo;
PVector dVerde;
PVector dAzul;
float rota [] = new float[3];
float ampx;
float ampy;
float freqx;
float freqy;

void setup(){
  size(450,450,P2D);
  gato = loadImage("gatocubrebocas.png");
  shader = loadShader("miShader.glsl");
  dRojo = new PVector(0.0,0);//PVector.random2D().mult(random(0.05));
  dVerde = new PVector(0,0);//PVector.random2D().mult(random(0.05));
  dAzul = new PVector(0,0);//PVector.random2D().mult(random(0.05));
  for(int i = 0; i<3; i++){
    rota[i] = random(-0.05,0.05);
  }
  ampx = random(0.1);
  ampy = random(0.1);
  freqx = random(10,100);
  freqy = random(10,100);
  frameRate(15);
}

void draw(){
  int cual = floor(random(2));
  ampx = random(0.1);
  ampy = random(0.1);
  freqx = random(10,100);
  freqy = random(10,100);
  dRojo = PVector.random2D().mult(random(0.05));
  dVerde = PVector.random2D().mult(random(0.05));
  dAzul = PVector.random2D().mult(random(0.05));

  shader(shader);
  shader.set("dRojo",dRojo.x,dRojo.y);
  shader.set("dVerde",dVerde.x,dVerde.y);
  shader.set("dAzul",dAzul.x,dAzul.y);
  shader.set("ampx", ampx);
  shader.set("ampy", ampy);
  shader.set("freqx", freqx);
  shader.set("freqy", freqy);
  shader.set("cual",cual);
  image(gato,0,0);
}
