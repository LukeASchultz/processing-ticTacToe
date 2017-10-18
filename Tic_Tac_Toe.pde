int[] board = {0, 0, 0,
               0, 0, 0,
               0, 0, 0};
int[][] boardPos = {{50, 50}, {150, 50}, {250, 50},
                    {50, 150}, {150, 150}, {250, 150},
                    {50, 250}, {150, 250}, {250, 250}};

boolean x = true;
int xWins = 0;
int oWins = 0;

void setup() {
  size(300, 350);
  rectMode(CENTER);
  textSize(50);
}

void draw() {
  background(255);
  stroke(0);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(0, 300, 300, 300);
  fill(0);
  text("X=", 0, 345);
  text(xWins, 70, 345);
  text("O=", 192, 345);
  text(oWins, 270, 345);
  fill(255);
  
  if (mousePressed) {
    checkPos();
  }
  
  for (int i = 0; i < board.length; i++) {
    if (board[i] == 1) {
      drawCir(boardPos[i][0], boardPos[i][1]);
    } else if (board[i] == 2) {
      drawX(boardPos[i][0], boardPos[i][1]);
    }
  }
  
  winCheck();
  if (checkFull() == true) {
    reset();
  }
}

void drawX(int xpos, int ypos) {
  int decY = ypos -= 50;
  int accY = ypos += 100;
  int decX = xpos -= 50;
  int accX = xpos += 100;
  
  stroke(0, 0, 255);
  line(decX, decY, accX, accY);
  line(accX, decY, decX, accY);
}

void drawCir(int xpos, int ypos) {
  stroke(255, 150, 0);
  ellipse(xpos, ypos, 100, 100);
}

void checkPos() {
  if (mouseX < 100 && mouseY < 100) {
    if (board[0] == 0) {
      x = !(x);
      if (x == true){
        board[0] = 1;
      } else {
        board[0] = 2;
      }
    }
  } else if ((mouseX > 100) && (mouseX < 200) && (mouseY < 100)) {
    if (board[1] == 0) {
      x = !(x);
      if (x == true) {
        board[1] = 1;
      } else {
        board[1] = 2;
      }
    }
  } else if ((mouseX > 200) && (mouseY < 100)) {
    if (board[2] == 0) {
      x = !(x);
      if (x == true) {
        board[2] = 1;
      } else {
        board[2] = 2;
      }
    }
  } else if ((mouseX < 100) && ((mouseY > 100) && (mouseY < 200))) {
    if (board[3] == 0) {
      x = !(x);
      if (x == true) {
        board[3] = 1;
      } else {
        board[3] = 2;
      }
    }
  } else if ((mouseX > 100) && (mouseX < 200) && ((mouseY > 100) && (mouseY < 200))) {
    if (board[4] == 0) {
      x = !(x);
      if (x == true) {
        board[4] = 1;
      } else {
        board[4] = 2;
      }
    }
  } else if ((mouseX > 200) && ((mouseY > 100) && (mouseY < 200))) {
    if (board[5] == 0) {
      x = !(x);
      if (x == true) {
        board[5] = 1;
      } else {
        board[5] = 2;
      }
    }
  } else if ((mouseX < 100) && (mouseY > 200)) {
    if (board[6] == 0) {
      x = !(x);
      if (x == true) {
        board[6] = 1;
      } else {
        board[6] = 2;
      }
    }
  } else if ((mouseX > 100) && (mouseX < 200) && (mouseY > 200)) {
    if (board[7] == 0) {
      x = !(x);
      if (x == true) {
        board[7] = 1;
      } else {
        board[7] = 2;
      }
    }
  } else if ((mouseX > 200) && (mouseY > 200)) {
    if (board[8] == 0) {
      x = !(x);
      if (x == true) {
        board[8] = 1;
      } else {
        board[8] = 2;
      }
    }
  }
}

void winCheck() {
    if ((board[0] > 0) &&(board[0] == board[1]) && (board[0] == board[2])) {
        win(board[0]);
    } else if ((board[3] > 0) &&(board[3] == board[4]) && (board[3] == board[5])) {
        win(board[3]);
    } else if ((board[6] > 0) &&(board[6] == board[7]) && (board[6] == board[8])) {
        win(board[6]);
    }
        
    if ((board[0] > 0) &&(board[0] == board[3]) && (board[0] == board[6])) {
        win(board[0]);
    } else if ((board[1] > 0) &&(board[1] == board[4]) && (board[1] == board[7])) {
        win(board[1]);
    } else if ((board[2] > 0) &&(board[2] == board[5]) && (board[2] == board[8])) {
        win(board[2]);
    }

    if ((board[0] > 0) &&(board[0] == board[4]) && (board[0] == board[8])) {
        win(board[0]);
    } else if ((board[2] > 0) &&(board[2] == board[4]) && (board[2] == board[6])) {
        win(board[2]);
    }
}

void win(int winningPlay) {
  background(255);
  if (winningPlay == 1) {
    oWins += 1;
  } else {
    xWins += 1;
  }
  
  reset();
}

void reset() {
  wait(200);
  for (int i = 0; i < board.length; i += 1) {
    board[i] = 0;
  }
}

boolean checkFull() {
  boolean full = true;
  for (int i = 0; i < board.length; i+= 1) {
    if (board[i] == 0) {
      full = false;
    }
  }
  
  return full;
}

void wait(int waitTime) {
  int time = millis() + waitTime;
  while (time > millis()) {}
}