class Button {
  //CLASS PROPERTIES//

  //BUTTON POSITIONING
  int x;
  int y;

  //BUTTON SIZE
  int w;
  int h;

  //SELECTION BOOLEANS
  boolean mouseOver;
  boolean buttonClicked;
  boolean buttonOn;

  //COLORATION
  color buttonColor;
  color highlight;

  //CONSTRUCTOR

  Button(int newX, int newY, int newW, int newH, color newColor, color newHighlight) {

    //BUTTON POSITIONING
    x = newX;
    y = newY;

    //BUTTON SIZE
    w = newW;
    h = newH;

    //SELECTION BOOLEANS;
    mouseOver = false;
    buttonClicked = false;

    //COLORATION
    buttonColor = newColor;
    highlight = newHighlight;
  }

  //DISPLAY METHOD (IF BUTTON REPRESENTED)

  void display() {
    rectMode(CENTER);
    if (mouseOver) {
      fill(highlight);
    } else {
      fill(buttonColor);
    }
    rect(x, y, w, h);
  }

  //BUTTON HIGHLIGHT METHOD

  void highlight() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-w/2 && mouseY < y+w/2) {
      mouseOver = true;
    } else {
      mouseOver = false;
    }
    if (mouseOver) {
      fill(highlight);
    } else {
      fill(buttonColor);
    }
  }
}