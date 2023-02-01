int min = 30;
float rotation = 0;
public void setup()
{
  background(0);
  noStroke();
  size(500, 500, P3D);
}
public void draw()
{
  background(0);
  //sierpinski(0, 500, 500);
  //min = mouseX;
  
  menger(width/2, height/2, -600, 250);
  beginCamera();
  camera();
  rotateY(rotation);
  translate(0, 0, 800);
  if (keyPressed) {
    if (key == 'a') {
      rotation -= Math.PI / 100;
    } else if (key == 'd') {
      rotation += Math.PI / 100;
    }
    if (key == 'w' && min - 5 > 10) {
      min -= 5;
    }
    if (key == 's' && min + 5 < 500) {
      min += 5;
    }
  }
  endCamera();
}

public void sierpinski(int x, int y, int len) 
{
  if (len <= min) {
    triangle(x, y, x+len/2, y-len, x+len, y);
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x+len/2, y, len/2);
    sierpinski(x+len/4, y-len/2, len/2);
  }
}

public void menger(int x, int y, int z, int len) {
  if (len <= min) {
    pushMatrix();
    translate(x, y, z);
    box(min/2);
    popMatrix();
  } else {
    // center row
    menger(x-len/2, y-len/2, z, len/3);
    menger(x+len/2, y-len/2, z, len/3); 
    menger(x-len/2, y+len/2, z, len/3);
    menger(x+len/2, y+len/2, z, len/3);
    
    // outward row
    menger(x-len/2, y-len/2, z+len/2, len/3);
    menger(x+len/2, y-len/2, z+len/2, len/3);
    menger(x-len/2, y+len/2, z+len/2, len/3);
    menger(x+len/2, y+len/2, z+len/2, len/3);
    
    menger(x-len/2, y, z+len/2, len/3);
    menger(x+len/2, y, z+len/2, len/3); 
    menger(x, y-len/2, z+len/2, len/3);
    menger(x, y+len/2, z+len/2, len/3);
    
    
    //inward row
    menger(x-len/2, y-len/2, z-len/2, len/3);
    menger(x+len/2, y-len/2, z-len/2, len/3);
    menger(x-len/2, y+len/2, z-len/2, len/3);
    menger(x+len/2, y+len/2, z-len/2, len/3);
    
    menger(x-len/2, y, z-len/2, len/3);
    menger(x+len/2, y, z-len/2, len/3); 
    menger(x, y-len/2, z-len/2, len/3);
    menger(x, y+len/2, z-len/2, len/3);
  }
}
