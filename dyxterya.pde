float t, h;
void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 255);
  background(0, 0, 20);
  t = 0;
  h = 0;
  noFill();
  strokeWeight(10);
  frameRate(60);
}
void draw() {
  background(20);
  stroke(h, 100, 255);
  for (int i = 0; i < 11; i++) {
    for (int j = 0; j < 11; j++) {
      pushMatrix();
      translate(width/10 * (i), height/10 * (j));
      rotate((j+i)/1);
      point(x(t), y(t));
      popMatrix();
    }
  }
  t++;
  h++;
  if (h>360) {
    h-=360;
  }
}
float x(float t) {
  return cos(t/10) * 100;
}
float y(float t) {
  return sin(t/15) * 38;
}
