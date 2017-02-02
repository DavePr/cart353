//Import Libraries, Capture and Random are called, global variable of xoff is given
import processing.video.*;
import java.util.*;
Capture video;
Random generator;
float xoff = 0.0;

//Objects are instantiated.
void setup() {
  size(500, 500);
  generator = new Random();
  video = new Capture(this, 320, 240);
  video.start();
}

void draw() {


  //Pure Randomness
  //This segment randomly generates a new color and opacity for the video 
  float red = random(255);
  float green = random(255);
  float blue = random(255);
  float opac = random(500);
  tint(red, green, blue, opac);

  //Gaussian
  //Here the x position and y position of the camera are randomly generated using Gaussian. This will make the camera jitter in a diagonal fashion
  float num = (float) generator.nextGaussian();
  float mean = 0;
  float sd = 500;
  float xPos = sd * num + mean;
  float yPos = sd * num + mean;
  //To cover the rest of screen, a kick value is randomly determined. This number will be added to yPos, allowing the camera to move in a more circular fashion.
  float kick = random(-300, 300);


  //2D Perlin 
  //Here, a noise square is drawn in the middle of the screen using Perlin noise and pixels
  loadPixels();
  for (int x = 150; x < 350; x++) {
    // For every xoff, start yoff at 0.
    float yoff = 0.0; //[bold]

    for (int y = 150; y < 350; y++) {
      // Use xoff and yoff for noise().
      float bright = map(noise(xoff, yoff), 0, 1, 0, 255); //[bold]
      // Use x and y for pixel location.
      pixels[x+y*width] = color(bright);
      // Increment yoff.
      yoff += 0.01; //[bold]
    }
    // Increment xoff.
    xoff += 0.01;  //[bold]
  }
  updatePixels();
  if (video.available()) {
    video.read();
  }
  imageMode(CENTER);
  image(video, xPos, yPos+kick);
}