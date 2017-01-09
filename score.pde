class Score {
  int score;

  Score() {
    score = 0;
  }

  void increase() {
    score++;
  }

  void show() {
    fill(255);
    textAlign(RIGHT);
    textSize(10);
    text("Score: " + String.valueOf(score), width-5, 15);
  }
}
