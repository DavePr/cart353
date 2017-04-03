//--INITIAL PROPERTIES--//
import java.io.File;
import java.util.Iterator;

Game_Screen Game;

void setup() {
  size(1200, 750); 
 Game = new Game_Screen();
  noStroke();
}
void draw() {
  Game.run();
  //    //The Relationship Pages: These lines of codes show the status between the various survivors. The higher the number, the closer the relationship (WORK IN PROGRESS)
  //    background(100);
  //    textSize(36);
  //    //At the top of the page, the name of the selected Survivor
  //    text(survNames[screenNumber-11] + "'s Relationships", 50, 75);
  //    //Setup for Survivor 1
  }