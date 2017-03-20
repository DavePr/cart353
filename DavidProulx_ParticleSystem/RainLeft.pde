//LEFT STREAM OF RAIN PARTICLES

class RainLeft extends Particle {

  //CONSTRUCTOR (TAKEN FROM PARTICLE)
  
  RainLeft(PVector l) {
    super(l);
    
    //CHANGE IN VELOCITY
    
    velocity = new PVector(random(1, -1), random(-2, 0));
  }
  
  //DISPLAY METHOD
  void display() {
    fill(50, 50, 255, lifespan);
    stroke(25, 25, 255, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }
}