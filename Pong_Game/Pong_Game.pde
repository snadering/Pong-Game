//importing Processing's sound library. '*' means all of it.
import processing.sound.*;

//Initializing sound files.
SoundFile soundEffect;
SoundFile gameOverSound;
SoundFile lifeLost;

//Initializing objects.
Paddle gamePaddle;
Ball ball1;
GOBall[] goBalls;
Lives lives;
Message message;

//Global variables
int score = 0;
boolean gameOver = false;
int time;
float ellipse1Y = 550;
float ellipse2Y = 600;
float ellipseSize = 10;
float yVel = 1;
float yVel2 = 1;
int messageNumPos;
int messageNumNeg;

void setup() {
  fullScreen();
  frameRate(120);
  time = millis();

  //Creating sound instances for every sound file.
  soundEffect = new SoundFile(this, "assets/collect.mp3");
  gameOverSound = new SoundFile(this, "assets/GameOverSound.mp3");
  lifeLost = new SoundFile(this, "assets/LostLifeEffect.mp3");
  //Creating a new object for every Class.
  gamePaddle = new Paddle(width/2, height-50, 200, 100);
  ball1 = new Ball(random(0, width), -20);
  lives = new Lives(3);
  message = new Message();
  goBalls = new GOBall[3];
  
  //Creating instances of the GameOverBall (GOBall) Array.
  for (int i = 0; i < goBalls.length; i++) {
      goBalls[i] = new GOBall(random(100, width-100), random(100, height-100), 30, 2+i);
    }
}

void draw() {
  
  if (!gameOver) {
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
    message.displayPositive(messageNumPos);
    message.displayNegative(messageNumNeg);
  
    //Continuously counting up
    message.timeCounterPos++;
    message.timeCounterNeg++;
  
    if (ball1.collision) {
      score++;
      ball1.collision = false;
    }

    //Proceeds to GameOver-screen if all lives are lost.
    if (lives.livesRemaining < 1) {
      gameOverSound.play();
      gameOver = true;
    }
  }
  //Displaying the Game Over screen.
  if (gameOver) {
    background(0, 9, 69);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(100);
    text("Game Over", width/2, height/2);
    stroke(255);
    strokeWeight(4);
    line(width/2-300, height/2+60, width/2+300, height/2+60);
    textSize(24);
    text("Press 'SPACE' to play again!", width/2, height/2+100);

    //Making sure it only says 'point' in plural when it's different to 1
    if (score == 1) {
      textSize(24);
      text("You got: "+ score + " point!", width/2, height/2-100);
    } else {
      textSize(24);
      text("You got: "+ score + " points!", width/2, height/2-100);
    }

    //Displaying the two balls jumping on Game Over screen.
    ellipse(width/2+280, ellipse2Y, 10, 10);
    ellipse(width/2-280, ellipse1Y, 10, 10);
    ellipse1Y = ellipse1Y + yVel;
    ellipse2Y = ellipse2Y +yVel2;
    //Making the two balls bounce upon hitting the line.
    if (ellipse1Y < height/2-30 || ellipse1Y > height/2+55) {
      yVel *= -1;
    }
    if (ellipse2Y < height/2-20 || ellipse2Y > height/2+55) {
      yVel2 *= -1;
    }

    
    
    //Displaying the objects in the GOBall array.
    for (int i = 0; i < goBalls.length; i++) {
      goBalls[i].display();
      goBalls[i].move();
    }
  }
}



void keyPressed() {
  //Making sure the paddle only moves once, when a key is pressed.
  gamePaddle.move();
  if (keyCode == 32 && gameOver) {
    reset();
  }
}


//Resets all the neccessary variables to to restart the game.
void reset() {
  gameOver = false;
  score = 0;
  lives.livesRemaining = 3;
  noStroke();
}
