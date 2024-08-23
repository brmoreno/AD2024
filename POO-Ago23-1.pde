float x[] = new float[100];
float dx[] = new float[100];
float y[] = new float[100];
int n[] = new int[100];
float t[] = new float[100];
color uno [] = new color[100];
color dos [] = new color[100];

void setup(){
  size(500,500);
  fill(255);
  for(int i = 0; i<100; i++){
    x[i] = random(width);
    dx[i] = random(-1,1);
    y[i] = random(height);
    n[i] = round(random(4,12));
    t[i] = random(50,150);
    uno[i] = color(random(255),random(255),random(255));
    dos[i] = color(random(255),random(255),random(255));
  }
}

void draw(){
  background(255);
  for(int i = 0; i<100; i++){
    x[i]+=dx[i];
    circulosCon(x[i],y[i],n[i],t[i],uno[i],dos[i]);
  }
}

void circulosCon(float x_, float y_, int n_, float t_, color uno_, color dos_){
  noStroke();
  for(int i =n_ ;i>0; i--){
    fill(uno_);
    if(i%2==0){
      fill(dos_);
    }
    circle(x_, y_, i*t_/n_);
  }
}
