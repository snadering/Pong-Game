class Ball {

  float xpos;
  float ypos = -35*4;
  float size;
  float yspeed;
  color c = color(184, 225, 255);
  boolean isDone;
  boolean collision;

  //Ball constructor
  Ball(float tmpX, float tmpSize) {
    this.xpos = tmpX;
    this.size = tmpSize;
  }
  //Display ball.
  void display() {
    fill(c);
    ellipse(xpos, ypos, size, size);
  }

  //Function that makes the ball move.
  void move(float yspeed) {
    this.yspeed = yspeed;
    this.ypos = ypos + this.yspeed;
  }

  //Checks if ball reaches bottom of the screen.
  void reachedBottom() {
    if (ypos > height+size) {
      lifeLost.play();
      xpos = random(0, width);
      ypos = 10;
      isDone = false;
      message.timeCounterNeg = 0;
    }
  }

  void paddleCollide() {
    //Checks if the ball collide with the paddle's current position.
    if (xpos+size >= gamePaddle.xpos && xpos+size <= gamePaddle.xpos + gamePaddle.x && this.ypos > gamePaddle.ypos) {
      soundEffect.play();
      xpos = random(0, width);
      ypos = 10;
      collision = true;
      message.timeCounterPos = 0;
    }
  }
}
