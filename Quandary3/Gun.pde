class Gun {
  //CLASS PROPERTIES//

  //OBJECT POSITIONING
  int x;
  int y;
  int size;

  //OBJECT COLORATION
  color gunColor;
  color barrelColor;

  //GUN MODE (IF EQUIPPED OR NOT)
  boolean equipped;

  //CONSTRUCTOR
  Gun(int newX, int newY) {
    x = newX;
    y = newY;
    size = 50;
    gunColor = 50;
    barrelColor = 150;
    equipped = false;
  }
  //DISPLAY METHOD
  void display() {
    if (!equipped) {
      rectMode(CORNER);
      fill(gunColor);
      rect(x, y, 4*size, size);
      rect(x-25, y, size, size*2);
      fill(barrelColor);
      rect(x+25, y-10, size*3, size/2);
    }
  }
}