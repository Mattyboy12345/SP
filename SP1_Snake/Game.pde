class Game {
  // egenskaber
  int height;
  int width;
  int numberOfEnemies;
  int numberOfFood; 
  int playerLife;
  int player2Life;
  int[][]board;
  Dot player;
  Dot player2;
  //Det skal være array da der skal være mere end en 
  Dot[] enemies;
  Dot[] food;
  


  Keys keys;

  // konstrukt√∏r
  Game(int width, int height, int nE, int nF) {
   
    numberOfEnemies = nE;
    numberOfFood = nF; 
    enemies = new Dot[nE];
    food = new Dot[nF]; 
    playerLife=100;
    player2Life=100;
    board  = new int[width][height];
    player = new Dot(0, 1, width-1, height-1);
    player2 = new Dot(10, 15, width-1, height-1);
    keys = new Keys();
    

    for (int i = 0; i < nE; ++i) { 
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    for (int i = 0; i < nF; ++i) { 
      food[i] = new Dot(width-1, height-1, width-1, height-1);
    }
  }

  // metoder
  int[][] getBoard() { 
    return board;
  }

  public int getWidth() {
    return height;
  }

  public int getHeight() {
    return width;
  }

  int getPlayerLife() {
    return playerLife;
  }

  int getPlayer2Life() {
    return player2Life;
  }

  void onKeyPressed(char ch) {
    keys.onKeyPressed(ch);
  }
  void onKeyReleased(char ch) {
    keys.onKeyReleased(ch);
  }


  void update() {
    updatePlayer();
    updateEnemies();
    updateFood(); 
    checkForCollisions();
    checkForCollisionsFood();
    clearBoard();
    populateBoard();
    
  }

  void updatePlayer() {
    // tjekke om spilleren har trykket på a,s,d eller w
    if (keys.wDown) { 
      player.moveUp();
    }
    if (keys.aDown) {
      player.moveLeft();
    }
   
    if (keys.sDown) {
      player.moveDown();
    }
    if (keys.dDown) {
      player.moveRight();
    }

    //update player 2
    if (keys.upDown) {
      player2.moveUp();
    }

    if (keys.leftDown) {
      player2.moveLeft();
    }
    if (keys.downDown) {
      player2.moveDown();
    }
    if (keys.rightDown) {
      player2.moveRight();
    }
  }



  void updateEnemies() {
    // loope igennem alle fjender
    for (int i=0; i<enemies.length; i++) {
      // nogle gange skal fjende i følge efter spiller
      // andre gange flytte sig random

      if (i>=0) {

        int dX = player.xPos - enemies[i].xPos;
        int dY = player.yPos - enemies[i].yPos;
        int dX2 = player2.xPos - enemies[i].xPos;
        int dY2 = player2.yPos - enemies[i].yPos;

        //går imod spiller 1
        if (dX>0) {
          //spilleren er til højre - så flyt mod højre
          enemies[i].moveRight();
        } else  if (dX<0) {
          enemies[i].moveLeft();
        } else if (dY>0) {
          //spilleren er til højre - så flyt mod højre
          enemies[i].moveDown();
        } else if (dY<0) {
          enemies[i].moveUp();
        }

        //går imod spiller 2
        if (dX2>0) {
          //spilleren er til højre - så flyt mod højre
          enemies[i].moveRight();
        } else  if (dX2<0) {
          enemies[i].moveLeft();
        } else if (dY2>0) {
          //spilleren er til højre - så flyt mod højre
          enemies[i].moveDown();
        } else if (dY2<0) {
          enemies[i].moveUp();
        }
      }
      int rand = (int) random(4);
      if (rand == 0) {
        enemies[i].moveUp();
      }
      if (rand == 1) {
        enemies[i].moveDown();
      }
      if (rand == 2) {
        enemies[i].moveRight();
      }
      if (rand == 3) {
        enemies[i].moveLeft();
      }
    }
  }

  void updateFood() { 
    //loope igennem alle food
    for (int i=0; i<food.length; i++) {
      if (i>=0) {

        int dX = player.xPos - food[i].xPos;
        int dY = player.yPos - food[i].yPos;
        int dX2 = player2.xPos - food[i].xPos;
        int dY2 = player2.yPos - food[i].xPos;
        if (dX<0) {
          //spilleren er til højre - så flyt mod højre
          food[i].moveRight();
        } else  if (dX>0) {
          food[i].moveLeft();
        } else if (dY<0) {
          //spilleren er til højre - så flyt mod højre
          food[i].moveDown();
        } else if (dY>0) {
          food[i].moveUp();
        }
        if (dX2<0) {
          //spilleren er til højre - så flyt mod højre
          food[i].moveRight();
        } else  if (dX2>0) {
          food[i].moveLeft();
        } else if (dY2<0) {
          //spilleren er til højre - så flyt mod højre
          food[i].moveDown();
        } else if (dY2>0) {
          food[i].moveUp();
        }
      }
      //rand = random
      int rand = (int) random(4);
      if (rand == 0) {
        food[i].moveUp();
      }
      if (rand == 1) {
        food[i].moveDown();
      }
      if (rand == 2) {
        food[i].moveRight();
      }
      if (rand == 3) {
        food[i].moveLeft();
      }
    }
  }

  void checkForCollisions() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi koll
   
    for (int i=0; i<enemies.length; i++) {
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY()) {
        // then coll and player looses one lifepoint
        if (playerLife>0) //fortsætter ikke efter 0
        {
          playerLife--; //falder i liv
        }
      }
      if (enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY()) {
        if (player2Life>0) {
          player2Life--;
        }
      }
    }
  }

  void checkForCollisionsFood() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi koll
    
    for (int i=0; i<food.length; i++) {
      //spiller 1's liv går op pr kollision
      if (food[i].getX() == player.getX() && food[i].getY() == player.getY()) {
        // then coll and player heals one lifepoint
        if (playerLife<100) //stiger ikke over 100
        {
          playerLife++; //stiger i liv
        }
        //fjerner det liv vi kører ind i 
        removeFood(food, i);
        //gør arrayet health lig sig selv plus et i længde
        addFood(food);
      }
      //spiller 2's liv går op pr kollision
      if (food[i].getX() == player2.getX() && food[i].getY() == player2.getY()) {
        // then coll and player heals one lifepoint
        if (player2Life<100) //stiger ikke over 100
        {
          player2Life++; //stiger i liv
        }
        //fjerner det liv vi kører ind i 
        removeFood(food, i);
        //gør arrayet food lig sig selv plus et i længde
        addFood(food);
      }
    }
  }

  //nulstiller felterne igen når de har været brugt
  void clearBoard() {
    for (int y = 0; y < height; ++y) {
      for (int x = 0; x < width; ++x) {
        board[x][y]=0;
      }
    }
  }

  void populateBoard() {
    // insert player1
    board[player.getX()][player.getY()] = 1;
    // insert player2
    board[player2.getX()][player2.getY()] = 4;
    
    for (int i = 0; i < enemies.length; ++i) {
      board[enemies[i].getX()][enemies[i].getY()]= 2;
    }
    for (int i = 0; i < food.length; ++i) {
      board[food[i].getX()][food[i].getY()]= 3;
    }
  }


  void removeFood(Dot[] array, int index) {
    int index2 = array.length-1;
    Dot old = array[index];
    array[index] = array[index2];
    array[index2] = old;
    array = (Dot[])shorten(array);
  }


  void addFood(Dot[] array) {
    array = (Dot[])expand(array);
    array[array.length-1] = new Dot((int)random(width), (int)random(height), width-1, height-1);
  }

  void gameOver() {
    if (playerLife<1) {
      text("Player 2 is the winner.", width/2, height/2);
      noLoop();
    }
    if (player2Life<1) {
      text("Player 1 is the winner.", width/2, height/2);
      noLoop();
    }
  }
}
