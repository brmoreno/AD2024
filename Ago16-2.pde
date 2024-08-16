float f;
float amp;
float d;

void setup() {
  size(500, 500);
  background(255);
  f = 0.1;
  amp = 300;
  d = 0;
}

void draw() {
  d+=0.1;
  background(255);
  stroke(0);
  fill(255);
  rectMode(CENTER);
  for (int i = 0; i < 50; i++) {
    fill(i*5, 0, 250-i*2);
    float t = sin(d+i*f)*amp ;
    rect(width/2, i*10, t, 10);
  }
  
  if(keyPressed){
    switch(key){
      case 'a':
        f+= 0.01;
      break;
      case 's':
        f-= 0.01;
      break;
      case 'z':
        amp+= 5;
      break;
      case 'x':
        amp-= 5;
      break;
    }
  }
}
