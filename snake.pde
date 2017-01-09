/* Todo:
    - make game consistent when frame rate changes
    - figure out why rendering text takes so long on start up
    - add a new game splash screen
    - add read me
*/

PlayerSnake snake;
Food food;
Score score;
GameOverSplash gameOverSplash;
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
  textSize(32);

  snake = new PlayerSnake(rectSize);
  food = new Food(rectSize);
  score = new Score();
  gameOverSplash = new GameOverSplash(width, rectSize);

  food.update();
  food.show();

  score.show();

  gameOver = false;
}

void keyPressed() {
  if (gameOver && gameOverSplash.animationOver) {
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
      score.increase();
      do {
        food.update();
      } while (food.isOnSnake(snake.x, snake.y, snake.tail));
    }

    snake.updatePosition();
    if (!snake.death()) {
      background(51);
      food.show();
      snake.show();
      score.show();
    }
    else {
      gameOver = true;
    }
  }
  else if (gameOver) {
    gameOverSplash.animate(score.score);
  }
}

