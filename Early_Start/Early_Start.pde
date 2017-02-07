float r = 252;
float g = 210;
float b = 176;
//float r = 225;
//float g = 225;
//float b = 225;


void setup() {
  background(155);
  size(750, 750); 
  noStroke();
  rectMode(CENTER);
}

void draw() {
  color skinColor = color(r, g, b);
  //HEAD//
  fill(0);
  //HAIR// 

  //Hair Model 1: Small Afro
  ellipse(width/2, 50, 50, 50);

  //Hair model 2: Big Afro
  //ellipse(width/2, 55, 75, 75);

  //Hair Model 3: The Square
  //rect(width/2, 60, 50, 50);

  //Hair Model 4: The Square, but lower.
  //rect(width/2, 65, 50, 50);

  //Hair Model 5: Bald
  //fill(skinColor);
  //ellipse(width/2, 55, 25, 25);

  //Hair Model 6: Mad Scientist
  //triangle(width/2-30, 50,width/2+30,50,width/2,75);
  //fill(skinColor);
  //ellipse(width/2, 55, 25, 25);

  //Hair Model 7: Reverse Triangle
  //triangle(width/2-30, 35,width/2+30,35,width/2,75);





  fill(skinColor);
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
  fill(200, 200, 255);
  //Chest
  rect(width/2, 135, 50, 75);
  //Left Arm
  rect(width/2-32, 130, 10, 50);
  //Right Arm
  rect(width/2+32, 130, 10, 50);
  //Shoulder(?)
  rect(width/2, 105, 75, 10);

  //Left-Right Hand
  fill(skinColor);
  rect(width/2-32, 160, 10, 10);
  rect(width/2+32, 160, 10, 10);

  //Legs
  fill(200, 200, 255);
  rect(width/2-15, 200, 15, 50);
  rect(width/2+15, 200, 15, 50);
  //L'Entrejambe (?)
  rect(width/2, 185, 50, 20);
  //Shoes
  fill(50);
  rect(width/2-20, 230, 25, 8);
  rect(width/2+20, 230, 25, 8);
  //The Gray Machine
  //if (r > 225) {
  //  r -= 0.05; 
  //}
  //if (g < 225) {
  //  g += 0.03; 
  //}
  //if (b < 225) {
  //  b += 0.5; 
  //}
}