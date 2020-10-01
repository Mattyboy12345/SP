//class
Game game;
//loaded from data
PFont font;

public void settings(){
  size(1001, 1001);
}
void setup() {
  
  //hastighed
  frameRate(10); 
  font = loadFont("Serif-16.vlw");
  //størrelse 
  textFont(font, 16);
  //class igen
  game = new Game(25, 25, 5, 5);
  
 

  
}

void draw() {
  //kalder update
  game.update();
  background(0); //black
  
  //dobbelt array
  int[][] board = game.getBoard();
  //for loop. nest kommer ind i for loop
  for (int y = 0; y < game.getHeight(); y++) {
    for (int x = 0; x < game.getWidth(); x++) {
      
      if (board[x][y]==1) {
        //printer firkanten som spiller står i
        println("player found " + x + " " + y);
        fill(0, 0, 255); 
        
      } else if (board[x][y]==2) {
        fill(255, 0, 0); 
        
      } else if (board[x][y]==3) {
        fill(0, 255, 0); 
        
      } else if (board[x][y]==4) {
        fill(255, 0, 255);
        
      } else if (board[x][y]==0) { 
        fill(0, 0, 0); 
      }
      stroke(100, 100, 100); //farve på linjer 
      rect(x*40, y*40, 40, 40); //firkanter størrelse
    }
  }
  fill(255); //hvid riller
  text("Player 1 Lives: "+game.playerLife, 25, 25); //Hvor mange liv p1 tilbage
  text("Player 2 Lives; "+game.player2Life, 25,50); //hvor mange liv p2 har tilbage
  noLoop();
  //game.gameOver();
}

//kalder metoden i class
void keyPressed() {
  game.onKeyPressed(key);
}

//kalder metoden i class
void keyReleased() {
  game.onKeyReleased(key);
}
