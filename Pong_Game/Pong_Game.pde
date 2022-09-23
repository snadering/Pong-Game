//importing Processing's sound library. '*' means all of it.
import processing.sound.*;

//Initializing sound files.
SoundFile soundEffect;
SoundFile gameOverSound;
SoundFile lifeLost;

//Initializing objects.
Paddle gamePaddle;
Ball ball1;
Lives lives;

int score = 0;
boolean gameOver = false;

void setup() {
  fullScreen();
  frameRate(120);
  //Creating sound instances for every sound file.
  soundEffect = new SoundFile(this, "assets/collect.mp3");
  gameOverSound = new SoundFile(this, "assets/GameOverSound.mp3");
  lifeLost = new SoundFile(this, "assets/LostLifeEffect.mp3");
  //Creating a new object for every Class.
  gamePaddle = new Paddle(width/2, height-50, 200, 120);
  ball1 = new Ball(random(0, width), -20);
  lives = new Lives(3);
  
}

void draw() {
 if(!gameOver){
  background(0, 9, 69);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(40);
  text("Score: "+score, 100, 40);
  
  //Calling all of my functions from the different Classes.
  lives.display();
  lives.update();
  gamePaddle.display();
  ball1.display();
  ball1.move(4);
  ball1.reachedBottom();
  ball1.paddleCollide();
  
  if(ball1.collision){
    score++;
    ball1.collision = false;
  }
  
//Proceeds to GameOver-screen if all lives are lost.
  if(lives.livesRemaining < 1){
    gameOverSound.play();
    gameOver = true; 
  }
  }
 //Displaying the Game Over screen.
  if(gameOver){
  background(0, 9, 69);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(100);
  text("Game Over!", width/2, height/2);
  textSize(24);
  text("Press 'SPACE' to play again!", width/2, height/2+100);
  
  if(score == 1){
  textSize(24);
  text("You got: "+ score + " point!", width/2, height/2-100);
    } else{
       textSize(24);
       text("You got: "+ score + " points!", width/2, height/2-100);
    }
  }
}



void keyPressed(){
  //Making sure the paddle only moves once, when a key is pressed.
 gamePaddle.move();
 if(keyCode == 32 && gameOver){
   reset();
 }
 }
 //Resets all the neccessary variables to to restart the game.
 void reset(){
 gameOver = false;
 score = 0;
 lives.livesRemaining = 3;
 }
