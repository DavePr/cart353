class Survivor {
  //CLASS PROPERTIES//
  //CHARACTER POSITIONING
  int x;
  int y;
  //CHARACTER COLORATION
  float r ;
  float g ;
  float b ;
  color skinColor;
  color shirtColor;
  color pantsColor;
  //COLOR ARRAY
  int[] randomC = new int[6];
  //CHARACTER STATISTICS
  int health;
  int sanity;
  int trust;
  int wellbeing;
  boolean isAlive;
  boolean isGone;
  int foodHarvested;
  boolean hasBeenfed;
  //CHARACTER'S GENDER
  int rollGend;
  String gender;
  //NAME
  String name; 
  //SPEECH
  String says;
  //DEATH
  String causeofDeath;
  //ROLE
  String role;
  //CONSTRUCTOR
  Survivor(int newX, int newY) {
    //FILL THE COLOR ARRAY
    for (int i=0; i<5; i++) {
      randomC[i] = int(random(255));
    }
    //CHARACTER POSITIONING
    x = newX;
    y = newY;
    //CHARACTER COLORATION
    //SKIN RGB
    r = 252;
    g = 210;
    b = 176;
    skinColor = color(r, g, b);
    shirtColor = color(randomC[0], randomC[1], randomC[2]);
    pantsColor = color(randomC[3], randomC[4], randomC[5]);
    //CHARACTER STARTING STATISTICS
    health = int (random(25, 75));
    sanity = int (random(25, 75));
    trust = int (random(25, 75));
    isAlive = true;
    isGone = false;
    hasBeenfed = false;
    //CHARACTER'S GENDER
    rollGend = int(random(10));
    if (rollGend < 5) {
      gender = "Man";
    } else {
      gender = "Woman";
    }
    //WELLBEING
    wellbeing = health + sanity + trust;
    //SPEECH
    says = "Hello";
    //ROLE
    getJob();
  }
  //CHARACTER DISPLAY METHOD
  void display() {
    noStroke();
    rectMode(CENTER);
    if (isAlive && !isGone) {
      //HAIR COLOR//
      fill(0);
      //HAIR// 
      if ( gender == "Man" ) {
        ellipse(x, y-80, 55, 55);
      } else if ( gender == "Woman" ) {
        rect(x, y-75, 45, 45);
      }
      //SKIN COLOR
      fill(skinColor);
      //LEFT EAR
      ellipse(x-12, y-70, 15, 15);
      //RIGHT EAR
      ellipse(x+12, y-70, 15, 15);
      //FACE
      rect(x, y-60, 25, 50);
      //EYE COLOR
      fill(0);
      //LEFT EYE
      ellipse(x-5, y-75, 2, 2);
      //RIGHT EYE
      ellipse(x+5, y-75, 2, 2);
      //SHIRT COLOR//
      fill(shirtColor);
      if (gender == "Man") {
        //CHEST
        rect(x, y, 50, 75);
        //LEFT ARM
        rect(x-35, y-15, 15, 50);
        //RIGHT ARM
        rect(x+35, y-15, 15, 50);
      } else if ( gender == "Woman" ) {
        //CHEST
        rect(x, y, 40, 75);
        //LEFT ARM
        rect(x-30, y-15, 10, 50);
        //RIGHT ARM
        rect(x+30, y-15, 10, 50);
      }
      //SHOULDER
      rect(x, y-40, 75, 10);
      //SKIN COLOR
      fill(skinColor);
      //LEFT HAND
      rect(x-32, y+15, 10, 10);
      //RIGHT HAND
      rect(x+32, y+15, 10, 10);
      //PANTS COLOR
      fill(pantsColor);
      //LEFT LEG
      rect(x-15, y+55, 15, 50);
      //RIGHT LEG
      rect(x+15, y+55, 15, 50);
      //HIPS
      if (gender == "Man") {
        rect(x, y+40, 50, 20);
      } else if ( gender == "Woman" ) {
        quad(x-40, y+55, x-20, y+20, x+20, y+20, x+40, y+55);
      }
      //SHOE COLOR
      fill(50);
      //LEFT SHOE
      rect(x-20, y+80, 25, 8);
      //RIGHT SHOE
      rect(x+20, y+80, 25, 8);
    }
  }
  //DISPLAY METHOD FOR PROFILE PAGE
  void individual() {
    noStroke();
    rectMode(CENTER);
    if (isAlive && !isGone) {
      //HAIR COLOR//
      fill(0);
      //HAIR// 
      if ( gender == "Man" ) {
        ellipse(100, y-80, 55, 55);
      } else if ( gender == "Woman" ) {
        rect(100, y-75, 45, 45);
      }
      //SKIN COLOR
      fill(skinColor);
      //LEFT EAR
      ellipse(100-12, y-70, 15, 15);
      //RIGHT EAR
      ellipse(100+12, y-70, 15, 15);
      //FACE
      rect(100, y-60, 25, 50);
      //EYE COLOR
      fill(0);
      //LEFT EYE
      ellipse(100-5, y-75, 2, 2);
      //RIGHT EYE
      ellipse(100+5, y-75, 2, 2);
      //SHIRT COLOR//
      fill(shirtColor);
      if (gender == "Man") {
        //CHEST
        rect(100, y, 50, 75);
        //LEFT ARM
        rect(100-35, y-15, 15, 50);
        //RIGHT ARM
        rect(100+35, y-15, 15, 50);
      } else if ( gender == "Woman" ) {
        //CHEST
        rect(100, y, 40, 75);
        //LEFT ARM
        rect(100-30, y-15, 10, 50);
        //RIGHT ARM
        rect(100+30, y-15, 10, 50);
      }
      //SHOULDER
      rect(100, y-40, 75, 10);
      //SKIN COLOR
      fill(skinColor);
      //LEFT HAND
      rect(100-32, y+15, 10, 10);
      //RIGHT HAND
      rect(100+32, y+15, 10, 10);
      //PANTS COLOR
      fill(pantsColor);
      //LEFT LEG
      rect(100-15, y+55, 15, 50);
      //RIGHT LEG
      rect(100+15, y+55, 15, 50);
      //HIPS
      if (gender == "Man") {
        rect(100, y+40, 50, 20);
      } else if ( gender == "Woman" ) {
        quad(100-40, y+55, 100-20, y+20, 100+20, y+20, 100+40, y+55);
      }
      //SHOE COLOR
      fill(50);
      //LEFT SHOE
      rect(100-20, y+80, 25, 8);
      //RIGHT SHOE
      rect(100+20, y+80, 25, 8);
    }
  }
  void center() {
    noStroke();
    rectMode(CENTER);
    if (isAlive && !isGone) {
      //HAIR COLOR//
      fill(0);
      //HAIR// 
      if ( gender == "Man" ) {
        ellipse(width/2, y-80, 55, 55);
      } else if ( gender == "Woman" ) {
        rect(width/2, y-75, 45, 45);
      }
      //SKIN COLOR
      fill(skinColor);
      //LEFT EAR
      ellipse(width/2-12, y-70, 15, 15);
      //RIGHT EAR
      ellipse(width/2+12, y-70, 15, 15);
      //FACE
      rect(width/2, y-60, 25, 50);
      //EYE COLOR
      fill(0);
      //LEFT EYE
      ellipse(width/2-5, y-75, 2, 2);
      //RIGHT EYE
      ellipse(width/2+5, y-75, 2, 2);
      //SHIRT COLOR//
      fill(shirtColor);
      if (gender == "Man") {
        //CHEST
        rect(width/2, y, 50, 75);
        //LEFT ARM
        rect(width/2-35, y-15, 15, 50);
        //RIGHT ARM
        rect(width/2+35, y-15, 15, 50);
      } else if ( gender == "Woman" ) {
        //CHEST
        rect(width/2, y, 40, 75);
        //LEFT ARM
        rect(width/2-30, y-15, 10, 50);
        //RIGHT ARM
        rect(width/2+30, y-15, 10, 50);
      }
      //SHOULDER
      rect(width/2, y-40, 75, 10);
      //SKIN COLOR
      fill(skinColor);
      //LEFT HAND
      rect(width/2-32, y+15, 10, 10);
      //RIGHT HAND
      rect(width/2+32, y+15, 10, 10);
      //PANTS COLOR
      fill(pantsColor);
      //LEFT LEG
      rect(width/2-15, y+55, 15, 50);
      //RIGHT LEG
      rect(width/2+15, y+55, 15, 50);
      //HIPS
      if (gender == "Man") {
        rect(width/2, y+40, 50, 20);
      } else if ( gender == "Woman" ) {
        quad(width/2-40, y+55, width/2-20, y+20, width/2+20, y+20, width/2+40, y+55);
      }
      //SHOE COLOR
      fill(50);
      //LEFT SHOE
      rect(width/2-20, y+80, 25, 8);
      //RIGHT SHOE
      rect(width/2+20, y+80, 25, 8);
    }
  }
  //JOB ASSIGNEMENT METHOD
  void getJob() {
    int rng = int(random(10));
    if (rng <= 5) {
      role = "Survivor";
    }
    if (rng == 6) {
      role = "Forager";
    }
    if (rng == 7) {
      role = "Butcher";
    }
    if (rng == 8) {
      role = "Doctor";
    }
    if (rng == 9) {
      role = "Psychologist";
    }
    if (rng == 10) {
      role = "Therapist";
    }
  }
  //COLOR CHANGE METHOD
  //If the survivor's wellbeing value goes below 100, his color palette changes to a uniform, monochromatic gray
  //Will now also change his introductory message and track overall wellbeing
  void adjustColor() {
    wellbeing = health + sanity + trust;
    if (wellbeing < 100) {
      skinColor = color(225, 225, 225);
      shirtColor = color(150, 150, 150);
      pantsColor = color(125, 125, 125);
      if (isAlive &&  !isGone) {
        says = "Don't bother me...";
      } else {
        says = " ";
      }
    }
  }
  //SANITY TEST METHOD
  void sanityT() {
    int rng = int(random(0, 100));
    if (rng +trust >= 100) {
      sanity += 10;
      says = "Thanks" ;
    } else {
      if (trust < 50 && sanity < 50) {
        says = "Oh god, I'm next, aren't I?";      
        trust -= 5;     
        sanity -= 5;
      } else if ( trust < 50) {
        says = "Yeah right...";  
        trust -= 5;
      } else if ( sanity < 50) {
        says = "What's the point...";
        sanity -= 5;
      } else {
        says = "Okay...";
      }
    }
  }
  //TRUST TEST METHOD
  void trustT() {
    int rng = int(random(0, 100));
    if (rng + sanity >= 100) {
      trust += 10;
      says = "Thanks" ;
    } else {
      if (trust < 50 && sanity < 50) {
        says = "Oh god, I'm next, aren't I?";
        trust -= 5;
        sanity -= 5;
      } else if ( trust < 50) {
        says = "Yeah right...";
        trust -= 5;
      } else if ( sanity < 50) {
        says = "What's the point...";
        sanity -= 5;
      } else {
        says = "Okay...";
      }
    }
  }
  //DEATH METHOD
  void dies() {
    health = 0;
    trust = 0;
    sanity = 0;
  }
  //END OF CLASS
}