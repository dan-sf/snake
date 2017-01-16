function Food(rectSize) {
  this.x;
  this.y;
  this.rectSize = rectSize;

  this.isOnSnake = function(snakeX, snakeY, snakeTail) {
    // Check to see if the food was drawn on/under the snake
    if (this.x == snakeX && this.y == snakeY) {
      return true;
    }
    for (i=0; i<snakeTail.length; i++) {
      if (this.x == snakeTail[i].x && this.y == snakeTail[i].y) {
        return true;
      }
    }
    return false;
  }

  this.update = function() {
    this.x = Math.floor(random(width/this.rectSize)) * this.rectSize;
    this.y = Math.floor(random(height/this.rectSize)) * this.rectSize;
  }

  this.show = function() {
    noStroke();
    fill(255, 35, 79);
    rect(this.x, this.y, this.rectSize, this.rectSize);
  }
}
