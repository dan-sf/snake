/* Todo:
    - make game consistent when frame rate changes
    - add a score display
    - add a game over splash screen or printed word
    - add a new game splash screen
    - add a snake death blink
    - add some music/sound effects
*/

PlayerSnake snake;
Food food;
boolean gameOver;

int rectSize = 20;
int windowSize = 20 * rectSize;

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
      do {
        food.update();
      } while (food.isOnSnake(snake.x, snake.y, snake.tail));
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

