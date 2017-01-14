class GameOverSplash {
  int rectSize;
  PVector[] fallingRects;
  int hasFallen;
  int speed;
  boolean animationOver;

  GameOverSplash(int rectSize) {
    this.rectSize = rectSize;
    int numRects = width / rectSize;
    fallingRects = new PVector[numRects];

    hasFallen = 0;
    animationOver = false;
    speed = 8;

    for (int i=0; i < numRects; i++) {
      int rectX = i * rectSize;
      int rectY = (int) random(-rectSize * 8, -rectSize);

      fallingRects[i] = new PVector(rectX, rectY);

    }
  }

  void animate(int score) {
    // Create the falling rect animation. Uses a bit field to keep track of
    // when the rects reach the bottom of the screen.
    for (int i=0; i<fallingRects.length; i++) {
      if (fallingRects[i].y <= height - rectSize && hasFallen < ((1<<fallingRects.length)-1)) {
        // Erase the previous screen
        fill(51);
        rect(fallingRects[i].x, fallingRects[i].y, rectSize, rectSize);

        fill(255);
        fallingRects[i].y += speed;
        if (fallingRects[i].y >= height - rectSize) {
          rect(fallingRects[i].x, height - rectSize, rectSize, rectSize);

          // Fallen bit field
          int mask = 1<<i;
          hasFallen = hasFallen | mask;
        }
        else {
          rect(fallingRects[i].x, fallingRects[i].y, rectSize, rectSize);
        }
      }
    }

    // Check if all falling rects have reached the bottom of the screen
    if (hasFallen == ((1<<fallingRects.length)-1)) {
      animationOver = true;

      fill(255);
      textAlign(CENTER);
      textSize(32);
      text("Game Over", width/2, height/3);
      textSize(18);
      text("Final score: " + String.valueOf(score) + "\nPress any key to restart",
           width/2, height/3 + 40);
    }
  }
}
