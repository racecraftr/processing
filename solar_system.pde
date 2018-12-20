float yChange = .02;
float yMercury = 0;
float yVenus = 0;
float yEarth = 0;
float yMars = 0;
float yJupiter = 0;
float ySaturn = 0;
float yUranus = 0;
float yNeptune = 0;
float xCam;
void setup() {
  size(1450, 800, P3D);
  lights();
  background(0);
  frameRate(60);
  smooth();
  xCam = width/2;
}

void draw() {
  background(0);
  drawSun();
  //lights();
  drawMercury();
  drawVenus();
  drawEarth();
  drawMars();
  drawJupiter();
  drawSaturn();
  drawUranus();
  drawNeptune();
  camera(xCam, mouseY*1, height/2 /tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  if (keyPressed){
    if (key == CODED) {
      if (keyCode == LEFT){
        xCam -= 10;
      }
      if (keyCode == RIGHT){
        xCam += 10;
      }
    }
  }         
}


void drawSun() {
  pushMatrix();
  sphereDetail(100);
  translate(width/2, height/2, 0);
  noStroke();
  fill(255,150,0);
  sphere (200);
  popMatrix();
}

void drawMercury() {
  yMercury += yChange*47.87;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(yMercury);
  translate(0,0,220);
  noStroke();
  fill(150);
  sphere(4.75);
  popMatrix();

}

void drawVenus() {
  yVenus += yChange*35.02;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(yVenus);
  translate(0,0,260);
  noStroke();
  fill(255, 238, 178);
  sphere(10);
  popMatrix();

}

void drawEarth() {
  yEarth += yChange*29.78;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(yEarth);
  translate(0,0,300);
  noStroke();
  fill(0,200,255);
  sphere(10);
  popMatrix();

}

void drawMars() {
  yMars += yChange*24.077;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(yMars);
  translate(0,0,340);
  noStroke();
  fill(153, 63, 0);
  sphere(7);
  popMatrix();
}


void drawJupiter() {
  yJupiter += yChange*13.07;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(yJupiter);
  translate(0,0,380);
  noStroke();
  fill(255, 191, 102);
  sphere(15);
  popMatrix();
}

void drawSaturn() {
  ySaturn += yChange *9.69;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(ySaturn);
  translate(0,0,420);
  noStroke();
  fill(255,238,56);
  sphere(13);
  popMatrix();
}

void drawUranus() {
  yUranus += yChange * 6.81;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(yUranus);
  translate(0,0,460);
  noStroke();
  fill(56, 255, 182);
  sphere(8);
  popMatrix();
}

void drawNeptune() {
  yNeptune += yChange * 5.43;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(yNeptune);
  translate(0,0,480);
  noStroke();
  fill(0, 0, 0);
  sphere(7);
  popMatrix();
}
