//WATERTANK OBJECT FOR RISING SAND AND WATER

class WaterTank {

  //PROPERTIES

  //POSITION
  int x;
  float y;
  int w;
  float h;

  //IF IT IS AT THE DESIRED HEIGHT
  boolean full;

  //COLOR
  color c;

  //SPEED AT WHICH IT RISES
  float SpeedUp;

  //THE MAXIMUM HEIGHT
  int Cap;

  //CONSTRUCTOR METHOD

  WaterTank(int r, int g, int b, float raise, int yMax) {

    x = 0;
    y = height+25;
    w = width;
    h = -25;
    full = false;
    c = color(r, g, b);
    SpeedUp = raise;
    Cap = yMax;
  
}

  //DISPLAY METHOD
  void display() {
    noStroke();
    fill(c);
    rect(x, y, w, h);
  }

//UPDATE METHOD (IF NOT AT DESIRED HEIGHT, KEEPS RISING

  void update() {
    if (y > Cap) {
      y -= SpeedUp; 
      h += SpeedUp;
    } else if (y <= Cap) {
      full = true;
    }
  }
  
  
}