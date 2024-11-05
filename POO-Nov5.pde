import processing.sound.*;

SoundFile musica;
SoundFile pop;
Amplitude amps;
AudioIn in;
PitchDetector pd;

float duracion;
float x;
float y;
float r;
boolean suena = true;


void setup(){
  size(400,400);
  musica = new SoundFile(this, "bit.mp3");
  background(0);
  //musica.play();
  duracion = musica.duration();
  //musica.amp(1);
  in = new AudioIn(this,0);
  amps = new Amplitude(this);
  amps.input(in);
  pd = new PitchDetector(this);
  pd.input(in);
  pop = new SoundFile(this,"1.mp3");
  x= width/2;
  y = height/2;
  r = 100;
}

void draw(){
  //float amp = map(mouseY,0,height,0,1);
  //musica.amp(amp);
  //float vel = map(mouseX,0,width,0,2 );
  //musica.rate(vel);
  background(255);
  fill(255,0,0);
  circle(x,y,r*2*amps.analyze());
  float dist = dist(x,y,mouseX,mouseY);
  if(dist<r && suena){
    pop.play();
    suena = false;
  }
  if(dist>r){
    suena = true;
  }
  println(pd.analyze());
}

void keyPressed(){
  if(key == 'a'){
    musica.pause();
  }
  
  if(key == 's'){
    if(!musica.isPlaying()){
       musica.play();
    }
  }
  
  if(key == 'd'){
    musica.jump(0);
  }
  
  if(key =='f'){
    musica.jump(random(duracion));
  }
}
