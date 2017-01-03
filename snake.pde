// Todo: make game consistent when frame rate changes
PlayerSnake snake;
Food food;
boolean gameOver;

int rectSize = 20;
int windowSize = 25 * rectSize;

// Note: settings only allows size to be used with variables (new in processing 3,
// breaks on older versions), is this needed?
void settings() {
  size(windowSize, windowSize);
}

void setup() {
  background(51);

  snake = new PlayerSnake(rectSize);
  food = new Food(rectSize);

  food.update();
  food.show();
  gameOver = false;
}

void keyPressed() {
  if (gameOver) {
    setup();
  }
  else {
    snake.updateDirection();
  }
}

void draw() {

  boolean updateGame = frameCount % 8 == 0;
  if (!gameOver && updateGame) {
    if (snake.eat(food)) {
      snake.growTail();
      food.update();
    }

    snake.updatePosition();
    if (!snake.death()) {
      background(51);
      food.show();
      snake.show();
    }
    else {
      gameOver = true;
    }
  }
}

