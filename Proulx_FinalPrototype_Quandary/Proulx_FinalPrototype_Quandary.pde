/*
Name: David Proulx
Date: April 11th, 2017
Assignement: Final Prototype
Title: Quandary
*/


//IMPORT
import processing.sound.*;
import java.io.File;
import java.util.Iterator;
//GAME OBJECT
Game_Screen Game;
//MUSIC
//BACKGROUND MUSIC: NOSTALGIA BY TM8
SoundFile background;
SoundFile click;
SoundFile eat;
SoundFile load;
SoundFile shot;

void setup() {
  size(1200, 750);
  //MUSIC
  background = new SoundFile(this, "TM8.mp3");
  click = new SoundFile(this, "Click.wav");
  eat = new SoundFile(this, "Crunch.wav");
  load = new SoundFile(this, "gunLoad.wav");
  shot = new SoundFile(this, "shot.mp3");
  //GAME
  Game = new Game_Screen();
}
void draw() {
  Game.run();
}