/*
Name: David Proulx
 Date: March 20 2017
 Assignement: Particle Systems
 
 Description:
 So I was not inspired by the day and night cycle, so I instead went with the concept of the creation of an aquarium. 
 So the particle systems are used to represent the pouring of water and and sand, the rising of air bubbles, and the moving about of fish
 An aditionnal class is created, that of the water tank, to create the rising water and sand as the particles fall
 
 It needs to be mentioned that there is a small bug, which I will call the left wall of death, where some fish get stuck on the left side of the screen
 
 */


//IMPORT ITERATOR

import java.io.File;
import java.util.Iterator;

//DECLARE PARTICLE SYSTEMS

ParticleSystem waterdrop;
ParticleSystem bubbles;
ParticleSystem sand;
ParticleSystem fish;

//DECLARE WATERTANK OBJECTS

//RISING WATER
WaterTank water;

//RISING SAND
WaterTank sandbottom;

////SETUP////

void setup() {

  //PROGRAM SIZE
  size(640, 360);

  //INSTANTIATE PARTICLE SYSTEMS
  waterdrop = new ParticleSystem(new PVector(0, 50));
  bubbles = new ParticleSystem(new PVector(50, 365));
  sand = new ParticleSystem(new PVector(0, 0));
  fish = new ParticleSystem(new PVector(width/2, height/2));


  //INSTANTIATE WATERTANK OBJECTS
  water = new WaterTank(50, 50, 255, 0.3, 0);
  sandbottom = new WaterTank(245, 214, 156, 0.1, 300);
}

////DRAW////

void draw() {

  //BACKGROUND COLOR

  background(200);

  //GRAVITY
  PVector gravity = new PVector(0, 0.1);

  //THE WATER AND SAND PARTICLES ARE SUBJECTED TO GRAVITY
  waterdrop.applyForce(gravity);
  sand.applyForce(gravity);

  //SO LONG AS THE TANK IS NOT COMPLETELY FULL OF WATER, KEEP DROPPING WATER PARTICLES
  if (!water.full) { 
    waterdrop.addRain();
    waterdrop.run();
  } 

  //AS WATER PARTICLES FALL, THE WATER RISES IN THE TANK

  water.display();
  water.update();


  //IF THE TANK IS FULL, BUBBLES WILL BEGIN TO RISE

  if (water.full) {
    bubbles.addBubbles();
    bubbles.run();

    //SAND WILL SOON BEGIN TO FORM AT THE BOTTOM OF THE TANK WHEN SAND PARTICLES FALL
    sandbottom.display();

    //IF THE SAND ISN'T AT A SUFFICIENT LEVEL, SAND WILL KEEP FALLING FROM THE TOP
    if (!sandbottom.full) {
      sand.run();    
      sand.addSand();
      sandbottom.update();
    } 
    
    //ONCE THE SAND IS AT THE CORRECT LEVEL, THE TANK IS COMPLETE, AND FISH CAN BEGIN SWIMMING ABOUT
    if (sandbottom.full) {
      fish.addFish();
      fish.swimOut();
    }
  }
}