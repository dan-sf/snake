/* Todo:
    - make game consistent when frame rate changes
    - figure out why rendering text takes so long on start up
*/

PlayerSnake snake;
Food food;
Score score;
GameOverSplash gameOverSplash;
boolean gameOver;

int rectSize = 20;
boolean beginGame = false;

void setup() {
  size(400, 400);
  background(51);

  snake = new PlayerSnake(rectSize);
  food = new Food(rectSize);
  score = new Score();
  gameOverSplash = new GameOverSplash(rectSize);

  food.update();
  score.show();
  gameOver = false;
}

void keyPressed() {
  if (!beginGame) {
    beginGame = true;
  }
  else if (gameOver && gameOverSplash.animationOver) {
    setup();
  }
  else {
    snake.updateDirection();
  }
}

void draw() {
  boolean updateGame = frameCount % 8 == 0;

  if (!beginGame) {
    // Opening splash screen
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Snake", width/2, height/3);
    textSize(18);
    text("Use w,a,s,d for movement\nPress any key to start",
         width/2, height/3 + 40);
  }
  else if (!gameOver && updateGame) {
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
