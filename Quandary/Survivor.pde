class Survivor {
  //Properties//
  //Character Positioning
  int x;
  int y;
  //Character Coloration
  float r ;
  float g ;
  float b ;
  color skinColor;
  color shirtColor;
  color pantsColor;
  //Randomly Rolled Colors
  //Red Value Shirt
  int random1 = int(random(255));
  //Green Value Shirt
  int random2 = int(random(255));
  //Blue Value Shirt
  int random3 = int(random(255));
  //Red Value Pants
  int random4 = int(random(255));
  //Green Value Pants
  int random5 = int(random(255));
  //Blue Value Pants
  int random6 = int(random(255));
  //Character's Game Statistics
  int health;
  int sanity;
  int trust;
  int wellbeing;
  //Rolled Int that will determine if the character is the male or female model
  int rollGend;
  //Constructor//
  Survivor(int newX, int newY) {
    x = newX;
    y = newY;
    r = 252;
    g = 210;
    b = 176;
    skinColor = color(r, g, b);
    shirtColor = color(random1, random2, random3);
    pantsColor = color(random4, random5, random6);
    health = 50;
    sanity = 50;
    trust = 50;
    //Gend 1 = Male, Gend 2 = Female
    rollGend = int(random(10));
    wellbeing = health + sanity + trust;
  }
  //Character Method//
  void display() {
    noStroke();
    rectMode(CENTER);
    //HEAD//
    fill(0);
    //HAIR// 
    if (rollGend < 5) {
      ellipse(x, y-80, 55, 55);
    } else {
      rect(x, y-75, 45, 45);
    }
    fill(skinColor);
    //Left Ear
    ellipse(x-12, y-70, 15, 15);
    //Right Ear
    ellipse(x+12, y-70, 15, 15);
    //Face
    rect(x, y-60, 25, 50);
    fill(0);
    //Eyes
    ellipse(x-5, y-75, 2, 2);
    ellipse(x+5, y-75, 2, 2);
    //----//
    //BODY//
    fill(shirtColor);
    if (rollGend < 5) {
      //Chest
      rect(x, y, 50, 75);
      //Left Arm
      rect(x-35, y-15, 15, 50);
      //Right Arm
      rect(x+35, y-15, 15, 50);
    } else {
      //Chest
      rect(x, y, 40, 75);
      //Left Arm
      rect(x-30, y-15, 10, 50);
      //Right Arm
      rect(x+30, y-15, 10, 50);
    }
    //Shoulder
    rect(x, y-40, 75, 10);
    //Left-Right Hand
    fill(skinColor);
    rect(x-32, y+15, 10, 10);
    rect(x+32, y+15, 10, 10);
    //Legs
    fill(pantsColor);
    rect(x-15, y+55, 15, 50);
    rect(x+15, y+55, 15, 50);
    //L'Entrejambe
    if (rollGend < 5) {
      rect(x, y+40, 50, 20);
    } else {
      quad(x-40, y+55, x-20, y+20, x+20, y+20, x+40, y+55);
    }
    //Shoes
    fill(50);
    rect(x-20, y+80, 25, 8);
    rect(x+20, y+80, 25, 8);
  }
  //If the Survivor is not feeling well, his color scheme chanegs to a monochromatic grey
  void adjustColor() {
    if (wellbeing < 100) {
      skinColor = color(225, 225, 225);
      shirtColor = color(150, 150, 150);
      pantsColor = color(125, 125, 125);
    }
  } 
  }