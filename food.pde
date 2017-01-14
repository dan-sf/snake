class Food {
  float rectSize, x, y;

  Food(int rectSize) {
    this.rectSize = rectSize;
  }

  boolean isOnSnake(float snakeX, float snakeY, ArrayList<PVector> snakeTail) {
    // Check to see if the food was drawn on/under the snake
    if (x == snakeX && y == snakeY) {
      return true;
    }
    for (PVector t : snakeTail) {
      if (x == t.x && y == t.y) {
        return true;
      }
    }
    return false;
  }

  void update() {
    x = (float) ( (int)random(width/rectSize) * (int)rectSize );
    y = (float)  ( (int)random(height/rectSize) * (int)rectSize );
  }

  void show() {
    noStroke();
    fill(255, 35, 79);
    rect(x, y, rectSize, rectSize);
  }

}
