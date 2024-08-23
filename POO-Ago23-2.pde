float r;
void setup(){
  size(500,500);
}

void draw(){
  background(0,0,100);
  
  gato(mouseX,mouseY);
  fill(255);
  rect(width/2,height/2,100,100);
  if(keyPressed){
    if(key == 'a'){
      r-=0.1;
    }
    if(key == 'd'){
      r+=0.1;
    }
  }
}

void gato(int x_, int y_){
  pushMatrix();
  translate(x_,y_);
  rotate(r);
  scale(map(mouseY,0,height,0.1,2));
  translate(-60,-60);  
  noStroke();
  fill(255,250,0);
  rect(0,40,120,60);
  rect(30,100,60,10);
  rect(10,0,20,50);
  rect(20,20,20,50);
  rect(90,0,20,50);
  rect(80,20,20,50);
  fill(0);
  for(int i=30; i<100; i+=30){
    rect(i,60,10,10);
  }
  popMatrix();
}
