var snake;
var food;
var score;
var gameOverSplash;
var gameOver;

var rectSize = 20;
var beginGame = false;

function setup() {
  createCanvas(400, 400);
  background(51);

  snake = new PlayerSnake(rectSize);
  food = new Food(rectSize);
  score = new Score();
  gameOverSplash = new GameOverSplash(rectSize);

  food.update();
  score.show();
  gameOver = false;
}

function keyPressed() {
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

function draw() {
  fill(255, 0, 100);
  rect(20, 20, 20, 20);
}

function draw() {
  var updateGame = frameCount % 8 === 0;

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

