class Game_Screen {

  //CLASS PROPERTIES//
  int menuNo;
  int interactLeft;

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

  //BUTTON LOCK
  boolean lock;

  //GUN
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

    interactLeft = 2;
    dayNo = 1;
    menuNo = 0;
    lightGrey = 155;
    darkGrey = 100;
    center =  ( (width/2) + (height/2) ) /2 ;
    w = width;
    h = height;

    //BUTTONS
    start = new Button(center+25, center-35, 150, 105, 255);
    back = new Button(1100, 75, 50, 50, 255);
    prev = new Button(100, 600, 125, 50, 255);
    viewR = new Button(center+125, 600, 350, 75, 255);
    next = new Button(1100, 600, 50, 50, 255);
    sanUp = new Button(675, 175, 500, 50, 255);
    trustUp = new Button(675, 275, 500, 50, 255);
    drama = new Button(675, 375, 500, 50, 255);
    pistol = new Gun(100, 600);

    //BUTTON LOCK
    lock = false;

    //SURVIVOR SYSTEM
    sys = new SurvivorSystem();
    sys.spawn();
  }

  //GAME RUN METHOD
  void run() {
    if (menuNo == 0) {
      startup();
    }  
    if (menuNo == 1) {
      intro();
    }  
    if (menuNo == 2) {
      group();
    }  
    if (menuNo == 3) {
      profile();
    }  
    if (menuNo == 4) {
      profile();
    }
  }

  //START SCREEN

  void startup() {

    //BACKGROUND
    background(darkGrey);
    textAlign(CENTER);
    textSize(72);
    fill(255);
    text("Quandary", center + 100, center - 300);
    textSize(36);

    //START BUTTON
    start.colorHighlight();
    text("Start", center + 100, center);
    if (mousePressed && start.mouseOver) {
      menuNo = 1;
    }
  }

  //INTRODUCTION/INSTRUCTIONS

  void intro() {

    //BACKGROUND
    background(darkGrey);
    textAlign(CENTER);
    textSize(36);
    fill(255);
    text("Here's where the intro goes", center +100, center-300);

    //NON BUTTON TRANSITION
    text("Press Any Key to Begin", center +100, center);
    if (keyPressed) {
      menuNo = 2;
    }
  }

  void group() {

    //BACKGROUND
    background(lightGrey);
    textAlign(CORNER);
    textSize(36);
    fill(255);
    text("Day " + dayNo, 25, 50);
    rectMode(CORNER);
    fill(darkGrey);
    rect(0, h/2+75, w, h);

    //SURVIVOR SYSTEM, GROUP DISPLAY METHOD
    sys.gdisp();
    textAlign(CENTER);
    textSize(24);
    for (int i = 0; i < sys.groupSize; i++) {
      Survivor character = sys.s.get(i);
      sys.getName(character, character.x, 200);
    }

    //BUTTON/TRANSITION
    if (mousePressed && sys.profileClick == true) {
      menuNo = 3;
      sys.profileClick = false;
    }
  }

  void profile() {

    //PROFILE SELECTION
    Survivor character =  sys.s.get(sys.survNo);

    //BACKGROUND
    background(lightGrey);
    rectMode(CORNER);
    fill(100);
    rect(0, center-30, w, h);
    rect(50, 100, 300, 300);

    //SURVIVOR SYSTEM, INDIVIDUAL DISPLAY METHOD
    sys.idisp();

    //BACK BUTTON
    textSize(36);
    back.colorHighlight();
    text("Back", 1100, 75);

    //INTERACTION BUTTONS
    fill(50);
    text("INTERACTIONS LEFT: " + interactLeft, 670, 75);


    //SANITY BOOST BUTTON
    sanUp.colorHighlight();
    text("It's going to be okay...", 675, 175);

    //TRUST BOOST BUTTON
    fill(50);
    trustUp.colorHighlight();
    text("You and me, till the end...", 675, 275);

    //RELATION DOWN BUTTON
    fill(50);
    drama.colorHighlight();
    text("Someone's plotting against you", 675, 375);

    //RELATIONSHIP BUTTON
    fill(200);
    viewR.colorHighlight();
    text("View Relationships", 600, 600);


    //CHARACTER PROFILE INFORMATION
    fill(50);
    sys.getName(character, 115, 75);
    text("Health: " + character.health, 250, 140);
    text("Sanity: "  + character.sanity, 250, 240);
    text("Trust: "  + character.trust, 250, 340);


    //PROFILE CYCLING BUTTONS
    fill(200);
    prev.colorHighlight();
    text("Previous", 100, 600);
    fill(200);
    next.colorHighlight();
    text("Next", 1100, 600);

    //IF THE MOUSE IS PRESSED...
    if (mousePressed && !lock) {

      //BACK BUTTON 
      if (back.mouseOver) {
        menuNo = 2;
      }
      //PREVIOUS PROFILE BUTTON
      if (prev.mouseOver) {
        sys.survNo --;
      }
      //NEXT PROFILE BUTTON
      if (next.mouseOver) {
        sys.survNo ++;
      }

      if (viewR.mouseOver) {
      }

      if (sanUp.mouseOver) {
      }

      if (trustUp.mouseOver) {
      }

      if (drama.mouseOver) {
      }
      //BUTTON LOCK
      lock = true;
    }
    //AFTER PRESS, UNLOCK BUTTONS
    if (!mousePressed) {
      lock = false;
    }

    //END OF PROFILE
  }

void relationPage() {
  
  //CHARACTER SELECTION: 
  Survivor character =  sys.s.get(sys.survNo);
  
  //BACKGROUND
    background(lightGrey);
    rectMode(CORNER);
    fill(100);
    rect(0, center-30, w, h);
    rect(50, 100, 300, 300);
  
}

  /* Outline for Game Screens
   MAIN MENU/STARTING SCREEN    DONE
   INTRODUCTION PAGE            DONE
   GROUP OVERVIEW PAGE          DONE
   SURVIVOR PROFILE             DONE
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