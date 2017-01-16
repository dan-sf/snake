function PlayerSnake(rectSize) {
  this.rectSize = rectSize;
  this.tail = [];

  this.genSpeed = rectSize;
  this.xSpeed = this.genSpeed;
  this.ySpeed = 0;
  this.x = rectSize*2;
  this.y = rectSize*2;

  this.growTail = function() {
    this.tail.push(new PVector(this.x, this.y));
  }

  this.updateDirection = function() {

    // Read in movement keys
    if (key === 'W' || keyCode === UP_ARROW) {
      if (this.tail.length === 0) {
        this.direction(0, -this.genSpeed);
      }
      else if (this.xSpeed !== 0 || this.ySpeed !== this.genSpeed) {
        this.direction(0, -this.genSpeed);
      }
    }

    if (key === 'A' || keyCode === LEFT_ARROW) {
      if (this.tail.length === 0) {
        this.direction(-this.genSpeed, 0);
      }
      else if (this.xSpeed !== this.genSpeed || this.ySpeed !== 0) {
        this.direction(-this.genSpeed, 0);
      }
    }

    if (key === 'S' || keyCode === DOWN_ARROW) {
      if (this.tail.length === 0) {
        this.direction(0, this.genSpeed);
      }
      else if (this.xSpeed !== 0 || this.ySpeed !== -this.genSpeed) {
        this.direction(0, this.genSpeed);
      }
    }

    if (key === 'D' || keyCode === RIGHT_ARROW) {
      if (this.tail.length === 0) {
        this.direction(this.genSpeed, 0);
      }
      else if (this.xSpeed !== -this.genSpeed || this.ySpeed !== 0) {
        this.direction(this.genSpeed, 0);
      }
    }

  }

  this.updatePosition = function() {

    var prevTailX = this.x;
    var prevTailY = this.y;
    var tempTailX;
    var tempTailY;

    // Update each rect in the tail with the position of the rect infront of it
    for (i=0; i<this.tail.length; i++) {
      // Hold this rect's position
      tempTailX = this.tail[i].x;
      tempTailY = this.tail[i].y;

      // Update with new coordinates
      this.tail[i].x = prevTailX;
      this.tail[i].y = prevTailY;

      // Save previous coordinates
      prevTailX = tempTailX;
      prevTailY = tempTailY;
    }

    // Move the head
    this.x += this.xSpeed;
    this.y += this.ySpeed;
  }

  this.direction = function(x, y) {
    this.xSpeed = x;
    this.ySpeed = y;
  }

  this.eat = function(food) {
    if ((this.x > food.x - rectSize && this.x < food.x + food.rectSize) &&
        (this.y > food.y - rectSize && this.y < food.y + food.rectSize)) {
      return true;
    }
    else {
      return false;
    }
  }

  this.death = function() {
    var hitTail = false;
    var hitTop = this.y < 0;
    var hitBottom = this.x > height - this.rectSize;
    var hitLeft = this.y > width - this.rectSize;
    var hitRight = this.x < 0;

    for (i=0; i<this.tail.length; i++) {
      if ((this.x > this.tail[i].x - this.rectSize && this.x < this.tail[i].x + this.rectSize) &&
          (this.y > this.tail[i].y - this.rectSize && this.y < this.tail[i].y + this.rectSize)) {
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

  this.show = function() {
    fill(255);
    stroke(51);

    for (i=0; i<this.tail.length; i++) {
      rect(this.tail[i].x, this.tail[i].y, this.rectSize, this.rectSize);
    }
    rect(this.x, this.y, this.rectSize, this.rectSize);
  }
}
