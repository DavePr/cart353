class Game_Screen {
  //CLASS PROPERTIES//
  //MENU CYCLING
  int menuNo;
  //INTERACTIONS
  int interactLeft;
  //FOOD
  int food;
  //IF A CHARACTER HAS BEEN KILLED TODAY
  boolean killedToday;
  //IF A TARGET HAS BEEN CHOSEN FOR SACRIFICE
  boolean targetAcquired;
  //TIME BASED COUNTER
  int counter;
  //FOOD DISTRIBUTION TIME
  boolean feedingTime;
  //SCORE//
  //SCORE TRACKER
  int oldScore;
  //CURRENT SCORE
  int score;
  //SYSTEM
  SurvivorSystem sys;
  //BUTTONS
  //START 
  Button start;
  //BACK 
  Button back;
  //PREVIOUS SURVIVOR 
  Button prev;
  //NEXT SURVIVOR 
  Button next;
  //VIEW RELATIONSHIP 
  Button viewR;
  //SANITY UP 
  Button sanUp;
  //TRUST UP 
  Button trustUp;
  //SABOTAGE RELATION 
  Button drama;
  //GUN CLICKED
  Button gunMode;
  //SHOOT TO KILL
  Button shoot;
  //MOVE ON TO FEEDING
  Button end;
  //DO NOT SHOOT
  Button regret;
  //MOVE TO PROGRESSION SCREEN
  Button endDay;
  //PROGRESS TO NEXT DAY
  Button moveOn;
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
    interactLeft = 3;
    dayNo = 1;
    menuNo = 0;
    oldScore = 0;
    score = 0;
    lightGrey = 155;
    darkGrey = 100;
    center =  ( (width/2) + (height/2) ) /2 ;
    w = width;
    h = height;
    food = 0;
    killedToday = false;
    targetAcquired = false;
    feedingTime = false;
    //BUTTONS
    start = new Button(600, 600, 150, 105, 255);
    back = new Button(1100, 75, 50, 50, 255);
    prev = new Button(100, 600, 125, 50, 255);
    viewR = new Button(615, 600, 350, 75, 255);
    next = new Button(1100, 600, 50, 50, 255);
    sanUp = new Button(675, 175, 500, 50, 255);
    trustUp = new Button(675, 275, 500, 50, 255);
    drama = new Button(675, 375, 500, 50, 255);
    gunMode = new Button(75, 575, 300, 150, 255);
    shoot = new Button (width/2-40, 300, 100, 125, 255);
    regret = new Button (width/2, 600, 100, 50, 255);
    pistol = new Gun(100, 600);
    end = new Button(1000, 625, 300, 150, 255);
    endDay = new Button(width/2, 600, 100, 50, 255);
    moveOn = new Button(width/2, 600, 200, 100, 255);
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
      relationPage();
    }
    if (menuNo == 5) {
      drama();
    }
    if (menuNo == 6) {
      gunMode();
    }
    if (menuNo == 7) {
      kill();
    }
    if (menuNo == 8) {
      progress();
    }
    if (menuNo == 9) {
      endUpdate();
    }
    sys.update();
    sys.updateRelations();
  }
  //START SCREEN
  void startup() {
    noStroke();
    //BACKGROUND
    background(darkGrey);
    textAlign(CENTER);
    textSize(72);
    fill(255);
    text("Quandary", 600, 300);
    textSize(36);
    //START BUTTON
    start.colorHighlight();
    text("Start", 600, 600);
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
    text("Here's where the intro goes", 590, 190);
    //NON BUTTON TRANSITION
    text("Press Any Key to Begin", 590, center);
    if (keyPressed) {
      menuNo = 2;
    }
  }
  //GROUP OVERVIEW 
  void group() {
    //BACKGROUND
    background(lightGrey);
    textAlign(CORNER);
    textSize(36);
    fill(255);
    if (!feedingTime) {
      text("Day " + dayNo, 25, 50);
      text("Interactions Left: " + interactLeft, 850, 50);
      textAlign(CENTER);
      text("Food: " + food, width/2, 50);
    } 
    if (feedingTime) {
      textAlign(CENTER);
      text("Food: " + food, width/2, 50);
      fill(200, 0, 0);
      text("Feeding Time", width/2, 150);
    }
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
      if (feedingTime) {
        text(character.health, character.x, 250);
      }
    }
    //THE QUANDARY: DEATH OR NO DEATH
    if (interactLeft == 0 && !feedingTime) {
      pistol.display();
      gunMode.highlight();
      textSize(30);
      end.colorHighlight();
      if (!killedToday) {
        text("No one dies today", 1000, 625);
      } else {
        text("No more deaths for today", 1000, 625);
      }
    }
    if (feedingTime && food == 0) {
      endDay.colorHighlight();
      text("End Day " + dayNo, width/2, 600);
    }
    //BUTTON/TRANSITION
    if (mousePressed) {
      for (Button character : sys.b) {
        if (!lock && character.mouseOver) {
          if (!feedingTime) {
            menuNo = 3;
          } else if (feedingTime) {
            if (food > 0) {
              Survivor chosen = sys.s.get(sys.survNo);
              if (chosen.isAlive && chosen.isGone == false) {
                food--;
                chosen.health += 5;
                chosen.sanity ++;
                chosen.trust ++;
                chosen.hasBeenfed = true;
              }
            }
          }
        }
      }
      //GUN MODE
      if (!lock && gunMode.mouseOver) {
        menuNo = 6;
      }
      //END DAY BUTTON
      if (!lock && end.mouseOver) {
        feedingTime = true;
      }
      if (!lock && endDay.mouseOver) {
        menuNo = 8;
      }
      lock = true;
    }
    if (!mousePressed) {
      lock = false;
    }
  }
  //PROFILE PAGE
  void profile() {
    //PROFILE SELECTION
    Survivor character =  sys.s.get(sys.survNo);
    //BACKGROUND
    background(lightGrey);
    rectMode(CORNER);
    fill(100);
    rect(0, 460, w, h);
    rect(50, 100, 300, 300);
    //SURVIVOR SYSTEM, INDIVIDUAL DISPLAY METHOD
    sys.idisp();
    //INTERACTION BUTTONS
    fill(50);
    text("INTERACTIONS LEFT: " + interactLeft, 670, 75);
    //BACK BUTTON
    textSize(36);
    back.colorHighlight();
    text("Back", 1100, 75);
    if (character.isAlive && character.isGone == false) {
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
      //CHARACTER SPEECH
      fill(25);
      sys.getName(character, 100, 525);
      text("says: ", 225, 525);
      text(character.says, 600, 525);
    } else {
      fill(200);
      text(character.causeofDeath, 600, 600);
    }
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
        if (sys.survNo > 0) {
          sys.survNo --;
        }
      }
      //NEXT PROFILE BUTTON
      if (next.mouseOver) {
        if (sys.survNo < sys.groupSize-1) {
          sys.survNo ++;
        }
      }
      //VIEW RELATIONSHIP BUTTON
      if (viewR.mouseOver) {
        menuNo = 4;
      }
      //EVERYTHING IS GONNA BE OK BUTTON
      if (sanUp.mouseOver) {
        if (interactLeft > 0) {
          character.sanityT();
          interactLeft --;
        }
      }
      //YOU AND ME TILL THE END BUTTON
      if (trustUp.mouseOver) {
        if (interactLeft > 0) {
          character.trustT();
          interactLeft --;
        }
      }
      //BACKTALK BUTTON
      if (drama.mouseOver) {
        menuNo = 5;
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
  //CHARACTER RELATIONS PAGE
  void relationPage() {
    //LOCAL VARIABLES
    int y = 100;
    //CHARACTER SELECTION: 
    Survivor character =  sys.s.get(sys.survNo);
    //BACKGROUND
    background(lightGrey);
    rectMode(CORNER);
    fill(100);
    rect(0, 460, w, h);
    rect(50, 100, 300, 300);
    rect(400, 0, 650, h);
    //CHARACTER DISPLAY AND INFO
    sys.idisp();
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
    //BACK BUTTON
    textSize(36);
    back.colorHighlight();
    text("Back", 1125, 75);
    //RELATIONS
    for (int i = 0; i < sys.groupSize; i ++ ) {
      if (i != sys.survNo) {
        fill(25);
        text(sys.relationStatus[sys.survNo][i], 850, y);
        sys.getName(sys.s.get(i), 550, y);
        y += 50;
      }
    }
    //IF THE MOUSE IS BEING PRESSED
    if (mousePressed && !lock) {
      //BACK BUTTON 
      if (back.mouseOver) {
        menuNo = 3;
      }
      //PREVIOUS PROFILE BUTTON
      if (prev.mouseOver) {
        if (sys.survNo > 0) {
          sys.survNo --;
        }
      }
      //NEXT PROFILE BUTTON
      if (next.mouseOver) {
        if (sys.survNo < sys.groupSize-1) {
          sys.survNo ++;
        }
      }
      lock = true;
    }
    //AFTER PRESS, UNLOCK BUTTONS
    if (!mousePressed) {
      lock = false;
    }
  }
  //RELATION SABOTAGE 
  void drama() {
    //LOCAL VARIABLES
    int y = 100;
    //CHARACTER SELECTION: 
    Survivor character =  sys.s.get(sys.survNo);
    //BACKGROUND
    background(lightGrey);
    rectMode(CORNER);
    fill(100);
    rect(0, 460, w, h);
    rect(50, 100, 300, 300);
    rect(400, 0, 650, h);
    //CHARACTER DISPLAY AND INFO
    sys.idisp();
    //CHARACTER PROFILE INFORMATION
    fill(50);
    sys.getName(character, 115, 75);
    text("Health: " + character.health, 250, 140);
    text("Sanity: "  + character.sanity, 250, 240);
    text("Trust: "  + character.trust, 250, 340);
    //BACK BUTTON
    textSize(36);
    back.colorHighlight();
    text("Back", 1125, 75);
    //QUESTION
    fill(25);
    text("Really? Who?", 700, 50);

    //RELATIONS
    for (int i = 0; i < sys.groupSize; i ++ ) {
      if (i != sys.survNo) {
        fill(25);
        text(sys.relationStatus[sys.survNo][i], 850, y);
        sys.dramaChoice.get(i).y = y;
        sys.dramaChoice.get(i).colorHighlight();
        sys.getName(sys.s.get(i), 550, y);
        y += 50;
      }
    }
    //IF THE MOUSE IS BEING PRESSED
    if (mousePressed && !lock) {

      for (int i = 0; i < sys.groupSize; i ++ ) {
        if (sys.dramaChoice.get(i).mouseOver) {
          if (interactLeft > 0) {
            interactLeft --;
            sys.relationT(sys.dramaChoice.get(i).charSelect);
            menuNo = 3;
          }
        }
      }
      //BACK BUTTON 
      if (back.mouseOver) {
        menuNo = 3;
      }
      lock = true;
    }
    //AFTER PRESS, UNLOCK BUTTONS
    if (!mousePressed) {
      lock = false;
    }
  }
  // KILL SCREEN
  void gunMode() {
    //BACKGROUND
    background(lightGrey);
    textAlign(CORNER);
    textSize(36);
    fill(255);
    rectMode(CORNER);
    fill(darkGrey);
    rect(0, h/2+75, w, h);
    //NARROW DOWN VIEW
    fill(0);
    rect(0, h/2+125, w, h);
    rect(0, 0, w, 125);
    //SURVIVOR SYSTEM, GROUP DISPLAY METHOD
    if (!targetAcquired) {
      //DISPLAY GROUP
      sys.gdisp();
      textAlign(CENTER);
      textSize(24);
      for (int i = 0; i < sys.groupSize; i++) {
        Survivor character = sys.s.get(i);
        sys.getName(character, character.x, 200);
      }
    } 
    if (targetAcquired) {
      Survivor target = sys.s.get(sys.survNo);
      shoot.highlight();
      sys.cdisp();
      fill(200, 0, 0);
      textAlign(CENTER);
      textSize(40);
      text(target.name, width/2, 200);
      fill(255);
      text("Spare me!", width/2, 600);
      regret.highlight();
    }
    //GUN AIM
    fill(200, 0, 0);
    ellipse(mouseX, mouseY, 10, 10);

    //BUTTONS
    if (mousePressed) {
      for (Button victim : sys.b) {
        if (!lock && victim.mouseOver) {
          targetAcquired = true;
        }
      }
      if (!lock && regret.mouseOver) {
        targetAcquired = false;
        regret.mouseOver = false;
        menuNo = 2;
      }
      if (!lock && shoot.mouseOver) {
        sys.death();
        targetAcquired = false;
        shoot.mouseOver = false;
        menuNo = 7;
      }
      lock = true;
    }
    if (!mousePressed) {
      lock = false;
    }
  }
  void kill() {
    killedToday = true;
    Survivor corpse = sys.s.get(sys.survNo);
    corpse.causeofDeath = "Took one for the team" ;
    if (counter == 0) {
      food += corpse.foodHarvested;
    }
    counter++;
    if (counter < 300) {
      rectMode(CORNER);
      fill(0);
      rect(0, 0, width, height);
    } else {
      menuNo = 2;
      counter = 0;
    }
  }
  //SCORE PROGRESSION SCREEN
  void progress() {
    println(oldScore);
    if (counter == 0) {
      oldScore = score;
    }
    background(50);
    textSize(40);
    textAlign(CENTER);
    fill(255);
    text("End of Day " + dayNo, width/2, 150);
    text("The group marches onward, searching for haven", width/2, height/2 -100);
    text("Score: " + oldScore, width/2, height/2);
    text("The land lays barren, and no food is found", width/2, height/2 +100);
    for (int i = 0; i < sys.s.size(); i ++) {
      if (counter < sys.s.size()) {
        Survivor character = sys.s.get(i);
        score += character.wellbeing;
        counter++;
      }
    }
    if (oldScore < score) {
      oldScore++;
    }
    moveOn.colorHighlight();
    text("Next Day", width/2, 600);
    if (mousePressed) {
      if (!lock && moveOn.mouseOver) {
        menuNo = 9;
      }
      lock = true;
    }
    if (!mousePressed) {
      lock = false;
    }
  }
  //END DAY METHOD (RESETS THE GAME FOR THE NEXT DAY)
  void endUpdate() {
    for (int i = 0; i < sys.s.size(); i++) {
      Survivor character = sys.s.get(i);
      if (character.isAlive && character.isGone == false) {
        if (character.hasBeenfed) {
          character.health -= 5;
        } else {
          character.health -= 20;
          character.sanity -= 10;
          character.trust -= 10;
        }
        if (character.health <= 0) {
          sys.survNo = i;
          sys.death();
          food ++;
          character.causeofDeath = "Died of Starvation";
        } else if (character.sanity <= 0) {
          sys.survNo = i;
          sys.death();
          food += character.foodHarvested;
          character.causeofDeath = "Couldn't take it anymore";
        } else if (character.trust <= 0) {
          sys.survNo = i;
          sys.ranAway();
          character.causeofDeath = "Ran Away";
        }
        character.hasBeenfed = false;
      }
    }
    interactLeft = 3;
    killedToday = false;
    targetAcquired = false;
    counter = 0;
    feedingTime = false;
    lock = false;
    dayNo ++;
    start.mouseOver = false;
    back.mouseOver = false;
    prev.mouseOver = false;
    next.mouseOver = false;
    viewR.mouseOver = false;
    sanUp.mouseOver = false;
    trustUp.mouseOver = false;
    drama.mouseOver = false;
    gunMode.mouseOver = false;
    shoot.mouseOver = false;
    end.mouseOver = false;
    regret.mouseOver = false;
    endDay.mouseOver = false;
    moveOn.mouseOver = false;
    menuNo = 2;
  }
  //END OF CLASS
}