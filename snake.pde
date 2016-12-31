// TODO: Figure out how to use a higher framerate
PlayerSnake snake;
Food food;
int tmp;
boolean gameOver;

void setup() {
  size(600, 600);
  background(51);

  snake = new PlayerSnake();
  food = new Food();

  food.update();
  food.show();
  tmp=0;
  gameOver = false;
}

void draw() {

  boolean updateGame = frameCount % 8 == 0;
  if (!gameOver && updateGame) {
    if (snake.eat(food)) {
      snake.growTail();
      food.update();
    }
    if (tmp < 10) {
      snake.growTail();
      tmp++;
    }

    snake.update();
    if (!snake.death()) {
      background(51);
      food.show();
      snake.show();
    }
    else {
      gameOver = true;
    }
  }
  else if (gameOver) {
    if (mousePressed || keyPressed) {
      setup();
      key = 'd';
    }
  }
}

