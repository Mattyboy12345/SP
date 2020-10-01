class Keys {
  //egenskaber
  private boolean wDown = false; 
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  //aku= arrow key up
  private boolean upDown = false;
  private boolean leftDown = false;
  private boolean downDown = false;
  private boolean rightDown = false;

  // konstruktør
  Keys() {
  }
  // metoder
  //Når du klikker bliver den true
  void onKeyPressed(char ch) {
    if (ch=='a' || ch=='A') {
      aDown=true;
    }
    if (ch=='s' || ch=='S') {
      sDown=true;
    }
    if (ch=='w' || ch=='W') {
      wDown=true;
    }
    if (ch=='d' || ch=='D') {
      dDown=true;
    }
    if (keyCode == CODED || keyCode == LEFT) {
      leftDown=true;
    }
    if (keyCode == CODED || keyCode == DOWN) {
      downDown=true;
    }
    if (keyCode == CODED || keyCode == UP) {
      upDown=true;
    }
    if (keyCode == CODED || keyCode == RIGHT) {
      rightDown=true;
    }
  }

  //Når du slipper bliver den false
  void onKeyReleased(char ch) {
    if (ch=='a' || ch=='A') {
      aDown=false;
    }
    if (ch=='s' || ch=='S') {
      sDown=false;
    }
    if (ch=='w' || ch=='W') {
      wDown=false;
    }
    if (ch=='d' || ch=='D') {
      dDown=false;
    }
    if (keyCode == CODED || keyCode == LEFT) {
      leftDown=false;
    }
    if (keyCode == CODED || keyCode == DOWN) {
      downDown=false;
    }
    if (keyCode == CODED || keyCode == UP) {
      upDown=false;
    }
    if (keyCode == CODED || keyCode == RIGHT) {
      rightDown=false;
    }
  }
}
