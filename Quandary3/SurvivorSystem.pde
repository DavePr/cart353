class SurvivorSystem {
  //CLASS PROPERTIES
  int groupSize;
  ArrayList<Survivor> s;
  ArrayList<Button> b;
  int[][] relationship;
  String[] nameList;
  boolean[] nameFree;
  boolean profileClick;
  int survNo;
  int xChar;
  int yChar;


  //CONSTRUCTOR
  SurvivorSystem() {
    s =new ArrayList<Survivor>();
    b = new ArrayList<Button>();
    nameList = new String[20];
    nameFree = new boolean[20];
    groupSize = 11;
    relationship = new int[11][11];
    profileClick = false;
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
      xChar += 100;
    }
    giveNames();
  }

  //GROUP DISPLAY METHOD
  void gdisp() {
    for (Survivor character : s) {
      character.display();
      if (keyPressed) {
        if (key == 'd') {
          xChar += 10;
        }
      }
    }
    for (int i = 0; i< groupSize; i++) {
      Button select = b.get(i);
      select.highlight();
      if (select.mouseOver) {
        survNo = i; 
        profileClick = true;
      }
    }
  }

  //INDIVIDUAL DISPLAY METHOD
  void idisp() {
    Survivor profile = s.get(survNo);
    profile.individual();
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
      }
    }
  }

  //DOWN RELATIONSHIP METHOD



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


  //END OF CLASS
}