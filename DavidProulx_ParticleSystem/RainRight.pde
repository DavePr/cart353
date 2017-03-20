//RIGHT STREAM OF RAIN PARTICLES

class RainRight extends RainLeft {

  //CONSTRUCTOR (TAKEN FROM RAINLEFT)

  RainRight(PVector l) {
    super(l);

    //LOCATION IS CHANGED FROM LEFT SIDE TO RIGHT

    location.x+=width;

    //CHANGE IN VELOCITY
    
    velocity = new PVector(random(-1, -1), random(-2, 0));
  }
}