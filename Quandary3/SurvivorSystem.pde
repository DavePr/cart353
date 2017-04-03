class SurvivorSystem {
  //CLASS PROPERTIES
  int groupSize;
  ArrayList<Survivor> s;
  ArrayList<Button> b;
  int[][] relationship;
  String[] nameList;
  boolean nameFree;
  boolean profileClick;


  //CONSTRUCTOR
  SurvivorSystem() {
    s =new ArrayList<Survivor>();
    b = new ArrayList<Button>();
    groupSize = 11;
    relationship = new int[11][11];
    profileClick = false;
  }

  //GENERATION METHOD
  void spawn() {
    int xChar = width/2 -500;
    int yChar = 375;
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
    }
    for (Button selection : b) {
      selection.highlight();
      if (selection.mouseOver) {
        profileClick = true;
      }
    }
  }
  //INDIVIDUAL DISPLAY METHOD
  void idisp(int survNo) {
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
}