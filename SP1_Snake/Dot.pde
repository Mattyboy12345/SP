class Dot { 
  // egenskaber
  int xPos;
  int yPos;
  int xMax;
  int yMax;

  // konstruktør
  Dot(int x, int y, int maxX, int maxY) {
    xPos=x;
    yPos=y;
    xMax=maxX;
    yMax=maxY;
  }
  //player = new Dot(0,0,width-1, height-1);
  // metoder

  int getX() {
    return xPos;
  }

  int getY() {
    return yPos;
  }

  void moveUp() {
    yPos--;
    if (yPos < 0) {
      yPos = 0;
    }
  }

  void moveLeft() {
    xPos--;
    if (xPos < 0) {
      xPos = 0;
    }
  }

    void moveDown() {
      yPos++;
      if (yPos > yMax) {
        yPos = yMax;
      }
    }

    void moveRight() {
      xPos++;
      if (xPos > xMax) {
        xPos = xMax;
      }
    }
}
