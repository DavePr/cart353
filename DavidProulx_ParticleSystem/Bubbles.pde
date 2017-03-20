//BUBBLE CLASS

class Bubbles extends Particle {

  //CONSTRUCTOR (TAKEN FROM PARTICLE)
  Bubbles(PVector l) {
    super(l);

    //CHANGE IN VELOCITY
    velocity = new PVector(random(0, 1), random(-3, 1));
  }

  //DISPLAY METHOD

  void display() {

    fill(255, lifespan);
    strokeWeight(1);
    stroke(255, lifespan);

    //THREE STREAMS OF BUBBLES
    ellipse(location.x, location.y, 8, 8);
    ellipse(location.x+150, location.y, 8, 8);
    ellipse(location.x+300, location.y, 8, 8);
    ellipse(location.x+450, location.y, 8, 8);
  }
}