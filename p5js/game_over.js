function GameOverSplash(rectSize) {
  this.rectSize = rectSize;
  this.fallingRects = [];
  this.hasFallen = 0;
  this.speed = 8;
  this.animationOver = false;

  this.numRects = width / rectSize;

  for (i=0; i < this.numRects; i++) {
    var rectX = i * rectSize;
    var rectY = Math.floor(random(-rectSize * this.speed, -rectSize));

    this.fallingRects.push(new PVector(rectX, rectY));
  }

  this.animate = function(score) {
    // Create the falling rect animation. Uses a bit field to keep track of
    // when the rects reach the bottom of the screen.
    for (i=0; i<this.fallingRects.length; i++) {
      if (this.fallingRects[i].y <= height - this.rectSize && this.hasFallen < ((1<<this.fallingRects.length)-1)) {
        // Erase the previous screen
        fill(51);
        rect(this.fallingRects[i].x, this.fallingRects[i].y, this.rectSize, this.rectSize);

        fill(255);
        this.fallingRects[i].y += this.speed;
        if (this.fallingRects[i].y >= height - this.rectSize) {
          rect(this.fallingRects[i].x, height - this.rectSize, this.rectSize, this.rectSize);

          // Fallen bit field
          var mask = 1<<i;
          this.hasFallen = this.hasFallen | mask;
        }
        else {
          rect(this.fallingRects[i].x, this.fallingRects[i].y, this.rectSize, this.rectSize);
        }
      }
    }

    // Check if all falling rects have reached the bottom of the screen
    if (this.hasFallen == ((1<<this.fallingRects.length)-1)) {
      this.animationOver = true;

      fill(255);
      textAlign(CENTER);
      textSize(32);
      text("Game Over", width/2, height/3);
      textSize(18);
      text("Final score: " + score + "\nPress any key to restart",
           width/2, height/3 + 40);
    }
  }
}

