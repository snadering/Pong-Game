class Message {

  String[] messages = {"Good job!", "Well done!", "Nice try!", "Are you even trying?"};
  
  //Initializing my two counters above the proximity for my displaying function.
  float timeCounterPos = 120;
  float timeCounterNeg = 120;
 
  //Empty constructor
  Message() {
  }

  void displayPositive(int num) {
    //-Info: If the ball hits the paddle, the timer is set to 0, and will count up in draw.
    if(timeCounterPos < 120){
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(messages[num], width/2, 50);
      }
    }
  void displayNegative(int num){
    // -info: If the ball reaches the bottom, the timer is set to 0, and will count up in draw.
    if(timeCounterNeg < 120){
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(messages[num], width/2, 50);
  }
}
}
