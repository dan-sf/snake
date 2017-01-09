class GameOverSplash {
  int rectSize;
  int screenWidth;
  PVector[] fallingRects;
  int hasFallen;
  boolean animationOver;

  GameOverSplash(int screenWidth, int rectSize) {
    this.rectSize = rectSize;
    this.screenWidth = screenWidth;

    int numRects = screenWidth / rectSize;
    fallingRects = new PVector[numRects];
    hasFallen = 0;
    animationOver = false;

    for (int i=0; i < numRects; i++) {
      //Create random number from -rectSize to -rectSize*4 <- ???
      int rectX = i * rectSize;
      int rectY = (int) random(-rectSize * 8, -rectSize);

      fallingRects[i] = new PVector(rectX, rectY);

    }
  }

  void animate(int score) {
    for (int i=0; i<fallingRects.length; i++) {
      if (fallingRects[i].y <= height - rectSize && hasFallen < ((1<<fallingRects.length)-1)) {
        fill(51);
        rect(fallingRects[i].x, fallingRects[i].y, rectSize, rectSize);

        fill(255);
        fallingRects[i].y += 8;
        if (fallingRects[i].y >= height - rectSize) {
          rect(fallingRects[i].x, height - rectSize, rectSize, rectSize);

          int mask = 1<<i;
          hasFallen = hasFallen | mask;
          print("i: "); print(i);
          print(", Mask: "); print(Integer.toString(mask, 2));
          print(", hasFallen: "); print(Integer.toString(hasFallen, 2));
          print(", all ones: "); println(Integer.toString( ((1<<fallingRects.length)-1), 2));
        }
        else {
          rect(fallingRects[i].x, fallingRects[i].y, rectSize, rectSize);
        }
      }
    }

    if (hasFallen == ((1<<fallingRects.length)-1)) {
      animationOver = true;

      fill(255);
      textAlign(CENTER);
      textSize(32);
      text("Game Over", width/2, height/3);
      textSize(18);
      text("Final score: " + String.valueOf(score) + "\nPress any key to restart",
           width/2, height/3 + 40);
      rectMode(CORNER);
    }

  }
}
