Paddle gamePaddle;
//Lives lives;
Ball[] balls;

int totalBalls = 0;

void setup() {
  fullScreen();
  frameRate(120);
  gamePaddle = new Paddle(width/2, height-50, 200, 25);
  balls = new Ball[2];
/*  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball(random(0, width), 35);
  }*/
  
}
  
void draw(){
  background(0, 9, 69);
  gamePaddle.display();
  gamePaddle.move();
  
    if(totalBalls < balls.length){
  balls[totalBalls] = new Ball(random(0, width), 35);
  totalBalls++;

 
  }
 
  
    for (int i = 0; i < totalBalls; i++){
      balls[i].move(5);
      balls[i].display();
  }
}




      
    
