class Intro extends State {
  String link, intro;
  int victory, points, newRockNum, newTrunkNum, newWhirlNum;
  float fade;
  boolean begin, end;
  PFont font1, font2;

  Intro(String l) {
    link = l;
    loadLevel(link);
    fade = 0;
    begin = true;
    end = false;
    font1 = createFont("Arvo-Italic_201.ttf", 24, true);
    font2 = createFont("Arvo-Regular_201.ttf", 24, true);
  }

  void draw() {
    if(victory == 1 && intro.equals("") && newRockNum + newTrunkNum + newWhirlNum ==0) st = new Level(link);
    noStroke();
    background(0);
    fill(255);
    textFont(font1);
    if(!intro.equals("")) text(intro, width / 2, height / 3, width, height * 2 / 3);
    textFont(font2);
    String conditions = "";
    if(victory > 1) conditions += "Save " + victory + " leafs\n";
    if(points > 0) conditions += "Catch " + points + " stars\n";
    if(newRockNum + newTrunkNum + newWhirlNum > 0) conditions += "You have ";
    if(newRockNum > 0) conditions += newRockNum + ((newRockNum == 1) ? " rock" : " rocks");
    if(newTrunkNum > 0) {
      if(newRockNum > 0) {
        if(newWhirlNum > 0) conditions += ", ";
        else conditions += " and ";
      }
      conditions += newTrunkNum + ((newTrunkNum == 1) ? " trunk" : " trunks");
    }
    if(newWhirlNum > 0) {
      if(newRockNum + newTrunkNum > 0) conditions += " and ";
      conditions += newWhirlNum + ((newWhirlNum == 1) ? " whirl" : " whirls");
    }
    text(conditions, width / 2, height * 5 / 6, width, height / 6);
    if(begin) {
      if(fade < 2) {
        fade += dt;
        fill(0, (2 - fade) * 128);
        rect(width / 2, height / 2, width, height);
      }
      else begin = false;
    }
    else if(end) {
      if(fade > 0) {
        fade -= dt;
        fill(0, (2 - fade) * 128);
        rect(width / 2, height / 2, width, height);
      }
      else st = new Level(link);
      rect(width / 2, height / 2, width, height);
    }
  }

  void loadLevel(String filename) {
    JSONObject json = loadJSONObject(filename);
    victory = json.getInt("victory", 1);
    points = json.getInt("points", 0);
    intro = json.getString("intro","");
    newRockNum = json.getInt("newrocknum", 0);
    newTrunkNum = json.getInt("newtrunknum", 0);
    newWhirlNum = json.getInt("newwhirlnum", 0);
  }

  void touchEnded() {
    end = true;
  }

}
