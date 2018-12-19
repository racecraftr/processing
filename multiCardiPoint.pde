float r, b;
float theta;
void setup() {
  size(600, 600);
  r = height * .25;
  b = 3;
  theta = 0;
  background(0);
  frameRate(60);
  pixelDensity(2);
}
void draw() {
  stroke(random(255), random(255), 255);
  strokeWeight(random(5));
  pushMatrix();
  translate(width/2, height/2);
  float x = r*sin(theta/1);
  float y = r*cos(theta/1);
  float x2 = r*sin(b*theta);
  float y2 = r*cos(b*theta);
  point((x2-x)/1, (y2-y)/1);
  point(x, y);
  theta+=0.1;
  r = 90;
  popMatrix();
  if (theta == 360){
    theta = 0;
    background(0);
  }
}
