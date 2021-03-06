float fx = 0;
float fy = 0;

//count keeps track of how many iterations a number goes through in the sequence
int count = 0;

//resolution is the maximum size of count. A higher resolution will render the fractal
//with more detail. Try a resolution of 2,3, and then 18 to see how this works
int resolution = 74;

//These variables keep track of the width and height of the virtual windows
float minwindowx = -2;
float maxwindowx = 2;
float minwindowy = -2;
float maxwindowy = 2;

float centerx = 0;
float centery = 0;

//Change this variable to change the type of mandelbrot fractal. Try 2 to calculuate
//z(n+1)=z(n)^2+c. Try 3 to calculate z(n+1)=z(n)^3+c. Try a decimal number :-).
float power = 2;
 
void setup() 
{ 
  colorMode(HSB, 100);
  background(0,100,0);
  size(700, 700);
  drawfractal();
}

void drawfractal()
{
  loadPixels();
  color c;
  float windowwidth = maxwindowx - minwindowx;
  float windowheight = maxwindowy - minwindowy;
  for (int i = 0; i < pixels.length; i++)
  {
    //this code maps the one dimensional pixel array to a cx and cy in the complex plane
    float startcx = windowwidth * (float(i % width) / width) - (windowwidth/2) + centerx; 
    float startcy = windowheight * (float(floor(float(i)/width))/height) - (windowheight/2) + centery;

    //the mandelvalue is either greater than 2 and then the count matters to find out
    //how far the complex number went before it got out of the range
    //if the mandelvalue is < 2, then the pixel is black
    float mandelvalue = mandel(startcx,startcy);
    if  (mandelvalue < 2)
    {
        c = color(0,100,0);
    }
    else
    {
        //the color of the pixel depends on how far the iteration got before it was out of bounds
        float ratio = 1.0*count/resolution;
        c = color(10+1.0*ratio*140,100,1.0*ratio*200);
        //old color scheme
        //c = color(10+2*count,100,count*8);
    }    
    
    pixels[i] = c;
  }
  updatePixels();
}
 
void draw() 
{
}

void mouseClicked()
{
  float windowwidth = maxwindowx - minwindowx;
  float windowheight = abs(maxwindowy - minwindowy);
  
  centerx = float(mouseX)/width * windowwidth - windowwidth/2 + centerx; 
  centery = float(height-mouseY)/height * windowheight - windowheight/2 + centery;
  
  //zoom in
  if (mouseButton == LEFT)
  {
    windowwidth = windowwidth * 0.7;
    windowheight = windowheight * 0.7;  
  }
  //zoom out
  else
  {
    windowwidth = windowwidth * 1.42;
    windowheight = windowheight * 1.42;
  }
  
  minwindowx = centerx - windowwidth/2;
  maxwindowx = centerx + windowwidth/2;
  minwindowy = centery + windowheight/2;
  maxwindowy = centery - windowheight/2;

  //adjust resolution
  //This natural log regression provides higher and higher resolutions as it zooms in    
  //if power is 2 or 3, we have a shortcut so can render at a higher resolution;
  if ((power>1.99 && power<2.01) || (power>2.99 && power<3.01))
  {
    if (resolution < int(154.71-0.156*log(windowwidth)))
    {
      resolution = int(154.71-0.156*log(windowwidth));
    }
  }
  else
  {
    //This means that we're using demoivres to calculate, its a bit slower.
    if (resolution < int(154.71-0.156*log(windowwidth)))
    {
      resolution = int(154.71-0.156*log(windowwidth));
    }  
  }
  drawfractal();
}

void keyPressed()
{
  if (key == '2')
  {
    power = 2;
  }
  else if (key == '3')
  {
    power = 3;
  }
  else if (key == '4')
  {
    power = 4;
  }
  else if (key == '5')
  {
    power = 5;
  }
  else if (key == '6')
  {
    power = 6;
  }
  else if (key == '7')
  {
    power = 7;
  }
  else if (key == '8')
  {
    power = 8;
  }
  else if (key == '9')
  {
    power = 9;
  }
  else if (key == '0')
  {
    power = 10;
  }
  else if (key == 'q')
  {
    power += .05;
    println(power);
  }
  else if (key == 'a')
  {
    power -= 0.05;
    println(power);
  }
  else if (key == 'w')
  {
    resolution += 1;
    println("resolution is ",resolution);
  }
  else if (key == 's')
  {
    resolution -= 1;
    
  }
  else if (key == 't')
  {
    //this code will render the fractal at a large size and resolution and save the image.
    int res = resolution;
    size(4000, 4000);
    if (resolution < 100)
    {
      resolution = 100;
    }
    drawfractal();
    save("savedPicture.png");
    size(700, 700);
    resolution = res;
  }
  else if (key == 'y')
  {
    //this code will bump up the resolution by a factor of 2
    resolution *= 2;
  }
  drawfractal();
}
 
float mandel(float startcx, float startcy)
{
  float xm = 0;
  float ym = 0;
  count = 0;
  fx = 0;
  fy = 0;
  while ( (count < resolution) && (fx*fx+fy*fy < 4))
  {
      func(xm,ym,startcx,startcy);
      xm = fx;
      ym = fy;
      count++;
  }
  return sqrt(fx*fx + fy*fy);
}

//this function is for x_n+1 = x_n^2 + c, where x_n and c are complex numbers
//exercise left to the reader to see why (a+bi)^2 = (a^2-b^2)+(2ab)i
void func(float x, float y, float startcx, float startcy)
{
  //These are the special cases (just (a+bi)^2 and (a+bi)^3
  if (power < 2.01 && power > 1.99)
  {
    fx = x*x - y*y + startcx;
    fy = 2*x*y + startcy;
  }
  else if (power < 3.01 && power > 2.99)
  {
    fx = x*x*x-3*x*y*y + startcx;
    fy = 3*x*x*y-y*y*y + startcy;
  }
  else 
  {
    //Polar raising to a power using DeMoivre's Theorem.
    //Polar is slower (but cleaner and more general code).

    float r = sqrt(x*x + y*y);
    float theta = 0;
    r = pow(r,power);
    if (x > 0)
    {
      theta = atan(y/x);
    }
    else if (x<0)
    {
      theta = atan(y/x);
      theta = theta + PI;
    }
    else
    {
      theta = 0;
    }
    
    theta = power * theta;
    fx = r*cos(theta) + startcx;
    fy = r*sin(theta) + startcy;
    
  }
}