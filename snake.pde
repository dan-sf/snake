PlayerSnake snake;
Food food;
boolean gameOver = false;

void setup() {
  size(600, 600);

  frameRate(10);
  background(51);

  snake = new PlayerSnake();
  food = new Food();

  food.update();
  food.show();
}

void draw() {
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

void checkGameOver() {
  if (snake.x < 0 || snake.x >= height - snake.rectSize
      || snake.y > width - snake.rectSize || snake.y < 0) {
    gameOver = true;
  }
  else {
    gameOver = false;
  }
}

