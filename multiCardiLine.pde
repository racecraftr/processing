//initialize the variables
float r, b;// r is the radius, b defines the number of lobes it has
float theta;// theta is the angle

// set up the screen
void setup() {
  size(600, 600);// *
  r = height * .25;// doesn't matter later
  b = 2;// the number of lobes = (b-1) *
  theta = 0;//*
  background(0);//*
  frameRate(1000);//*
  pixelDensity(2);// make it 1 if using linux computer
}

// drawing time!
void draw() {
  stroke(random(255), random(255), 255);//*
  strokeWeight(1);// keep it this way for best results *
  pushMatrix();
  translate(width/2, height/2);// makes(0,0) at the center of the screen
  
  // first set of xy coordinates
  float x = r*sin(theta/1);
  float y = r*cos(theta/1);
  
  // second set of xy coordinates
  float x2 = r*sin(b*theta);
  float y2 = r*cos(b*theta);
  
  // now we make a line between the two
  line(x, y, x2, y2);
  
  // increase theta and set r to a certain variable
  theta+=1;//*
  r = 180;//*
  
  // bottom lines of code state that the screen will clear again 
  // when theta = 720
  if (theta == 720 ){//*
    background(0);//*
    theta = 0;//*
  }
  popMatrix();
}
//* -> play around with the numerical variables 
