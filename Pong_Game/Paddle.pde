class Paddle {
  float x;
  float xpos;
  float ypos;
  float moveSpeed;
  color c;
  

  Paddle(float tempXpos, float tempYpos, float tempXsize, float tempSpeed) {
    xpos = tempXpos;
    ypos = tempYpos;
    x = tempXsize;
    moveSpeed = tempSpeed;
  }

  void move() {
    moveSpeed = 10;
    if(xpos < 0){
      xpos = 0;
    }
    if(xpos + x > width){
      xpos = width-x;
    }
   
      if(keyCode == RIGHT){
        xpos = xpos + moveSpeed;
      }
      
      if(keyCode == LEFT){
        xpos = xpos - moveSpeed;
      }
    
    
  }
  
  void display() {

    c = color(112, 112, 112);
    fill(c);
    rect(xpos, ypos, x, 25);
  }
}
