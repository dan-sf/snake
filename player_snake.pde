// TODO tail death, death blink
class PlayerSnake {

  float rectSize = 20;
  float genSpeed = rectSize;
  float xSpeed = genSpeed;
  float ySpeed = 0;

  float x = rectSize*2;
  float y = rectSize*2;

  ArrayList<PVector> tail = new ArrayList<PVector>();

  int total = 0;

  void growTail() {
    tail.add(new PVector(x, y));
  }

  void update() {

    // Read in movement keys
    if (key == 'w' || key == 'k' || key == UP) {
      if (total == 0) {
        direction(0, -genSpeed);
      }
      else if (xSpeed != 0 || ySpeed != genSpeed) {
        direction(0, -genSpeed);
      }
    }

    if (key == 'a' || key == 'h' || key == LEFT) {
      if (total == 0) {
        direction(-genSpeed, 0);
      }
      else if (xSpeed != genSpeed || ySpeed != 0) {
        direction(-genSpeed, 0);
      }
    }

    if (key == 's' || key == 'j' || key == DOWN) {
      if (total == 0) {
        direction(0, genSpeed);
      }
      else if (xSpeed != 0 || ySpeed != -genSpeed) {
        direction(0, genSpeed);
      }
    }

    if (key == 'd' || key == 'l' || key == RIGHT) {
      if (total == 0) {
        direction(genSpeed, 0);
      }
      else if (xSpeed != -genSpeed || ySpeed != 0) {
        direction(genSpeed, 0);
      }
    }

    float prevTailX = x;
    float prevTailY = y;
    float tempTailX;
    float tempTailY;

    // Update each rect in the tail with the position of the rect infront of it
    for (PVector rectPoint : tail) {
      // Hold this rect's position
      tempTailX = rectPoint.x;
      tempTailY = rectPoint.y;

      // Update with new coordinates
      rectPoint.x = prevTailX;
      rectPoint.y = prevTailY;

      // Save previous coordinates
      prevTailX = tempTailX;
      prevTailY = tempTailY;
    }

    // Move the head
    x += xSpeed;
    y += ySpeed;
  }

  void direction(float x, float y) {
    xSpeed = x;
    ySpeed = y;
  }

  boolean eat(Food food) {
    if ((x > food.x - rectSize && x < food.x + food.rectSize) &&
        (y > food.y - rectSize && y < food.y +food.rectSize)) {
      total++;
      return true;
    }
    else {
      return false;
    }
  }

  boolean death() {
    boolean hitTail = false;
    boolean hitTop = snake.y < 0;
    boolean hitBottom = snake.x >= height - snake.rectSize;
    boolean hitLeft = snake.y >= width - snake.rectSize;
    boolean hitRight = snake.x < 0;

    for (PVector t : tail) {
      float d = dist(x, y, t.x, t.y);
      if (d < 1) {
        hitTail = true;
      }
    }

    if (hitTop || hitBottom || hitLeft || hitRight || hitTail) {
      return true;
    }
    else {
      return false;
    }
  }

  void show() {
    fill(255);
    stroke(51);

    for (PVector v : tail) {
      rect(v.x, v.y, rectSize, rectSize);
    }
    rect(x, y, rectSize, rectSize);
  }
}
