class SurvivorSystem {
  //CLASS PROPERTIES
  //ARRAY SIZE
  int groupSize;
  //ARRAYLISTS
  //SURVIVORS
  ArrayList<Survivor> s;
  //BUTTONS
  ArrayList<Button> b;
  ArrayList<Button> dramaChoice;
  //RELATIONSHIP 2D ARRAYS
  int[][] relationship;
  String[][] relationStatus;
  //LIST OF POSSIBLE NAMES
  String[] nameList;
  //IF THE NAME IS TAKEN, BOOLEAN
  boolean[] nameFree;
  //SURVIVOR NUMBER//TARGETED SURVIVOR
  int survNo;
  //CHARACTER POSITION
  int xChar;
  int yChar;
  //HOW MANY SURVIVORS ARE LEFT
  int survivorsLeft;
  boolean gameOver;
  //CONSTRUCTOR
  SurvivorSystem() {
    s =new ArrayList<Survivor>();
    b = new ArrayList<Button>();
    dramaChoice = new ArrayList<Button>();
    nameList = new String[20];
    nameFree = new boolean[20];
    groupSize = 11;
    survivorsLeft = groupSize;
    gameOver = false;
    relationship = new int[11][11];
    relationStatus = new String[11][11];
    for (int i = 0; i < 20; i++) {
      nameFree[i] = true;
    }
  }
  //GENERATION METHOD
  void spawn() {
    xChar = 100;
    yChar = 370;
    for (int i = 0; i < groupSize; i++) {
      s.add(new Survivor(xChar, yChar));
      b.add(new Button(xChar, yChar, 70, 150, 255));
      dramaChoice.add(new Button(550, 0, 100, 50, 255));
      dramaChoice.get(i).charSelect = i;
      xChar += 100;
    }
    giveNames();
    groupRelations();
  }
  //GROUP DISPLAY METHOD
  void gdisp() {
    for (Survivor character : s) {
      character.display();
    }
    for (int i = 0; i< groupSize; i++) {
      Button select = b.get(i);
      select.highlight();
      if (select.mouseOver) {
        survNo = i;
      }
    }
  }
  //INDIVIDUAL DISPLAY METHOD
  void idisp() {
    Survivor profile = s.get(survNo);
    profile.individual();
  }
  //CENTER DISPLAY METHOD
  void cdisp() {
    Survivor profile = s.get(survNo);
    profile.center();
  }
  //UPDATE METHOD  
  void update() {
    Iterator<Survivor> it = s.iterator();
    while (it.hasNext()) {
      Survivor s = it.next();
      s.adjustColor();
    }
  }
  //RELATIONSHIP METHOD
  void groupRelations() {
    for (int i = 0; i < s.size(); i++) {
      for (int j = i+1; j < s.size(); j++) {
        relationship[i][j] = int(random(-25, 100));
        relationship[j][i] = relationship[i][j];
      }
    }
  }
  //RELATIONSHIP : DATA TO TEXT 
  void updateRelations() {
    for (int i = 0; i < s.size(); i++) {
      for (int j = i+1; j < s.size(); j++) {
        if (relationship[i][j] <= 0 ) {
          relationStatus[i][j] = " Unfriendly ";
          relationStatus[j][i] = " Unfriendly ";
        }  
        if (relationship[i][j] > 0 && relationship[i][j] <= 25 ) {
          relationStatus[i][j] = " Distant";
          relationStatus[j][i] = " Distant ";
        }  
        if (relationship[i][j] > 25 && relationship[i][j] <= 50 ) {
          relationStatus[i][j] = " Friendly";
          relationStatus[j][i] = " Friendly ";
        }  
        if (relationship[i][j] > 50 && relationship[i][j] <= 75 ) {
          relationStatus[i][j] = " Close";
          relationStatus[j][i] = " Close ";
        }  
        if (relationship[i][j] > 75 && relationship[i][j] <= 100 ) {
          relationStatus[i][j] = " Intimate";
          relationStatus[j][i] = " Intimate ";
        }
        if (relationship[i][j] > 100 ) {
          relationStatus[i][j] = " Dead";
          relationStatus[j][i] = " Dead ";
        }
      }
    }
  }
  //DOWN RELATIONSHIP METHOD
  void relationT(int targSurv) {
    Survivor character = s.get(survNo);
    int rng = int(random(0, 100));
    int status = relationship[survNo][targSurv];
    int test = status + rng;
    if (test < 100) {
      character.sanity -= 10;
      character.says = "How could they!";
      relationship[survNo][targSurv] -= 25;
      relationship[targSurv][survNo] -= +25;
    } else {
      character.trust -= 10;
      character.says = "What are you trying to pull?";
    }
  }
  //NAME RELATED METHODS
  //NAME LIST 
  void  loadNames() {
    nameList[0] = "Alex";
    nameList[1] = "Sam";
    nameList[2] = "Jess";
    nameList[3] = "Danny";
    nameList[4] = "Gabriel";
    nameList[5] = "Marian";
    nameList[6] = "Angel";
    nameList[7] = "Taylor";
    nameList[8] = "Vick";
    nameList[9] = "Jay";
    nameList[10] = "Devon";
    nameList[11] = "Jazz";
    nameList[12] = "Quinn";
    nameList[13] = "Robin";
    nameList[14] = "Skye";
    nameList[15] = "Eli";
    nameList[16] = "Christy";
    nameList[17] = "Gael";
    nameList[18] = "Kerr";
    nameList[19] = "Zuri";
  }
  //RANDOM NAME SELECTION
  int pickName() {
    int nameNo = int(random(0, nameList.length));
    return nameNo;
  }
  //UNIQUE NAME VERIFICATION
  void nameCheck(int i, Survivor character) {
    int currentName = pickName();
    if (nameFree[currentName]) {
      character.name = nameList[currentName];
      nameFree[currentName] = false;
    } else {
      nameCheck(i, character);
    }
  }
  //NAME ATTIRBUTION METHOD
  void giveNames() {
    loadNames();
    for (int i = 0; i< groupSize; i++) {
      Survivor character = s.get(i);
      nameCheck(i, character);
    }
  }
  //NAME RETRIEVAL 
  void getName(Survivor character, int x, int y) {
    text(character.name, x, y);
  }
  //CHARACTER DEATH
  void death() {
    Survivor victim = s.get(survNo);
    victim.isAlive = false;
    victim.isGone = true;
    victim.foodHarvested = int(victim.health*0.1) + 1;
    survivorsLeft --;
    for (int i = 0; i < s.size(); i++) {
      if (i != survNo) {
        Survivor other = s.get(i);
        if (other.isAlive && other.isGone == false) {
          int grief = 5 * (relationship[survNo][i] / 25);
          s.get(i).sanity -= grief;
          s.get(i).trust -= grief;
          relationship[survNo][i] = 999;
          relationship[i][survNo] = 999;
        }
      }
    }
    victim.dies();
  }
  //CHARACTER FLEES (LOW TRUST)
  void ranAway() {
    Survivor victim = s.get(survNo);
    victim.isGone = true;
    survivorsLeft--;
    for (int i = 0; i < s.size(); i++) {
      if (i != survNo) {
        Survivor other = s.get(i);
        if (other.isAlive && other.isGone == false) {
          int grief = 5 * (relationship[survNo][i] / 25);
          s.get(i).sanity -= grief;
          s.get(i).trust -= grief;
          relationship[survNo][i] = 999;
          relationship[i][survNo] = 999;
        }
      }
    }
    victim.dies();
  }

  //GAME OVER METHOD
  void gameOver() {
    if (survivorsLeft <= 0) {
      gameOver = true;
    } else {
      gameOver = false;
    }
  }
  //END OF CLASS
}