//Variable Globales
float x [] = new float [200];
float y [] = new float [200];
int t [] = new int [200];
color fondo;
color c [] = new color [200];
float dx [] = new float [200];
float dy [] = new float [200];



void setup() {
  size(500, 500);

  for (int i = 0; i<200; i++) {
    x[i] = random(width);
    y[i] = random(height);
    t[i] = round(random(50, 100));
    c[i] = color(random(255), random(255), random(255));
    ;
    dx[i] = random(-2, 2);
    dy[i] = random(-2, 2);
  }
}
void draw() {
  background(255);
  noStroke();
  for (int i = 0; i<200; i++) {
    fill(c[i]);
    ellipse(x[i], y[i], t[i], t[i]);
    x[i]+=dx[i];
    y[i]+=dy[i];
    float radio = t[i]/2;
    if ( x[i] >= width - radio  ) {
      dx[i] *= -1 ;
    }
    if (x[i] <= radio) {
      dx[i] *= -1 ;
    }

    if (y[i] >= height - radio) {
      dy[i] *= -1;
    }

    if ( y[i]<= radio) {
      dy[i] *= -1;
    }
  }
}
