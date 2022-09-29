class GOBall{

  float goXpos = 0;
  float goYpos = 0;
  float goXspeed = 0;
  float goYspeed = 0;
  float goSize = 0;

//GOBall constructor
  GOBall(float xpos, float ypos, float size, float speed){
    
      this.goXpos = xpos;
      this.goYpos = ypos;
      this.goSize = size;
      this.goXspeed = speed;
      this.goYspeed = speed;
    
  }
  
  void display(){
    noStroke();
    fill(255, 179, 0);
    ellipse(goXpos, goYpos, goSize, goSize);
    
  }
  
  void move(){
    goXpos += goXspeed;
    goYpos += goYspeed;
    
    if(goYpos > height || goYpos < 0){
      goYspeed *= -1;
    }
    if(goXpos > width || goXpos < 0){
      goXspeed *= -1;
    }
    
  }
  

}
