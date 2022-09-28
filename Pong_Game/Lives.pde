
class Lives {

  int livesRemaining = 0;


  //Constructing the lives.
  Lives(int livesRemaining) {
    this.livesRemaining = livesRemaining+1;
  }
  //Display lives as a text.
  void display() {
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Lives: "+livesRemaining, width-100, 40);
  }

  //Subtracts a life everytime the ball reaches the bottom.
  void update() {
    if (!ball1.isDone) {
      livesRemaining--;
      ball1.isDone = true;
    }
  }
}
