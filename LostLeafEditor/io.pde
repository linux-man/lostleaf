void loadLevel(File file) {
  if (file != null && file.exists()) {
    level = file;
    JSONObject json = loadJSONObject(file);
    clearNodes();
    center.set(450, -height / 2);
    cbSnap.setSelected(json.getBoolean("snapping", true));
    textS.setText(intToStr(json.getInt("snap", 50)));

    textW.setText(intToStr(json.getInt("width", 900)));
    textH.setText(intToStr(json.getInt("height", 1600)));
    textScale.setText(floatToStr(json.getFloat("scale", 1)));
    cbRotate.setSelected(json.getBoolean("rotate", false));
    cbGFollowX.setSelected(json.getBoolean("followx", false));
    cbGFollowY.setSelected(json.getBoolean("followy", false));
    cbTiltX.setSelected(json.getBoolean("tiltx", false));
    cbTiltY.setSelected(json.getBoolean("tilty", false));
    textMaxTilt.setText(intToStr(json.getInt("maxtilt", 50)));
    textVictory.setText(intToStr(json.getInt("victory", 1)));
    textTimer.setText(intToStr(json.getInt("timer", 0)));
    textPoints.setText(intToStr(json.getInt("points", 0)));
    textIntro.setText(json.getString("intro",""));
    c1 = json.getInt("color1", color(255, 32));
    c2 = json.getInt("color2", color(255, 32));
    bg = json.getInt("background", color(0));
    cc = json.getInt("controlscolor", color(255, 255, 0, 128));
    textRockNum.setText(intToStr(json.getInt("newrocknum", 0)));
    textTrunkNum.setText(intToStr(json.getInt("newtrunknum", 0)));
    textWhirlNum.setText(intToStr(json.getInt("newwhirlnum", 0)));
    textRockMax.setText(intToStr(json.getInt("newrockmax", 100)));
    textTrunkMax.setText(intToStr(json.getInt("newtrunkmax", 600)));
    textWhirlMaxFlow.setText(intToStr(json.getInt("newwhirlmaxflow", 0)));
    textWhirlMaxRot.setText(intToStr(json.getInt("newwhirlmaxrot", 400)));
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
          leafs.add(new Leaf(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("diam", 40), o.getInt("color", color(255)), o.getBoolean("primary", false)));
          break;
        case "exit":
          exits.add(new Exit(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("range", defaultRange), o.getInt("color", color(255, 0)), o.getBoolean("save", true)));
          break;
        case "star":
          stars.add(new Star(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("diam"), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "killer":
          killers.add(new Killer(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("diam"), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "area":
          areas.add(new Area(new PVector(o.getInt("x"), o.getInt("y")), new PVector(o.getInt("vxmin", 0), o.getInt("vymin", 0)), new PVector(o.getInt("vxmax", 0), o.getInt("vymax", 0)), o.getInt("w"), o.getInt("h"), o.getInt("seed"), o.getInt("object"), o.getInt("quantmin"), o.getInt("quantmax"),
          o.getInt("diammin"), o.getInt("diammax"), o.getInt("flowmin"), o.getInt("flowmax"), o.getInt("rotationmin"), o.getInt("rotationmax"), o.getInt("rangemin", defaultRange), o.getInt("rangemax", defaultRange), o.getBoolean("followx", false), o.getBoolean("followy", false),
          o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color1", color(255)), o.getInt("color2", color(255))));
          break;
      }
    }
  }
}

void saveLevel(File file) {
  if (file != null) {
    level = file;
    String path = file.getPath();
    if(!path.endsWith(".ll")) path = path + ".ll";
    JSONObject json = new JSONObject();
    json.setInt("version", 2);
    if(!cbSnap.isSelected()) json.setBoolean("snapping", false);
    if(strToInt(textS.getText()) != 50) json.setInt("snap", strToInt(textS.getText()));
    if(strToInt(textW.getText()) != 900) json.setInt("width", strToInt(textW.getText()));
    if(strToInt(textH.getText()) != 1600) json.setInt("height", strToInt(textH.getText()));
    if(strToFloat(textScale.getText()) != 1) json.setFloat("scale", strToFloat(textScale.getText()));
    if(cbRotate.isSelected()) json.setBoolean("rotate", true);
    if(cbGFollowX.isSelected()) json.setBoolean("followx", true);
    if(cbGFollowY.isSelected()) json.setBoolean("followy", true);
    if(cbTiltX.isSelected()) json.setBoolean("tiltx", true);
    if(cbTiltY.isSelected()) json.setBoolean("tilty", true);
    if(strToInt(textMaxTilt.getText()) != 50) json.setInt("maxtilt", strToInt(textMaxTilt.getText()));
    if(strToInt(textVictory.getText()) > 1) json.setInt("victory", strToInt(textVictory.getText()));
    if(strToInt(textTimer.getText()) > 0) json.setInt("timer", strToInt(textTimer.getText()));println(textTimer.getText());
    if(strToInt(textPoints.getText()) > 0) json.setInt("points", strToInt(textPoints.getText()));
    if(!textIntro.getText().equals("")) json.setString("intro",textIntro.getText());
    if(c1 != color(255, 32)) json.setInt("color1", c1);
    if(c2 != color(255, 32)) json.setInt("color2", c2);
    if(bg != color(0)) json.setInt("background", bg);
    if(cc != color(255, 255, 0, 128)) json.setInt("controlscolor", cc);
    if(strToInt(textRockNum.getText()) > 0) json.setInt("newrocknum", strToInt(textRockNum.getText()));
    if(strToInt(textTrunkNum.getText()) > 0) json.setInt("newtrunknum", strToInt(textTrunkNum.getText()));
    if(strToInt(textWhirlNum.getText()) > 0) json.setInt("newwhirlnum", strToInt(textWhirlNum.getText()));
    if(strToInt(textRockMax.getText()) != 100) json.setInt("newrockmax", strToInt(textRockMax.getText()));
    if(strToInt(textTrunkMax.getText()) != 600) json.setInt("newtrunkmax", strToInt(textTrunkMax.getText()));
    if(strToInt(textWhirlMaxFlow.getText()) > 0) json.setInt("newwhirlmaxflow", strToInt(textWhirlMaxFlow.getText()));
    if(strToInt(textWhirlMaxRot.getText()) != 400) json.setInt("newwhirlmaxrot", strToInt(textWhirlMaxRot.getText()));
    if(rc1 != color(255)) json.setInt("rockcolor1", rc1);
    if(rc2 != color(255)) json.setInt("rockcolor2", rc2);
    if(tc1 != color(255)) json.setInt("trunkcolor1", tc1);
    if(tc2 != color(255)) json.setInt("trunkcolor2", tc2);
    if(wc1 != color(255)) json.setInt("whirlcolor1", wc1);
    if(wc2 != color(255)) json.setInt("whirlcolor2", wc2);
    JSONArray jsonNodes = new JSONArray();
    for(Whirl o: whirls) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "whirl");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      jsonNode.setInt("flow", o.flow); jsonNode.setInt("rotation", o.rotation);
      if(o.range != defaultRange) jsonNode.setInt("range", o.range);
      if(o.vel.magSq() > 0) {jsonNode.setInt("vx", (int)o.vel.x); jsonNode.setInt("vy", (int)o.vel.y);}
      if(o.followX) jsonNode.setBoolean("followx", true);
      if(o.followY) jsonNode.setBoolean("followy", true);
      if(o.bounceX) jsonNode.setBoolean("bouncex", true);
      if(o.bounceY) jsonNode.setBoolean("bouncey", true);
      if(o.c != color(255)) jsonNode.setInt("color", o.c);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Flow o: flows) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "flow");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      jsonNode.setInt("flowx", (int)o.flow.x);jsonNode.setInt("flowy", (int)o.flow.y);
      if(o.range != defaultRange) jsonNode.setInt("range", o.range);
      if(o.vel.magSq() > 0) jsonNode.setInt("vx", (int)o.vel.x); jsonNode.setInt("vy", (int)o.vel.y);
      if(o.followX) jsonNode.setBoolean("followx", true);
      if(o.followY) jsonNode.setBoolean("followy", true);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Rock o: rocks) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "rock");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      jsonNode.setInt("diam", o.diam);
      if(o.vel.magSq() > 0) {jsonNode.setInt("vx", (int)o.vel.x); jsonNode.setInt("vy", (int)o.vel.y);}
      if(o.followX) jsonNode.setBoolean("followx", true);
      if(o.followY) jsonNode.setBoolean("followy", true);
      if(o.bounceX) jsonNode.setBoolean("bouncex", true);
      if(o.bounceY) jsonNode.setBoolean("bouncey", true);
      if(o.c != color(255)) jsonNode.setInt("color", o.c);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Trunk o: trunks) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "trunk");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      jsonNode.setInt("w", o.w); jsonNode.setInt("h", o.h);
      if(o.angle != 0) jsonNode.setInt("angle", o.angle);
      if(o.aRot != 0) jsonNode.setInt("aRot", o.aRot);
      if(o.vel.magSq() > 0) {jsonNode.setInt("vx", (int)o.vel.x); jsonNode.setInt("vy", (int)o.vel.y);}
      if(o.followX) jsonNode.setBoolean("followx", true);
      if(o.followY) jsonNode.setBoolean("followy", true);
      if(o.bounceX) jsonNode.setBoolean("bouncex", true);
      if(o.bounceY) jsonNode.setBoolean("bouncey", true);
      if(o.c != color(255)) jsonNode.setInt("color", o.c);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Leaf o: leafs) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "leaf");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      if(o.diam != 40) jsonNode.setInt("diam", o.diam);
      if(o.c != color(255)) jsonNode.setInt("color", o.c);
      if(o.primary) jsonNode.setBoolean("primary", true);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Exit o: exits) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "exit");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      if(o.range != defaultRange) jsonNode.setInt("range", o.range);
      if(o.c != color(255, 0)) jsonNode.setInt("color", o.c);
      if(o.save == false) jsonNode.setBoolean("save", false);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Star o: stars) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "star");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      jsonNode.setInt("diam", o.diam);
      if(o.vel.magSq() > 0) {jsonNode.setInt("vx", (int)o.vel.x); jsonNode.setInt("vy", (int)o.vel.y);}
      if(o.followX) jsonNode.setBoolean("followx", true);
      if(o.followY) jsonNode.setBoolean("followy", true);
      if(o.bounceX) jsonNode.setBoolean("bouncex", true);
      if(o.bounceY) jsonNode.setBoolean("bouncey", true);
      if(o.c != color(255)) jsonNode.setInt("color", o.c);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Killer o: killers) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "rock");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      jsonNode.setInt("diam", o.diam);
      if(o.vel.magSq() > 0) {jsonNode.setInt("vx", (int)o.vel.x); jsonNode.setInt("vy", (int)o.vel.y);}
      if(o.followX) jsonNode.setBoolean("followx", true);
      if(o.followY) jsonNode.setBoolean("followy", true);
      if(o.bounceX) jsonNode.setBoolean("bouncex", true);
      if(o.bounceY) jsonNode.setBoolean("bouncey", true);
      if(o.c != color(255)) jsonNode.setInt("color", o.c);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Area o: areas) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "area");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      if(o.velMin.magSq() > 0) {jsonNode.setInt("vxmin", (int)o.velMin.x); jsonNode.setInt("vymin", (int)o.velMin.y);}
      if(o.velMax.magSq() > 0) {jsonNode.setInt("vxmax", (int)o.velMax.x); jsonNode.setInt("vymax", (int)o.velMax.y);}
      jsonNode.setInt("w", o.w); jsonNode.setInt("h", o.h);
      jsonNode.setInt("seed", o.seed); jsonNode.setInt("object", o.object);
      jsonNode.setInt("quantmin", o.quantMin); jsonNode.setInt("quantmax", o.quantMax);
      jsonNode.setInt("diammin", o.diamMin); jsonNode.setInt("diammax", o.diamMax);
      jsonNode.setInt("flowmin", o.flowMin); jsonNode.setInt("flowmax", o.flowMax);
      jsonNode.setInt("rotationmin", o.rotationMin); jsonNode.setInt("rotationmax", o.rotationMax);
      if(o.rangeMin != defaultRange) jsonNode.setInt("rangemin", o.rangeMin);
      if(o.rangeMax != defaultRange) jsonNode.setInt("rangemax", o.rangeMax);
      if(o.followX) jsonNode.setBoolean("followx", true);
      if(o.followY) jsonNode.setBoolean("followy", true);
      if(o.bounceX) jsonNode.setBoolean("bouncex", true);
      if(o.bounceY) jsonNode.setBoolean("bouncey", true);
      if(o.c1 != color(255)) jsonNode.setInt("color1", o.c1); if(o.c2 != color(255)) jsonNode.setInt("color2", o.c2);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    json.setJSONArray("obj", jsonNodes);
    saveJSONObject(json, path);
  }
}
