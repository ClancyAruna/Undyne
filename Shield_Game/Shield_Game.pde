//Enemy Falling in Grid
//CS30
//Nov 1, 2017

//globals
int[][] board;
int cols, rows;
float cellWidth, cellHeight;
int charX, charY;
int shieldX, shieldY;
float run;
float choose;


void setup() {
  size(800, 800);

  cols = 11;
  rows = 11;
  
  choose = random(1, 4);
  initializeValues();
  spawnEnemyTop();
}

void draw() {
  moveEnemyTop();
 // moveEnemyBottom();
  displayBoard();
}

void keyPressed() {
  if (key == 'a') {
    characterMoveLeft();
  } else if (key == 'd') {
    characterMoveRight();
  }
}

void mousePressed() {
  spawnEnemyTop();
}

void moveEnemyTop() {
  if (frameCount % 30 == 0) {

    for (int x=cols-1; x>=0; x--) {
      for (int y=rows-1; y>=0; y--) {
        if (x > 0){
        if (board[x][y] == 2) {  //enemy spot
          board[x][y] = 0;
          if (y < rows-1) {  //don't go below the grid
            board[x][y+1] = 2;
          }
        }
        }
        if (y > 0 || y > 0 && x > 0) {
        if (board[x][y] == 2) {  //enemy spot
          board[x][y] = 0;
          if (y < rows-1) {  //don't go below the grid
            board[x][y+1] = 2;
          }
        }
        }
      }
    }
  }
}

//void moveEnemyBottom() {
//  if (frameCount % 30 == 0) {

//    for (int x=cols+1; x<=0; x++) {
//      for (int y=rows+1; y<=0; y++) {
//        if (board[x][y] == 2) {  //enemy spot
//          board[x][y] = 0;
//          if (y > rows+1) {  //don't go below the grid
//            board[x][y-1] = 2;
//          }
//        }
//      }
//    }
//  }
//}

void spawnEnemyTop() {
     //if (choose == 1){
       int x = int(cols/2);
       board[x][0] = 2;
     //}
}

void characterMoveLeft() {
  if (charX >= 1) {
    board[shieldX][shieldY] = 0;
    charX--;
    board[charX][charY] = 1;
  }
}

void characterMoveRight() {
  if (charX < cols-1) {
    board[charX][charY] = 0;
    charX++;
    board[charX][charY] = 1;
  }
}


void displayBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1) {
        fill(0);  //character
      } else if (board[x][y] == 2) {
        fill(255, 0, 0);
      } else if (board[x][y] == 0) {
        fill(255); //empty
      }
      //} else if (board[x][y] == 3) {
      //  fill(0,0,255);
      //}
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
    }
  }
}

void initializeValues() {
  board = new int[cols][rows];
  cellWidth = width/cols;
  cellHeight = height/rows;

  //put player on middle row, middle column
  charX = cols/2;
  charY = rows/2;
  board[charX][charY] = 1;
}