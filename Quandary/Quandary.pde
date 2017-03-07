//--INITIAL PROPERTIES--//
//To cycle through the various screens
int screenNumber = -1;
//Boolean to check wheter the gun is equipped or not 
boolean gunEquipped = false ;
//THE 11 SURVIVORS//
Survivor[] Group = new Survivor[11];
//Variables to hold the survivor's names
String[] survNames = new String[11];
String surv1;
String surv2;
String surv3;
String surv4;
String surv5;
String surv6;
String surv7;
String surv8;
String surv9;
String surv10;
String surv11;
///STARTING RELATIONSHIPS///
int[] relation = new int[55];
//WTF DOES THIS MEAN: Consider the Survivors categorised from A-K. 
//Each number represents the relationship between two characters. Since there are 11, that's 55
//0-9: Relations with A
//10-18 Relations with B
//There is progressively 1 variable less per category as, for example, the A-B relationship is represented in 0.
//19-27 Relations with C
//28-34 Relations with D
//35-40 Relations with E
//41-45 Relations with F
//46-49 Relations with G
//50-52 Relations with H
//53-54 Relations with I
//55 Relations with J (Specifically, the J-K relationship)
//End of Explanation
void setup() {
  //Basic Setup and Background
  noStroke();
  background(155);
  size(750, 750); 
  rectMode(CORNER);
  fill(100);
  rect(0, height/2+75, width, height);
  //Character positioning
  int xMan = width/2 -500;
  int yMan = height/2;
  //Initialising Arrays
  for (int i = 0; i < Group.length; i++) {
    Group[i] = new Survivor(xMan, yMan);
    xMan += 100;
  }
  for (int i = 0; i < relation.length; i++) {
    relation[i] = int(random(-25, 100));
  }
  //Name Generation
  nameGen();
}
void draw() {
  //Main Menu Screen:  In this screen, there is the row of survivors that the player can view and click on. 
  if (screenNumber == -1) {
    background(155);
    rectMode(CORNER);
    fill(100);
    rect(0, height/2+75, width, height);
    textSize(24);
    //Displaying the Characters  
    for (int i = 0; i < Group.length; i++) {
      Group[i].display();
      Group[i].adjustColor();
      text(survNames[i], Group[i].x-30, 250);
    }
    //Display of the Gun. Turns on Gun mode or not. WORK IN PROGRESS
    if (gunEquipped == false) {
      //The Gun
      rect(200, 600, 200, 50);
      rect(100, 625, 50, 100);
      fill(150);
      rect(200, 580, 150, 25);
    } else {
      //The Marker
      fill(175, 0, 0);
      ellipse(mouseX, mouseY, 10, 10);
    }
  } else if (screenNumber > -1 && screenNumber < 11) {
    //Profile Screen: Clicking on any character will change the screen to their profile page, displaying their statistics. From there the player can access the Relationship page.
    background(155);
    rectMode(CORNER);
    fill(100);
    rect(0, height/2+75, width, height);
    rect(50, 100, 300, 300);
    Group[screenNumber].x=200; 
    Group[screenNumber].y=250; 
    Group[screenNumber].display();  
    textSize(36);
    text(survNames[screenNumber], 50, 75);
    text("Health: " + Group[screenNumber].health, 375, 130);
    text("Sanity: "  + Group[screenNumber].sanity, 375, 230);
    text("Trust: "  + Group[screenNumber].trust, 375, 330);
    fill(200);
    text("View Relationships", 200, 500);
  } else if (screenNumber > 10) {
    //The Relationship Pages: These lines of codes show the status between the various survivors. The higher the number, the closer the relationship (WORK IN PROGRESS)
    background(100);
    textSize(36);
    //At the top of the page, the name of the selected Survivor
    text(survNames[screenNumber-11] + "'s Relationships", 50, 75);
    //Setup for Survivor 1
    if (screenNumber -11 == 0) {
      text("with " + survNames[1] + ": " + relation[0], 50, 150);
      text("with " + survNames[2]  + ": " + relation[1], 50, 200);
      text("with " + survNames[3] + ": " + relation[2], 50, 250);
      text("with " + survNames[4] + ": " + relation[3], 50, 300);
      text("with " + survNames[5] + ": " + relation[4], 50, 350);
      text("with " + survNames[6] + ": " + relation[5], 50, 400);
      text("with " + survNames[7] + ": " + relation[6], 50, 450);
      text("with " + survNames[8] + ": " + relation[7], 50, 500);
      text("with " + survNames[9] + ": " + relation[8], 50, 550);
      text("with " + survNames[10] + ": " + relation[9], 50, 600);
      //Setup for Survivor 2
    } else if (screenNumber -11 == 1) {
      text("with " + survNames[0]  + ": " + relation[0], 50, 150);
      text("with " + survNames[2] + ": " + relation[10], 50, 200);
      text("with " + survNames[3] + ": " + relation[11], 50, 250);
      text("with " + survNames[4] + ": " + relation[12], 50, 300);
      text("with " + survNames[5] + ": " + relation[13], 50, 350);
      text("with " + survNames[6] + ": " + relation[14], 50, 400);
      text("with " + survNames[7] + ": " + relation[15], 50, 450);
      text("with " + survNames[8] + ": " + relation[16], 50, 500);
      text("with " + survNames[9] + ": " + relation[17], 50, 550);
      text("with " + survNames[10] + ": " + relation[18], 50, 600);
      //Setup for Survivor 3
    } else if (screenNumber -11 == 2) {
      text("with " + survNames[0] + ": " + relation[1], 50, 150);
      text("with " + survNames[1] + ": " + relation[10], 50, 200);
      text("with " + survNames[3] + ": " + relation[19], 50, 250);
      text("with " + survNames[4] + ": " + relation[20], 50, 300);
      text("with " + survNames[5] + ": " + relation[21], 50, 350);
      text("with " + survNames[6] + ": " + relation[22], 50, 400);
      text("with " + survNames[7] + ": " + relation[23], 50, 450);
      text("with " + survNames[8] + ": " + relation[24], 50, 500);
      text("with " + survNames[9] + ": " + relation[25], 50, 550);
      text("with " + survNames[10] + ": " + relation[26], 50, 600);
      //Setup for Survivor 4
    } else if (screenNumber -11 == 3) {
      text("with " + survNames[0] + ": " + relation[2], 50, 150);
      text("with " + survNames[1] + ": " + relation[11], 50, 200);
      text("with " + survNames[2] + ": " + relation[19], 50, 250);
      text("with " + survNames[4] + ": " + relation[27], 50, 300);
      text("with " + survNames[5] + ": " + relation[28], 50, 350);
      text("with " + survNames[6] + ": " + relation[29], 50, 400);
      text("with " + survNames[7] + ": " + relation[30], 50, 450);
      text("with " + survNames[8] + ": " + relation[31], 50, 500);
      text("with " + survNames[9] + ": " + relation[32], 50, 550);
      text("with " + survNames[10] + ": " + relation[33], 50, 600);
      //Setup for Survivor 5
    } else if (screenNumber -11 == 4) {
      text("with " + survNames[0] + ": " + relation[3], 50, 150);
      text("with " + survNames[1] + ": " + relation[12], 50, 200);
      text("with " + survNames[2] + ": " + relation[20], 50, 250);
      text("with " + survNames[3] + ": " + relation[27], 50, 300);
      text("with " + survNames[5] + ": " + relation[34], 50, 350);
      text("with " + survNames[6] + ": " + relation[35], 50, 400);
      text("with " + survNames[7] + ": " + relation[36], 50, 450);
      text("with " + survNames[8] + ": " + relation[37], 50, 500);
      text("with " + survNames[9] + ": " + relation[38], 50, 550);
      text("with " + survNames[10] + ": " + relation[39], 50, 600);
      //Setup for Survivor 6
    } else if (screenNumber -11 == 5) {
      text("with " + survNames[0] + ": " + relation[4], 50, 150);
      text("with " + survNames[1] + ": " + relation[13], 50, 200);
      text("with " + survNames[2] + ": " + relation[21], 50, 250);
      text("with " + survNames[3] + ": " + relation[28], 50, 300);
      text("with " + survNames[4] + ": " + relation[34], 50, 350);
      text("with " + survNames[6] + ": " + relation[40], 50, 400);
      text("with " + survNames[7] + ": " + relation[41], 50, 450);
      text("with " + survNames[8] + ": " + relation[42], 50, 500);
      text("with " + survNames[9] + ": " + relation[43], 50, 550);
      text("with " + survNames[10] + ": " + relation[44], 50, 600);
      //Setup for Survivor 7
    } else if (screenNumber -11 == 6) {
      text("with " + survNames[0] + ": " + relation[5], 50, 150);
      text("with " + survNames[1] + ": " + relation[14], 50, 200);
      text("with " + survNames[2] + ": " + relation[22], 50, 250);
      text("with " + survNames[3] + ": " + relation[29], 50, 300);
      text("with " + survNames[4] + ": " + relation[35], 50, 350);
      text("with " + survNames[5] + ": " + relation[40], 50, 400);
      text("with " + survNames[7] + ": " + relation[45], 50, 450);
      text("with " + survNames[8] + ": " + relation[46], 50, 500);
      text("with " + survNames[9] + ": " + relation[47], 50, 550);
      text("with " + survNames[10] + ": " + relation[48], 50, 600);
      //Setup for Survivor 8
    } else if (screenNumber -11 == 7) {
      text("with " + survNames[0] + ": " + relation[6], 50, 150);
      text("with " + survNames[1] + ": " + relation[15], 50, 200);
      text("with " + survNames[2] + ": " + relation[23], 50, 250);
      text("with " + survNames[3] + ": " + relation[30], 50, 300);
      text("with " + survNames[4] + ": " + relation[36], 50, 350);
      text("with " + survNames[5] + ": " + relation[41], 50, 400);
      text("with " + survNames[6] + ": " + relation[45], 50, 450);
      text("with " + survNames[8] + ": " + relation[49], 50, 500);
      text("with " + survNames[9] + ": " + relation[50], 50, 550);
      text("with " + survNames[10] + ": " + relation[51], 50, 600);
      //Setup for Survivor 9
    } else if (screenNumber -11 == 8) {
      text("with " + survNames[0] + ": " + relation[7], 50, 150);
      text("with " + survNames[1] + ": " + relation[16], 50, 200);
      text("with " + survNames[2] + ": " + relation[24], 50, 250);
      text("with " + survNames[3] + ": " + relation[31], 50, 300);
      text("with " + survNames[4] + ": " + relation[37], 50, 350);
      text("with " + survNames[5] + ": " + relation[42], 50, 400);
      text("with " + survNames[6] + ": " + relation[46], 50, 450);
      text("with " + survNames[7] + ": " + relation[49], 50, 500);
      text("with " + survNames[9] + ": " + relation[52], 50, 550);
      text("with " + survNames[10] + ": " + relation[53], 50, 600);
      //Setup for Survivor 10
    } else if (screenNumber -11 == 9) {
      text("with " + survNames[0] + ": " + relation[8], 50, 150);
      text("with " + survNames[1] + ": " + relation[17], 50, 200);
      text("with " + survNames[2] + ": " + relation[25], 50, 250);
      text("with " + survNames[3] + ": " + relation[32], 50, 300);
      text("with " + survNames[4] + ": " + relation[38], 50, 350);
      text("with " + survNames[5] + ": " + relation[43], 50, 400);
      text("with " + survNames[6] + ": " + relation[47], 50, 450);
      text("with " + survNames[7] + ": " + relation[50], 50, 500);
      text("with " + survNames[8] + ": " + relation[52], 50, 550);
      text("with " + survNames[10] + ": " + relation[54], 50, 600);
      //Setup for Survivor 11
    } else if (screenNumber -11 == 10) {
      text("with " + survNames[0] + ": " + relation[9], 50, 150);
      text("with " + survNames[1] + ": " + relation[18], 50, 200);
      text("with " + survNames[2] + ": " + relation[26], 50, 250);
      text("with " + survNames[3] + ": " + relation[33], 50, 300);
      text("with " + survNames[4] + ": " + relation[39], 50, 350);
      text("with " + survNames[5] + ": " + relation[44], 50, 400);
      text("with " + survNames[6] + ": " + relation[48], 50, 450);
      text("with " + survNames[7] + ": " + relation[51], 50, 500);
      text("with " + survNames[8] + ": " + relation[53], 50, 550);
      text("with " + survNames[9] + ": " + relation[54], 50, 600);
    }
  }
}
void mousePressed() {
  for (int i=0; i<Group.length; i++) {
    if (mouseX < Group[i].x +25 && mouseX > Group[i].x -25 && mouseY < Group[i].y +100 && mouseY > Group[i].y -100) {
      if (screenNumber == -1) {
        screenNumber = i;
      }
    }
  }
  if (screenNumber != -1) {
    if (mouseX > 200 && mouseX < 525 && mouseY >= 400 && mouseY < 550) {
      screenNumber += 11;
    }
  }
  //WORK IN PROGRESS
  //if (gunEquipped == false) {
  //  gunEquipped = true;
  //} else {
  //  gunEquipped = false;
  //}
}
//If the correct key is pressed, the characters move around
void keyPressed() {
  //Press D to move all the characters right
  if (key == 'd') {
    for (int i=0; i<Group.length; i++) {
      Group[i].x++;
    }
    //Press A to move all the characters left
  } else if (key == 'a') {
    for (int i=0; i<Group.length; i++) {
      Group[i].x--;
    }
  }
  //MONOCHROMATIC TEST: By Pressing P, the Wellbeing value of each character is set to 0, triggering adjustColor() on all of them. This is for test/display purposes
  if (key == 'p') {
    for (int i = 0; i < Group.length; i++) {
       Group[i].wellbeing = 0;
    }
  }
}
//Custom function to determine names of survivor, depending on gender
void nameGen() {
  //Survivor 1
  if (Group[0].rollGend < 5) {
    survNames[0] = "John";
  } else {
    survNames[0] = "Jane";
  }
  //Survivor 2
  if (Group[1].rollGend < 5) {
    survNames[1] = "Eric";
  } else {
    survNames[1] = "Erica";
  }
  //Survivor 3
  if (Group[2].rollGend < 5) {
    survNames[2] = "Sam";
  } else {
    survNames[2] = "Sarah";
  }
  //Survivor 4
  if (Group[3].rollGend < 5) {
    survNames[3] = "Kyle";
  } else {
    survNames[3] = "Kylie";
  }
  //Survivor 5
  if (Group[4].rollGend < 5) {
    survNames[4]= "Peter";
  } else {
    survNames[4] = "Penny";
  }
  //Survivor 6
  if (Group[5].rollGend < 5) {
    survNames[5] = "Arnold";
  } else {
    survNames[5] = "Annie";
  }
  //Survivor 7
  if (Group[6].rollGend < 5) {
    survNames[6] = "Liam";
  } else {
    survNames[6] = "Laura";
  }
  //Survivor 8
  if (Group[7].rollGend < 5) {
    survNames[7] = "Hector";
  } else {
    survNames[7] = "Hannah";
  }
  //Survivor 9
  if (Group[8].rollGend < 5) {
    survNames[8] = "John";
  } else {
    survNames[8] = "Jane";
  }
  //Survivor 10
  if (Group[9].rollGend < 5) {
    survNames[9] = "Daniel";
  } else {
    survNames[9] = "Diane";
  }
  //Survivor 11
  if (Group[10].rollGend < 5) {
    survNames[10] = "George";
  } else {
    survNames[10] = "Grace";
  }
}