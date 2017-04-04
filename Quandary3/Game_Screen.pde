class Game_Screen {
  //CLASS PROPERTIES//
  int menuNo;

  //SYSTEM
  SurvivorSystem sys;
  //BUTTONS
  Button start;
  Button back;
  Button prev;
  Button next;
  Button viewR;
  Button sanUp;
  Button trustUp;
  Button drama;
  boolean lock;

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
    start = new Button(center + 100, center, 255, 50, 0);
    back = new Button(1100, 75, 50, 50, 255);
    prev = new Button(100, 600, 125, 50, 255);
    next = new Button(1100, 600, 50, 50, 255);
    sanUp = new Button(675, 200, 200, 25, 255);
    trustUp = new Button(675, 275, 200, 25, 255);
    drama = new Button(675, 375, 200, 25, 255);
    pistol = new Gun(100, 600);
    sys = new SurvivorSystem();
    sys.spawn();
    lock = false;
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
    start.colorHighlight();
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
    sys.gdisp();
    textAlign(CENTER);
    textSize(24);
    for (int i = 0; i < sys.groupSize; i++) {
      Survivor character = sys.s.get(i);
      sys.getName(character, character.x, 200);
    }
    if (mousePressed && sys.profileClick == true) {
      menuNo = 3;
      sys.profileClick = false;
    }
  }

  void profile() {
    Survivor character =  sys.s.get(sys.survNo);
    background(lightGrey);
    rectMode(CORNER);
    fill(100);
    rect(0, center-30, w, h);
    rect(50, 100, 300, 300);
    sys.idisp();
    textSize(36);
    back.colorHighlight();
    text("Back", 1100, 75);
    fill(50);
    text("INTERACTIONS", 675, 75);

    sanUp.display();
    sanUp.colorHighlight();
    text("It's going to be okay...", 675, 175);
    fill(50);

    trustUp.display();
    trustUp.colorHighlight();
    text("You and me, till the end...", 675, 275);
    fill(50);

    drama.display();
    drama.colorHighlight();
    text("Someone's plotting against you", 675, 375);
    fill(50);


    sys.getName(character, 115, 75);
    text("Health: " + character.health, 250, 140);
    text("Sanity: "  + character.sanity, 250, 240);
    text("Trust: "  + character.trust, 250, 340);
    fill(200);
    text("View Relationships", 600, 600);
    prev.colorHighlight();
    text("Previous", 100, 600);
    next.colorHighlight();
    text("Next", 1100, 600);
    if (mousePressed && !lock) {
      if (back.mouseOver) {
        menuNo = 2;
      }
      if (prev.mouseOver) {
        sys.survNo --;
      }

      if (next.mouseOver) {
        sys.survNo ++;
      }
      lock = true;
    }
    if (!mousePressed) {
      lock = false;
    }
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

  //    //The Relationship Pages: These lines of codes show the status between the various survivors. The higher the number, the closer the relationship (WORK IN PROGRESS)
  //    background(100);
  //    textSize(36);
  //    //At the top of the page, the name of the selected Survivor
  //    text(survNames[screenNumber-11] + "'s Relationships", 50, 75);
  //    //Setup for Survivor 1
}