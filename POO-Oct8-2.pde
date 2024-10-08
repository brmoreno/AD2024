class Palabra{
  PVector p;
  String s;
  PVector v;
  float r;
  float dr;
  color c;
  float t;
  int cFuente;
  
  Palabra (String s_,float x_, float y_, float t_){
    s = s_;
    p = new PVector(x_,y_);
    v = PVector.random2D();
    r = 0;
    c = color(0);
    t = t_;
    dr = random(-0.05,0.05);
    cFuente = floor(random(10));
  }
  
  void display(){
    pushMatrix();
    translate(p.x,p.y);
    rotate(r);
    fill(c);
    textFont(fuentes.get(cFuente));
    textSize(t);
    textAlign(CENTER);
    text(s,0,0);
    popMatrix();
  }
  
  void mover(){
    p.add(v);
    r+=dr;
  }
}

Palabra una;
ArrayList <PFont> fuentes;
ArrayList <Palabra> laspalabras;
int t;
String [] palabras;
void setup(){
  size(600,600);
  una = new Palabra("foo",300,300,30);
  fuentes = new ArrayList <PFont> ();
  String fuentesCompu[] = PFont.list();
  for(int i = 0; i<10; i++){
    fuentes.add(createFont(fuentesCompu[floor(random(fuentesCompu.length))],20));
  }
  
  String [] poema = loadStrings("poema.txt");
  palabras = split(poema[0],' ');
  printArray(palabras);
  laspalabras = new ArrayList <Palabra> ();
}

void draw(){
  background(255);
  una.display();
  una.mover();
  for(Palabra p:laspalabras){
    p.display();
    p.mover();
  }
  if(mousePressed){
    Palabra esta = new Palabra(palabras[t],mouseX,mouseY,random(20,40));
    laspalabras.add(esta);
    t++;
  }
}

