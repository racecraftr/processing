float t = 0, r;
Point[] cardioidArray = new Point[0];
Point prevCircle = null;

void setup() {
  size(600, 600);
  background(20);
  r = 50;
  pixelDensity(2);
  ellipseMode(CENTER);
  frameRate(60);
}

void draw(){
  float xc = r * 2;
  
  float r2 = xc + xc * sin(t);
  float x = r2 * sin(t) - r;
  float y = r2 * cos(t);
  strokeWeight(3);
  
  noFill();
  strokeWeight(1);
  if(prevCircle != null) {
    stroke(20,20,20);
    ellipse(prevCircle.x, prevCircle.y, r*2, r*2);
  }
  stroke(0, 255, 0);
  prevCircle = new Point(width/2 + r*2*sin(t), height/2 + r*2*cos(t));
  ellipse(prevCircle.x, prevCircle.y, r*2, r*2);
  
  cardioidArray = (Point[]) append(cardioidArray, new Point(width/2 + x, height/2 + y));
  
  for(int i=0; i< cardioidArray.length; i++){
    cardioidArray[i].render();
  }
  t+= 1;
  if (t > 360){
    background(20);
    t = 0;
  }
}

class Point {
  final float x,y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  void render() {
    strokeWeight(5);
    stroke(0, 0, 255);
    point(x,y);
  }
}