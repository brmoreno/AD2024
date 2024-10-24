PImage gato;
PShader shader;
float t;
float [] dx = new float[20];
float [] ddx = new float[20];
float [] dy = new float[20];
float [] ddy = new float[20];

void setup(){
  size(450,450,P2D);
  gato = loadImage("gatocubrebocas.png");
  shader = loadShader("miShader.glsl");
  for(int i = 0; i< 20; i++){
    ddx[i] = random(-0.01,0.01);
    ddy[i] = random(-0.01,0.01);
  }
}

void draw(){ 
  for(int i = 0; i<20;i++){
    dx[i]+=ddx[i];
    dy[i]+=ddy[i];
  }
  shader(shader);
  shader.set("tiempo",t);
  shader.set("mouse",mouseX*1f/width,1-mouseY*1f/height );
  shader.set("cx",random(-0.3,0.3));
  shader.set("dx",dx);
  shader.set("dy",dy);
  image(gato,0,0);
  t++;
}
