int min = 30;
float rotation = 0;
boolean leftPressed = false;
boolean rightPressed = false;
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
  //beginCamera();
  //camera(width/2, height/2, -600, (float)(Math.cos(rotation)*100), height/2, (float)(Math.sin(rotation)*100), 0, 1, 0);
  //rotateY(rotation);
  //translate(0, 0, 600);
  //endCamera();
  rotation += Math.PI / 36;
  
  if (leftPressed && min > 10) min -= 5;
  else if (rightPressed && min < 500) min += 5;
}

void keyPressed() {
   if (keyCode == LEFT) {
     leftPressed = true;
   }
   else if (keyCode == RIGHT) {
     rightPressed = true;
   }
}

void keyReleased() {
   if (keyCode == LEFT) {
     leftPressed = false;
   }
   else if (keyCode == RIGHT) {
     rightPressed = false;
   }
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
    rotate(0, rotation, 0);
    box(len*1.3);
    
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
