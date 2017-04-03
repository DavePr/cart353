//--INITIAL PROPERTIES--//
import java.io.File;
import java.util.Iterator;

Game_Screen Menu;

void setup() {
  Menu = new Game_Screen();
    size(750, 750); 
  noStroke();
}
void draw() {
  Menu.run();
  //if (Menu.menuNo >= 1) {
  //    //Profile Screen: Clicking on any character will change the screen to their profile page, displaying their statistics. From there the player can access the Relationship page.
  //    background(155);
  //   
  //  } else if (screenNumber > 10) {
  //    //The Relationship Pages: These lines of codes show the status between the various survivors. The higher the number, the closer the relationship (WORK IN PROGRESS)
  //    background(100);
  //    textSize(36);
  //    //At the top of the page, the name of the selected Survivor
  //    text(survNames[screenNumber-11] + "'s Relationships", 50, 75);
  //    //Setup for Survivor 1
  //  
}
//void mousePressed() {
//  for (int i=0; i<Group.length; i++) {
//    if (mouseX < Group[i].x +25 && mouseX > Group[i].x -25 && mouseY < Group[i].y +100 && mouseY > Group[i].y -100) {
//      if (screenNumber == -1) {
//        screenNumber = i;
//      }
//    }
//  }
//  if (screenNumber != -1) {
//    if (mouseX > 200 && mouseX < 525 && mouseY >= 400 && mouseY < 550) {
//      screenNumber += 11;
//    }
//  }
//}
//If the correct key is pressed, the characters move around
//void keyPressed() {
//  //Press D to move all the characters right
//  if (key == 'd') {
//    for (int i=0; i<Group.length; i++) {
//      Group[i].x++;
//    }
//    //Press A to move all the characters left
//  } else if (key == 'a') {
//    for (int i=0; i<Group.length; i++) {
//      Group[i].x--;
//    }
//  }
//  