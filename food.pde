// Todo: make it so the food doesn't appear on the snake's tail
class Food {
  float rectSize, x, y;

  Food(int rectSize) {
    this.rectSize = rectSize;
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
