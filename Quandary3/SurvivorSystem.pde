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
    yChar = 375;
    for (int i = 0; i < groupSize; i++) {
      s.add(new Survivor(xChar, yChar));
      b.add(new Button(xChar, yChar, 70, 150, 100, 255));
      xChar += 100;
    }
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

  //NAME LIST 
  void  names() {
    nameList[0] = "Bob";
    nameList[1] = "Bob";
    nameList[2] = "Bob";
    nameList[3] = "Bob";
    nameList[4] = "Bob";
    nameList[5] = "Bob";
    nameList[6] = "Bob";
    nameList[7] = "Bob";
    nameList[8] = "Bob";
    nameList[9] = "Bob";
    nameList[10] = "Bob";
    nameList[11] = "Bob";
    nameList[12] = "Bob";
    nameList[13] = "Bob";
    nameList[14] = "Bob";
    nameList[15] = "Bob";
    nameList[16] = "Bob";
    nameList[17] = "Bob";
    nameList[18] = "Bob";
    nameList[19] = "Bob";
  }
  //NAME ATTIRBUTION METHOD
  void giveName() {
    
  }
}