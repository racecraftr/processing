float t;
void setup() {
  size(600, 600);
  background(20);
  strokeWeight(4);
  pixelDensity(2);
  t = 0;
  frameRate(200);
}
float x(float t) {
  return cos(t/20)* (t/20);
}
float y(float t) {
  return sin(t/20) * (t/20);
}
void draw() {
  //background(20);
  stroke(y(t), x(t), 255);
  strokeWeight(100);
  pushMatrix();
  translate(width/2, height/2);
  rotate(t);
  line (x(t), y(t),x(t+1),y(t+1));
  stroke(x(t), y(t), 255);
  line(x(-t), y(-t), x(-t+ -1), y(-t+ -1));
  popMatrix();
  t++;
}