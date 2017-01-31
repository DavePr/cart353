float g = 210;
float b = 176;
void setup() {
  background(255);
  size(250, 250); 
  noStroke();
  rectMode(CENTER);
}

void draw() {
  //HEAD//
  fill(0);
  //Hair
  ellipse(width/2, 50, 50, 50);
  fill(252, g, b);
  //Left Ear
  ellipse(width/2-12, 70, 15, 15);
  //Right Ear
  ellipse(width/2+12, 70, 15, 15);
  //Face
  rect(width/2, 75, 25, 50);
  fill(0);
  //Eyes
  ellipse(width/2-5, 65, 2, 2);
  ellipse(width/2+5, 65, 2, 2);
  //----//
  //BODY//
  fill(200,200,255);
  //Chest
  rect(width/2,135,50,75);
  //Left Arm
  rect(width/2-35,130,10,50);
}