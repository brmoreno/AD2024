PShader miShader;
float r[] = new float[4];
float g[] = new float[4]; 
float b[] = new float[4];
float dr[] = new float[4];
float dg [] =  new float[4]; 
float db [] = new float[4];

void setup(){
  size(400,400,P2D);
  miShader = loadShader("miShader.glsl");
  for(int i = 0 ; i<4; i++){
  dr[i] = random(-0.1,0.1);
  dg[i] = random(-0.1,0.1);
  db[i] = random(-0.1,0.1);
  }

}

void draw(){
  for(int i = 0; i<4; i++){
  r[i]+=dr[i];
  g[i]+=dg[i];
  b[i]+=db[i];
  }

  noStroke();
  shader(miShader);
  miShader.set("res",width*1f,height*1f);
  miShader.set("mouse", mouseX*1f/width,1-mouseY*1f/height);
  miShader.set("color1",abs(sin(r[0])),abs(sin(g[0])),abs(sin(b[0])));
  miShader.set("color2",abs(sin(r[1])),abs(sin(g[1])),abs(sin(b[1])));
  miShader.set("color3",abs(sin(r[2])),abs(sin(g[2])),abs(sin(b[2])));
  miShader.set("color4",abs(sin(r[3])),abs(sin(g[3])),abs(sin(b[3])));

  rect(0,0,width,height);
}
