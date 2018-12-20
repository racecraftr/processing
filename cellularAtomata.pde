float x = 300;
float y = 300;
void setup() {
  size(1000, 800);
  background(0);
  noStroke();
  fill(255);
  frameRate(500);
}

void draw() {
  //background(0);
  for (float i = 0; i < 1000; i+=.1) {
    int d = int(random(9));
    float sx = 2;
    float sy = 2;
    fill(0, 255, 0);
    if(d % 2 == 0){
      fill(0, 0, 255);
    }
    if(d % 3 == 0){
      fill(255, 0, 0);
    }
    rect (x, y, sx, sy);

    if (d == 1 || d== 5 || d== 8) {
      x+=sx;

    }
    if (d == 2 || d ==6 || d == 7) {
      x-=sx;

    }
    if (d == 3 || d==7 || d ==8) {
      y+=sy;
    }
    if (d== 4 || d == 6 || d == 5) {
      y-=sy;

      if (x>width) {
        x = 0;
      }
      if (x<0) {
        x = width;
      }
      if (y>height) {
        y = 0;
      }
      if (y<0) {
        y = height;
      }
    }
  }
}
