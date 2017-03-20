//FISH CLASS

class Fish {

  //PROPERTIES

  //POSITIONING
  int x;
  int y;

  //SIZE
  int size;

  //COLOR
  color fishColor;

  //FISH SWIM SPEED
  float speed;

  //IF THE FISH IS MOVING LEFT OR RIGHT
  boolean movingRight;

  //FLOAT TO DETERMINE WHICH DIRECTION THE FISH IS MOVING
  float direction;

  //CONSTRUCTOR

  Fish() {

    //THE FISH'S DIRECTION IS RANDOMLY DETERMINED

    direction = random(0, 1);
    if (direction > 0.5) {
      movingRight = true;
    } else {
      movingRight = false;
    }

    //THE FISH'S X POSITION IS DETERMINED BASED ON THE DIRECTION IT IS MOVING
    if (movingRight) {
      x = -15;
    } else if (!movingRight) {
      x = width+5;
    }

    //THE Y POSITION IS RANDOMIZED FROM THE TOP OF THE SCREEN TO NEAR THE SAND
    y = int(random(0, 275));

    //THE FISH'S SIZE 
    size = 5;

    //COLOR
    fishColor = color(136, 161, 201);

    //RANDOMLY DETERMINED SPEED
    speed = random(0.1, 3);
  }

//DISPLAY FUNCTION FOR FISH MOVING FROM LEFT TO RIGHT

  void leftFish() {
    fill(fishColor);
    strokeWeight(3);
    triangle(x-size/2+5, y, x- size, y + size/2, x - size, y - size/2);
    ellipse(x, y, size, size);
  }
  
//DISPLAY FUNCTION FOR FISH MOVING FROM RIGHT TO LEFT

  void rightFish() {
    fill(fishColor);
    strokeWeight(3);
    triangle(x + size/2-5, y, x+ size, y + size/2, x + size, y - size/2);
    ellipse(x, y, size, size);
  }

//THE FISH MOVES ACROSS THE SCREEN

  void update() {
    if (movingRight) {
      x += speed;
    } else if (!movingRight) {
      x -= speed;
    }
  }
  
  //RUN FUNCTION, SIMILARLY TO THE PARTICLE FUNCTION OF THE SAME NAME

  void run() {
    update();
    if (movingRight) {
      leftFish();
    } else if (!movingRight) {
      rightFish();
    }
  }

//THE FISH VERSION OF isDead, WHICH INSTEAD OF WORKING WITH LIFESPAN IS DETERMINED WHEN THE FISH SWIMS OFFSCREEN

  boolean isGone() {
    if (movingRight) { 
      if (x >= width+15) {
        return true;
      } else {
        return false;
      }
    } else if (!movingRight) { 
      if (x <= -15) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
  
  //END OF CLASS
}