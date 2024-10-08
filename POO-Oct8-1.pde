PFont fuente;
PFont fuente2;
float x;
String s;
void setup(){
  size(500,500);
  background(255);
  String fuentes [] = PFont.list();
  for(int i = 0; i<fuentes.length;i++){
    println(i + " " +fuentes[i] );
  }
  fuente = createFont(fuentes[186],40);
  fuente2 = loadFont("HiraMinProN-W6-48.vlw");
  s = "foo";
}


void draw(){
  background(255);
  fill(255,0,0);
  textFont(fuente);
  textSize(10+ mouseX);
  textAlign(CENTER,TOP);
  text("foo bar baz qux",100,100);
  fill(0);
  //textSize(48);
  textAlign(LEFT,BASELINE);
  textFont(fuente2);
  textSize(200);
  text(s,x,250);
  x++;
}

void keyPressed(){
  if(key == 'a'){
    s = "bar";
  }
  if(key == 'b'){
    s = "baz";
  }
   if(key == 'c'){
    s = "qux";
  }
}
