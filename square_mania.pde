class Point {
  float x, y;
  Point (float x, float y) {
    this.x = x;
    this.y = y;
  }
}
class Square {
  Point[] vertices = new Point[4];
  Square(Point p1, Point p2, Point p3, Point p4) {
    vertices[0] = p1;
    vertices[1] = p2;
    vertices[2] = p3;
    vertices[3] = p4;
  }
  void draw() {
    line(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y);
    line(vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y);
    line(vertices[2].x, vertices[2].y, vertices[3].x, vertices[3].y);
    line(vertices[3].x, vertices[3].y, vertices[0].x, vertices[0].y);
  }
}
Square s;
int count = 0;
void setup(){
  size(700, 700);
  t = new Square (new Point (50, 50), new Point (650,50), new Point (650, 650), new Point (50,650);
  noLoop();
}
void draw(){
  drawSquares(new Square[]{s});
}
void drawSquare(Square[] tris) {
  while (count < 10) {
    count++;
    Square[] csquares = new Square[0];
    for(Square squ : tris) {
      square.draw();
      Square[] cs = findChildren(squ);
      for (Square increase : cs) { 
        csqu = (square[])append(csqu, increase);
      }
    }
    drawSquares(csqu);
  }
}

Square[] findChildren(Square s){
  Square[] c = {};
  float x1 = s.vertices[0].x;
  float y1 = s.vertices[0].y; 
  float x2 = s.vertices[1].x; 
  float y2 = s.vertices[1].y;  
  float x3 = s.vertices[2].x;  
  float y3 = s.vertices[2].y; 
  float x4 = s.vertices[3].x;
  float y4 = s.vertices[3].y;
  float xc1 = (x1 + x2) / 2.0; 
  float yc1 = (y1 + y2) /2.0;
  float xc2 = (x2 + x3) /2.0;
  float yc2 = (y2 + y3) /2.0;
  float xc3 = (x3 + x4)/2.0;
  float yc3 = (y3 + y4)/2.0;
  float xc4 = (x4 + x1)/2.0;
  float yc4 = (y4 + y1)/2.0;
  c = (Square[])append(c,new Square(new Point (x1, y1), new Point (xc1, yc1), new Point(xc1, yc2), new Point(xc2, yc2)));
  c = (Square[])append(c,new Triangle(new Point (xc1, yc1), new Point (xc1, yc2), new Point(xc3, yc3), new Point (x2, y2)));
  c = (Square[])append(c,new Triangle(new Point (xc3, yc3), new Point (xc4, yc3), new Point(xc4, yc4), new Point(x3, y3)));
  c = (Square[])append(c,new Triangle(new Point (xc4, yc4), new Point (xc4, yc2), new Point(xc2, yc2), new Point(x4, y4)));
  return c;
}