class Game_Screen {
  //CLASS PROPERTIES//
  int menuNo;

  //SYSTEM
  SurvivorSystem sys;
  //BUTONS
  Button start;

  //Gun
  Gun pistol;

  //POSITIONING:
  int center;

  //SIZE:
  int w;
  int h;

  //COLORATION: 
  color lightGrey;
  color darkGrey;

  //CURRENT DAY 
  int dayNo;

  //CONSTRUCTOR

  Game_Screen() {
    dayNo = 1;
    menuNo = 0;
    lightGrey = 155;
    darkGrey = 100;
    center =  ( (width/2) + (height/2) ) /2 ;
    w = width;
    h = height;
    start = new Button(center + 100, center, 100, 50, 255, 0);
    pistol = new Gun(100, 600);
    sys = new SurvivorSystem();
    sys.spawn();
  }

  //START SCREEN:

  void run() {
    if (menuNo == 0) {
      startup();
    } else if (menuNo == 1) {
      intro();
    } else if (menuNo == 2) {
      group();
    } else if (menuNo == 3) {
      profile();
    }
  }

  void startup() {
    background(darkGrey);
    textAlign(CENTER);
    textSize(72);
    fill(255);
    text("Quandary", center + 100, center - 300);
    textSize(36);
    start.highlight();
    text("Start", center + 100, center);
    if (mousePressed && start.mouseOver) {
      menuNo = 1;
    }
  }

  void intro() {
    background(darkGrey);
    textAlign(CENTER);
    textSize(36);
    fill(255);
    text("Here's where the intro goes", center +100, center-300);
    text("Press Any Key to Begin", center +100, center);
    if (keyPressed) {
      menuNo = 2;
    }
  }

  void group() {
    background(lightGrey);
    textAlign(CORNER);
    textSize(36);
    fill(255);
    text("Day " + dayNo, 25, 50);
    rectMode(CORNER);
    fill(darkGrey);
    rect(0, h/2+75, w, h);
    pistol.display();
    sys.gdisp();
    if (mousePressed && sys.profileClick == true) {
      menuNo = 3;
    }
  }

  void profile() {
    background(lightGrey);
    rectMode(CORNER);
    fill(100);
    rect(0, center-30, w, h);
    rect(50, 100, 300, 300);
    sys.idisp(); 
    textSize(36);
    //text(survNames[screenNumber], 50, 75);
    //text("Health: " + Group[screenNumber].health, 375, 130);
    //text("Sanity: "  + Group[screenNumber].sanity, 375, 230);
    //text("Trust: "  + Group[screenNumber].trust, 375, 330);
    fill(200);
    text("View Relationships", 400, 500);
  }

  /* Outline for Game Screens
   MAIN MENU/STARTING SCREEN    DONE
   INTRODUCTION PAGE            DONE
   GROUP OVERVIEW PAGE          DONE
   SURVIVOR PROFILE
   SURVIVOR RELATIONSHIP
   DIALOGUE SCREEN
   NOTIFICATION PAGE
   PROGRESS PAGE
   END GAME
   */
}