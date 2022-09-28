class Paddle {
  float x;
  float xpos;
  float ypos;
  float moveSpeed;
  color c;

//Paddle constructor
  Paddle(float xpos, float ypos, float x, float moveSpeed) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.x = x;
    this.moveSpeed = moveSpeed;
  }

  void move() {    
//Prevents the paddle from leaving the screen.   
    if (xpos < 0) {
      xpos = 0;
    }
    if (xpos + x > width) {
      xpos = width-x;
    }
    
//Paddle movement.
    if (keyCode == RIGHT) {
      xpos = xpos + moveSpeed;
    }

    if (keyCode == LEFT) {
      xpos = xpos - moveSpeed;
    }
  }

//Displays the paddle.
  void display() {
    c = color(255, 179, 0);
    fill(c);
    rect(xpos, ypos, x, 25);
  }
}
