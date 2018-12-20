

class Star {
  int index;
  float x, y, z, zChange;
  Star(int index, float x, float y, float z) {
    this.index = index;
    this.x = x;
    this.y = y;
    this.z = z;
    this.zChange = calcZChange();
  }
  float calcZChange(){
    return  10*(1.5- (pow(pow(300-x,2)+pow(300-y,2), .5)/ (pow(pow(350,2) + pow(300,2), .5))));
  }

 void drawStar() {
    noStroke();
    fill(random(0,360), 100, 100);
    pushMatrix();
    translate(x, y, z);
    rotateX(random(0, 180));
    rotateY(random(0, 180));
    rotateZ(random(0,180));
    sphereDetail(floor(random(3)));
    sphere(5);
    popMatrix();
  
    z += zChange * tan(1000);
    
  }
}

Star[] stars = new Star[1050];


void setup() {
  colorMode(HSB, 360, 100, 100);
  lights();
  for(int i = 0; i< stars.length; i++){
    stars[i] = newStar(i);
  }
  background(25,10, 0);
  size(700, 700, P3D);
  frameRate(300);
}

Star newStar(int i) {
  return new Star(i, random(0, width), random(0, height), random(-1000, 100));
}

void draw() { 

  background(25, 10, 0);
  for(int i = 0; i < stars.length; i++){
    if(stars[i].z > 500) {
      stars[i] = newStar(i);
    } else {
      stars[i].drawStar();
    }
  }
  
  delay(0);
}