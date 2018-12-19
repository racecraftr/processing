void setup() {
  size(700, 700);
  background(20);
  stroke(color(255, 100));
  smooth();
  fill(255);
  frameRate(1000);
  pixelDensity(2);
}

float Dx = width/2;
float Dy = height/2;
float n = 2;

void draw() 
{
  for (int i = 0; i < 1000; i++)
  {
    switch(int(random(8)))
    {
    case 0:
    Dx = (Dx + width/3)/n;
    Dy = (Dy + 0)/n;
    break;
    
    case 1:
    Dx = (Dx + 2*width/3)/n;
    Dy = (Dy + 0)/n;
    break;
    
    case 2:
    Dx = (Dx + 0)/n;
    Dy = (Dy + height/2)/n;
    break;
    
    case 3:
    Dx = (Dx + width)/n;
    Dy = (Dy + height/2)/n;
    
    case 4:
    Dx = (Dx + width/3)/n;
    Dy = (Dy + height)/n;
    
    case 5:
    Dx = (Dx + 2*width/3)/n;
    Dy = (Dy + height)/n;

    }
    point (Dx, Dy);
  }
}