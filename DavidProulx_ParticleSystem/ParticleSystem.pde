//PARTICLE SYSTEM CLASS, AS SCENE IN THE NATURE OF CODE
//ADJUSTED FOR ASSIGNEMENT

class ParticleSystem {
  
  //PROPERTIES
  
  ArrayList<Particle> particles;
  PVector origin;
  ArrayList<Fish> fish;
  
  //CONSTRUCTOR

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    fish = new ArrayList<Fish>();
  }

  //FORCE METHOD
  
  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }
  
  //METHOD TO ADD PARTICLES (NOT DIRECTLY USED)

  void addParticle() {
    particles.add(new Particle(origin));
  }

  //METHOD TO ADD RAIN PARTICLES
  
  void addRain() {
    particles.add(new RainLeft(origin)); 
    particles.add(new RainRight(origin));
  }

  //METHOD TO ADD BUBBLE PARTICLES
  
  void addBubbles() {
    particles.add(new Bubbles(origin));
  }

  //METHOD TO ADD SAND PARTICLES
  
  void addSand() {
    particles.add(new Sand(origin));
  }

  //METHOD TO ADD FISH PARTICLES
  
  void addFish() {
    fish.add(new Fish());
  }

  //RUN METHOD 
  
  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
  
  //ADAPTED RUN METHOD FOR FISH 
  
   void swimOut() {
    Iterator<Fish> it = fish.iterator();
    while (it.hasNext()) {
      Fish f = it.next();
      f.run();
      if (f.isGone()) {
        it.remove();
      }
    }
  }
}