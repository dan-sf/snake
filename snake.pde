PlayerSnake snake;
Food food;
int framesToWait = 8;
boolean gameOver = false;

void setup() {
  size(600, 600);

  snake = new PlayerSnake();
  food = new Food();

  food.update();
  food.show();
}

void draw() {

  if (frameCount % framesToWait == 0) {
    checkGameOver();
    if (!gameOver) {
      background(51);

      if (snake.eat(food)) {
        snake.growTail();
        food.update();
      }
      food.show();

      snake.update();
      snake.show();
    }
    else {
      if (mousePressed) {
        setup();
        key = 'd';
        gameOver = false;
      }
    }
  }
}

void checkGameOver() {
  if (snake.x < 0 || snake.x >= height - snake.rectSize
      || snake.y > width - snake.rectSize || snake.y < 0) {
    gameOver = true;
  }
  else {
    gameOver = false;
  }
}

