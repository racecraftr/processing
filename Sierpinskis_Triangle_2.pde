class Point {
  float x, y;
  Point (float x, float y) {
    this.x = x;
    this.y = y;
  }
}
class Triangle {
  Point[] vertices = new Point[3];
  Triangle(Point p1, Point p2, Point p3) {
    vertices[0] = p1;
    vertices[1] = p2;
    vertices[2] = p3;
  }
  void draw() {
    line(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y);
    line(vertices[2].x, vertices[2].y, vertices[1].x, vertices[1].y);
    line(vertices[0].x, vertices[0].y, vertices[2].x, vertices[2].y);
  }
}
Triangle t;
int count = 0;
void setup(){
  size(700, 700);
  t = new Triangle (new Point (350, 50), new Point (50,650), new Point (650, 650));
  noLoop();
}
void draw(){
  drawTriangles(new Triangle[]{t});
}
void drawTriangles(Triangle[] tris) {
  while (count < 10) {
    count++;
    Triangle[] ctris = new Triangle[0]; //<>//
    for(Triangle tri : tris) {
      tri.draw();
      Triangle[] cs = findChildren(tri);
      for (Triangle increase : cs) { 
        ctris = (Triangle[])append(ctris, increase);
      }
    }
    drawTriangles(ctris);
  }
}

Triangle[] findChildren(Triangle s){
  Triangle[] c = {};
  float x1 = s.vertices[0].x;
  float y1 = s.vertices[0].y; 
  float x2 = s.vertices[1].x; 
  float y2 = s.vertices[1].y;  
  float x3 = s.vertices[2].x;  
  float y3 = s.vertices[2].y; 
  float xc1 = (x1 + x2) / 2.0; 
  float yc1 = (y1 + y2) /2.0;
  float xc2 = (x2 + x3) /2.0;
  float yc2 = (y2 + y3) /2.0;
  float xc3 = (x3 + x1)/2.0;
  float yc3 = (y3 + y1)/2.0;
  c = (Triangle[])append(c,new Triangle(new Point (x1, y1), new Point (xc1, yc1), new Point(xc3, yc3)));
  c = (Triangle[])append(c,new Triangle(new Point (xc1, yc1), new Point (x2, y2), new Point(xc2, yc2)));
  c = (Triangle[])append(c,new Triangle(new Point (xc3, yc3), new Point (xc2, yc2), new Point(x3, y3)));
  return c; //<>//
}