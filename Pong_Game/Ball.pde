class Ball {

  float xpos;
  float ypos = -35*4;
  float size;
  float yspeed;
  color c = color(184, 225, 255);

  Ball(float tmpX, float tmpSize){
    this.xpos = tmpX;
    this.size = tmpSize;
  }
  
  void display() {
    fill(c);
    ellipse(xpos, ypos, size, size);
  }


  void move(float tempYspeed) {
    yspeed = tempYspeed;
    ypos = ypos + yspeed;
  }
  

  boolean reachedBottom(){
    if(ypos > height+size){
      return true;
    }
    return false;
  }
    }
  
