class Caja{
  color c;
  float t;
  PVector p;
  float dr;
  float tam;
  float dt;
  float ddt;
  
  Caja(){
    c = color(random(255),random(255),random(255));
    t = random(100,300);
    p = PVector.random3D();
    tam = 40;
    dr = random(-0.01,0.01);
    dt = random(TWO_PI);
    ddt = random(0.05);
  }
  
  void display(){
    pushMatrix();
    PVector pp = p.copy();
    pp.mult(t*sin(dt));
    translate(pp.x,pp.y,pp.z);
    rotateX(p.x);
    rotateY(p.y);
    rotateZ(p.z);
    noStroke();
    fill(c);
    box(tam);
    popMatrix();
    p.rotate(dr);
    dt+=ddt;
  }  
}


ArrayList <Caja> cajas;


void setup(){
  size(500,500,P3D);
  cajas = new ArrayList <Caja>();
  for(int i = 0; i<200; i++){
    cajas.add(new Caja());
  }
}

void draw(){
  lights();
  background(255);
  pushMatrix();
  translate(width/2,height/2);
  rotateX(mouseX*0.01);
  rotateY(mouseY*0.01);
  for(Caja c:cajas){
    c.display();
  }
  popMatrix();
}
