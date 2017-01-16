function Score() {
  this.score = 0

  this.increase = function() {
    this.score++;
  }

  this.show = function() {
    fill(255);
    textAlign(RIGHT);
    textSize(10);
    text("Score: " + this.score, width-5, 15);
  }
}

