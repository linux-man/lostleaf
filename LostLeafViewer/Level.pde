class Level extends State {
  int levelW, levelH, victory, points;
  float rotation;
  boolean followX, followY;
  String intro;
  color bg, cc;
  PFont font;

  int nLeafs, savedLeafs, starPoints, newRockNum, newTrunkNum, newWhirlNum, newRockMax, newTrunkMax, newWhirlMaxRot, newWhirlMaxFlow;
  boolean begin, end, overRestart, overRock, overTrunk, overWhirl, newRock, newTrunk, newWhirl, posRock, posTrunk, posWhirl;
  float fade;
  String link;

  Level(String l) {
    begin = true;
    end = false;
    fade = 0;
    savedLeafs = 0;
    starPoints = 0;
    rotation = -HALF_PI;
    tilt = new PVector(0, 0);
    center = new PVector(0, 0);
    textSize(140);
    link = l;
    loadLevel(link);
    if(leafs.size() != 1) rotate = false;
    fCenter();

    scale *= max((float)width / levelW, (float)height / levelH);
    if(rotate) drops = 300;
    else drops = 200;

    flows.add(0, new Flow(center.copy(), new PVector(0, 0), defaultRange, new PVector(0, 0), true, true));
    water = new Water[drops];
    for(int n = 0; n < water.length; n++) water[n] = new Water();
    font = createFont("Arvo-Regular_201.ttf", 24, true);
    textFont(font);
  }

  void draw() {
    if(posRock || posTrunk || posWhirl) dt = 0;

    //Tilt
    if(keyPressed) {
      if(tiltX) {
        if(keyCode == LEFT) tilt.add(-maxTilt / 10, 0);
        if(keyCode == RIGHT) tilt.add(maxTilt / 10, 0);
      }
      if(tiltY) {
        if(keyCode == UP) tilt.add(0, -maxTilt / 10);
        if(keyCode == DOWN) tilt.add(0, maxTilt / 10);
      }
      tilt.limit(maxTilt);
    }
    flows.get(0).flow.set(tilt.copy().rotate(rotation + HALF_PI));

    //Draw level
    nLeafs = leafs.size();
    if(nLeafs == 0 || savedLeafs >= victory || (points > 0 && starPoints >= points)) end = true;
    fCenter();
    translate(width / 2, height / 2);
    if(rotate) fRotate();
    scale(scale, scale);
    background(bg);
    for(Water o: water) o.update();
    for(Flow o: flows) o.update();
    noFill();
    strokeWeight(6);
    for(Whirl o: whirls) o.update();
    for(int n = stars.size() - 1; n >= 0; n--) {
      if(stars.get(n).catched) {
        starPoints++;
        stars.remove(n);
      }
      else stars.get(n).update();
    }
    noStroke();
    for(Exit o: exits) o.update();
    for(Rock o: rocks) o.update();
    for(Trunk o: trunks) o.update();
    for(Killer o: killers) o.update();
    for(int n = leafs.size() - 1; n >= 0; n--) {
      if(leafs.get(n).sucked && leafs.get(n).ds > 4) leafs.remove(n);
      else if(leafs.get(n).saved && leafs.get(n).ds < 1 / 4) {
        savedLeafs++;
        leafs.remove(n);
      }
      else leafs.get(n).update();
    }
    scale(1 / scale, 1 / scale);
    if(rotate) rotate(rotation + HALF_PI);
    translate(-width / 2, -height / 2);

    //Controls
    if(points > 0) {
      fill(cc);
      text(points, width / 2, height / 10);
    }
    translate(width / 12, height * 11 / 12);
    strokeWeight(4 * width / 400);
    noFill();
    stroke(cc);
    if(overRestart) rect(0, 0, width / 7, width / 7, width / 24);
    arc(0, 0, width / 12, width / 12, 0, 3 * HALF_PI);
    noStroke();
    fill(cc);
    triangle(width / 24, -width / 48, width / 24 - width / 48, 0, width / 24 + width / 48, 0);
    translate(width / 6, 0);
    if(newRockNum > 0) {
      if(overRock || newRock) {
        noFill();
        stroke(cc);
        rect(0, 0, width / 7, width / 7, width / 24);
      }
      noStroke();
      fill(cc);
      ellipse(0, 0, width / 24, width / 24);
    }
    translate(width / 6, 0);
    if(newTrunkNum > 0) {
      if(overTrunk || newTrunk) {
        noFill();
        stroke(cc);
        rect(0, 0, width / 7, width / 7, width / 24);
      }
      noStroke();
      fill(cc);
      rect(0, 0, width / 8, width / 24, width / 48);
    }
    translate(width / 6, 0);
    if(newWhirlNum > 0) {
      noFill();
      stroke(cc);
      if(overWhirl || newWhirl) rect(0, 0, width / 7, width / 7, width / 24);
      for(int n = 0; n < 8; n ++) {
        rotate(QUARTER_PI);
        arc(width / 48, width / 48, width / 24 * sqrt(2), width / 24 * sqrt(2), -QUARTER_PI + PI, QUARTER_PI + PI);
      }
    }
    translate(width * 3 / 12, 0);
    if(tiltX || tiltY) {
      fill(cc);
      stroke(cc);
      if(!tiltY) rect(0, 0, width / 4, width / 12, width / 24);
      else if(!tiltX) rect(0, 0, width / 12, width / 4, width / 24);
      else ellipse(0, 0, width / 4, width / 4);
      ellipse(0, 0, width / 64, width / 64);
      ellipse(tilt.x / maxTilt * (width / 8 - width / 24), tilt.y / maxTilt * (width / 8 - width / 24), width / 12, width / 12);   
    }

    //Fade
    noStroke();
    if(begin) {
      if(fade < 2) {
        fade += dt;
        fill(0, (2 - fade) * 128);
        translate(-width / 3, -5 * height / 12);
        rect(0, 0, width, height);
      }
      else begin = false;
    }
    else if(end) {
      if(fade > 0) {
        fade -= dt;
        fill((savedLeafs >= victory || (points > 0 && starPoints >= points)) ? 255 : 0, (2 - fade) * 128);
        translate(-width / 3, -5 * height / 12);
        rect(0, 0, width, height);
      }
      else st = new LevelMenu(link, savedLeafs >= victory || (points > 0 && starPoints >= points));
    }
  }

  void touchStarted() {
    if(mouseY > height * 11 / 12 - width / 12) {
      overRestart = false; overRock = false; overTrunk = false; overWhirl = false;
      if(mouseX < width / 6) overRestart = true;
      else if(mouseX < 2 * width / 6) overRock = true;
      else if(mouseX < 3 * width / 6) overTrunk = true;
      else if(mouseX < 4 * width / 6) overWhirl = true;
    }
    else {
      float x = (mouseX - width / 2) / scale * cos(-rotation - HALF_PI) + (mouseY - height / 2) / scale * sin(-rotation - HALF_PI) + center.x;
      float y = (mouseY - height / 2) / scale * cos(-rotation - HALF_PI) - (mouseX - width / 2) / scale * sin(-rotation - HALF_PI) + center.y;
      if(newRock && newRockNum > 0) {rocks.add(new Rock(new PVector(x, y))); posRock = true; newRockNum--;}
      else if(newTrunk && newTrunkNum > 0) {trunks.add(new Trunk(new PVector(x, y))); posTrunk = true; newTrunkNum--;}
      else if(newWhirl && newWhirlNum > 0) {whirls.add(new Whirl(new PVector(x, y))); posWhirl = true; newWhirlNum--;}
    }
  }

  void touchMoved() {
    if(mouseY > height * 11 / 12 - width / 12) {
      overRestart = false; overRock = false; overTrunk = false; overWhirl = false;
      if(mouseX < width / 6) overRestart = true;
      else if(mouseX < 2 * width / 6) overRock = true;
      else if(mouseX < 3 * width / 6) overTrunk = true;
      else if(mouseX < 4 * width / 6) overWhirl = true;
    }
    else {
      float x = (mouseX - width / 2) / scale * cos(-rotation - HALF_PI) + (mouseY - height / 2) / scale * sin(-rotation - HALF_PI) + center.x;
      float y = (mouseY - height / 2) / scale * cos(-rotation - HALF_PI) - (mouseX - width / 2) / scale * sin(-rotation - HALF_PI) + center.y;
      if(posRock) rocks.get(rocks.size() - 1).change((int)min(newRockMax, max(50, dist(rocks.get(rocks.size() - 1).pos.x, rocks.get(rocks.size() - 1).pos.y, x, y) * 2)));
      else if(posTrunk) trunks.get(trunks.size() - 1).change((int)min(newTrunkMax, max(50, dist(trunks.get(trunks.size() - 1).pos.x, trunks.get(trunks.size() - 1).pos.y, x, y) * 2)), PVector.sub(trunks.get(trunks.size() - 1).pos, new PVector(x, y)).heading());
      else if(posWhirl) {
        int f = (int)(y - whirls.get(whirls.size() - 1).pos.y);
        f = sign(f) * min(newWhirlMaxFlow, abs(f));
        int r = (int)(x - whirls.get(whirls.size() - 1).pos.x);
        r = sign(r) * min(newWhirlMaxRot, abs(r));
        whirls.get(whirls.size() - 1).change(f, r);
      }
    }
  }

  void touchEnded() {
    posRock = false; posTrunk = false; posWhirl = false;
    if(mouseY > height * 11 / 12 - width / 12) {
      newRock = false; newTrunk = false; newWhirl = false;
      if(mouseX < width / 6) end = true;
      else if(mouseX < 2 * width / 6) newRock = true;
      else if(mouseX < 3 * width / 6) newTrunk = true;
      else if(mouseX < 4 * width / 6) newWhirl = true;
    }
  }

  void fCenter() {
    PVector pCenter = center.copy();
    switch(nLeafs) {
      case 0:
        break;
      case 1:
        center.set(leafs.get(0).pos);
        break;
      default:
        PVector median = new PVector(0, 0);
        for(Leaf o: leafs) median.add(o.pos);
        median.div(leafs.size());
        PVector sub = PVector.sub(median, center);
        if(sub.magSq() > 100) center.add(sub.setMag(10));
        else center.set(median);
    }
    if(!followX) center.x = levelW / 2;
    if(!followY) center.y = levelH / 2;
    dif = PVector.sub(center, pCenter);
  }
  
  void fRotate() {
    switch(nLeafs) {
    case 0:
      break;
    default:
      float a = leafs.get(0).mov.heading() - rotation;
      if(abs(a) > PI) a += sign(a) * -TWO_PI;
      rotation += sign(a) * min(abs(a), abs(a) * dt);
      if(abs(rotation) > PI) rotation += sign(rotation) * -TWO_PI;
    }
    rotate(-rotation - HALF_PI);
  }

  void loadLevel(String filename) {
    JSONObject json = loadJSONObject(filename);
    clearNodes();
    levelW = json.getInt("width", 900);
    levelH = json.getInt("height", 1600);
    scale = json.getFloat("scale", 1);
    rotate = json.getBoolean("rotate", false);
    followX = json.getBoolean("followx", false);
    followY = json.getBoolean("followy", false);
    tiltX = json.getBoolean("tiltx", false);
    tiltY = json.getBoolean("tilty", false);
    maxTilt = json.getInt("maxtilt", 50);
    victory = json.getInt("victory", 1);
    points = json.getInt("points", 0);
    intro = json.getString("intro","");
    c1 = json.getInt("color1", color(255, 32));
    c2 = json.getInt("color2", color(255, 32));
    bg = json.getInt("background", color(0));
    cc = json.getInt("controlscolor", color(255, 255, 0, 128));
    newRockNum = json.getInt("newrocknum", 0);
    newTrunkNum = json.getInt("newtrunknum", 0);
    newWhirlNum = json.getInt("newwhirlnum", 0);
    newRockMax = json.getInt("newrockmax", 100);
    newTrunkMax = json.getInt("newtrunkmax", 600);
    newWhirlMaxFlow = json.getInt("newwhirlmaxflow", 0);
    newWhirlMaxRot = json.getInt("newwhirlmaxrot", 400);
    rc1 = json.getInt("rockcolor1", color(255));
    rc2 = json.getInt("rockcolor2", color(255));
    tc1 = json.getInt("trunkcolor1", color(255));
    tc2 = json.getInt("trunkcolor2", color(255));
    wc1 = json.getInt("whirlcolor1", color(255));
    wc2 = json.getInt("whirlcolor2", color(255));
    JSONArray jsonNodes = json.getJSONArray("obj");
    for(int n = 0; n < jsonNodes.size(); n++) {
      JSONObject o = jsonNodes.getJSONObject(n);
      switch(o.getString("type")) {
        case "whirl":
          whirls.add(new Whirl(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("flow"), o.getInt("rotation"), o.getInt("range", defaultRange), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "flow":
          flows.add(new Flow(new PVector(o.getInt("x"), o.getInt("y")), new PVector(o.getInt("flowx"), o.getInt("flowy")), o.getInt("range", defaultRange), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getBoolean("followx", false), o.getBoolean("followy", false)));
          break;
        case "rock":
          rocks.add(new Rock(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("diam"), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "trunk":
          trunks.add(new Trunk(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("w"), o.getInt("h"), o.getInt("angle", 0), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getInt("aRot", 0), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "leaf":
          leafs.add(new Leaf(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("diam", 40), o.getInt("color", color(255))));
          break;
        case "exit":
          exits.add(new Exit(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("range", defaultRange), o.getInt("color", color(255, 0))));
          break;
        case "star":
          stars.add(new Star(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("diam"), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "killer":
          killers.add(new Killer(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("diam"), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "area":
          if(o.getInt("seed") >= 0) randomSeed(o.getInt("seed")); else randomSeed(millis());
          int q = int(random(o.getInt("quantmin"), o.getInt("quantmax") + 1));
          switch(o.getInt("object")) {
            case 0: //Rocks
              for(int m = 0; m < q; m++) rocks.add(new Rock(
              new PVector(int(random(o.getInt("x") - o.getInt("w") / 2, o.getInt("x") + 1 + o.getInt("w") / 2)), int(random(o.getInt("y") - o.getInt("h") / 2, o.getInt("y") + 1 + o.getInt("h") / 2))), 
              int(random(o.getInt("diammin"), o.getInt("diammax") + 1)),
              new PVector(int(random(o.getInt("vxmin", 0), o.getInt("vxmax", 0) + 1)), int(random(o.getInt("vymin", 0), o.getInt("vymax", 0) + 1))),
              o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false),
              color(int(random(red(o.getInt("color1", color(255))), red(o.getInt("color2", color(255))))), int(random(green(o.getInt("color1", color(255))), green(o.getInt("color2", color(255))))), int(random(blue(o.getInt("color1", color(255))), blue(o.getInt("color2", color(255))))))
              ));          
              break;
            case 1: //Whirls
              for(int m = 0; m < q; m++) whirls.add(new Whirl(
              new PVector(int(random(o.getInt("x") - o.getInt("w") / 2, o.getInt("x") + 1 + o.getInt("w") / 2)), int(random(o.getInt("y") - o.getInt("h") / 2, o.getInt("y") + 1 + o.getInt("h") / 2))), 
              int(random(o.getInt("flowmin"), o.getInt("flowmax") + 1)),
              int(random(o.getInt("rotationmin"), o.getInt("rotationmax") + 1)),
              int(random(o.getInt("rangemin", defaultRange), o.getInt("rangemax", defaultRange) + 1)),
              new PVector(int(random(o.getInt("vxmin", 0), o.getInt("vxmax", 0) + 1)), int(random(o.getInt("vymin", 0), o.getInt("vymax", 0) + 1))),
              o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false),
              color(int(random(red(o.getInt("color1", color(255))), red(o.getInt("color2", color(255))))), int(random(green(o.getInt("color1", color(255))), green(o.getInt("color2", color(255))))), int(random(blue(o.getInt("color1", color(255))), blue(o.getInt("color2", color(255))))))
              ));          
              break;
            case 2: //Stars
              for(int m = 0; m < q; m++) stars.add(new Star(
              new PVector(int(random(o.getInt("x") - o.getInt("w") / 2, o.getInt("x") + 1 + o.getInt("w") / 2)), int(random(o.getInt("y") - o.getInt("h") / 2, o.getInt("y") + 1 + o.getInt("h") / 2))), 
              int(random(o.getInt("diammin"), o.getInt("diammax") + 1)),
              new PVector(int(random(o.getInt("vxmin", 0), o.getInt("vxmax", 0) + 1)), int(random(o.getInt("vymin", 0), o.getInt("vymax", 0) + 1))),
              o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false),
              color(int(random(red(o.getInt("color1", color(255))), red(o.getInt("color2", color(255))))), int(random(green(o.getInt("color1", color(255))), green(o.getInt("color2", color(255))))), int(random(blue(o.getInt("color1", color(255))), blue(o.getInt("color2", color(255))))))
              ));          
              break;
            case 3: //Killers
              for(int m = 0; m < q; m++) killers.add(new Killer(
              new PVector(int(random(o.getInt("x") - o.getInt("w") / 2, o.getInt("x") + 1 + o.getInt("w") / 2)), int(random(o.getInt("y") - o.getInt("h") / 2, o.getInt("y") + 1 + o.getInt("h") / 2))), 
              int(random(o.getInt("diammin"), o.getInt("diammax") + 1)),
              new PVector(int(random(o.getInt("vxmin", 0), o.getInt("vxmax", 0) + 1)), int(random(o.getInt("vymin", 0), o.getInt("vymax", 0) + 1))),
              o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false),
              color(int(random(red(o.getInt("color1", color(255))), red(o.getInt("color2", color(255))))), int(random(green(o.getInt("color1", color(255))), green(o.getInt("color2", color(255))))), int(random(blue(o.getInt("color1", color(255))), blue(o.getInt("color2", color(255))))))
              ));          
              break;
          }
          break;
      }
    }
  }

  void clearNodes() {
    whirls.clear();
    flows.clear();
    rocks.clear();
    trunks.clear();
    leafs.clear();
    exits.clear();
    stars.clear();
    killers.clear();
  }
}
