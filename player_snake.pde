class PlayerSnake {
  float rectSize, genSpeed, xSpeed, ySpeed, x, y;
  ArrayList<PVector> tail = new ArrayList<PVector>();

  PlayerSnake(int rectSize) {
    this.rectSize = rectSize;

    genSpeed = rectSize;
    xSpeed = genSpeed;
    ySpeed = 0;

    x = rectSize*2;
    y = rectSize*2;

  }

  void growTail() {
    tail.add(new PVector(x, y));
  }

  void updateDirection() {

    // Read in movement keys
    if (key == 'w' || key == UP) {
      if (tail.size() == 0) {
        direction(0, -genSpeed);
      }
      else if (xSpeed != 0 || ySpeed != genSpeed) {
        direction(0, -genSpeed);
      }
    }

    if (key == 'a' || key == LEFT) {
      if (tail.size() == 0) {
        direction(-genSpeed, 0);
      }
      else if (xSpeed != genSpeed || ySpeed != 0) {
        direction(-genSpeed, 0);
      }
    }

    if (key == 's' || key == DOWN) {
      if (tail.size() == 0) {
        direction(0, genSpeed);
      }
      else if (xSpeed != 0 || ySpeed != -genSpeed) {
        direction(0, genSpeed);
      }
    }

    if (key == 'd' || key == RIGHT) {
      if (tail.size() == 0) {
        direction(genSpeed, 0);
      }
      else if (xSpeed != -genSpeed || ySpeed != 0) {
        direction(genSpeed, 0);
      }
    }

  }

  void updatePosition() {

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
      return true;
    }
    else {
      return false;
    }
  }

  boolean death() {
    boolean hitTail = false;
    boolean hitTop = snake.y < 0;
    boolean hitBottom = snake.x > height - snake.rectSize;
    boolean hitLeft = snake.y > width - snake.rectSize;
    boolean hitRight = snake.x < 0;

    for (PVector t : tail) {
      if ((x > t.x - rectSize && x < t.x + rectSize) &&
          (y > t.y - rectSize && y < t.y + rectSize)) {
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
