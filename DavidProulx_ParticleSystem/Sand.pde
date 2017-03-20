//SAND PARTICLES

class Sand extends Particle {

  //CONSTRUCTOR (TAKEN FROM PARTICLE)

  Sand(PVector l) {

    super(l);

    //CHANGE IN VELOCITY
    velocity = new PVector(random(0, 5), random(0, 1));

    //MASS IS CHANGED TO SIMULATE WATER
    mass = 5;
  }

  //DISPLAY METHOD
  void display() {
    fill(245, 214, 156, lifespan);
    stroke(255, lifespan);
    ellipse(location.x, location.y, 1, 1);
  }
}