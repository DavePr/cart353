import java.io.File;
import java.util.Iterator;

Game_Screen Game;

void setup() {
  size(1200, 750);
  Game = new Game_Screen();
}
void draw() {
  Game.run();
}