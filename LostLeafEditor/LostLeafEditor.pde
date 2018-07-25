/*
Lost Leaf is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Lost Leaf is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Backstage.  If not, see <http://www.gnu.org/licenses/>.
*/

// Need G4P library
import g4p_controls.*;

ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Trunk> trunks = new ArrayList<Trunk>();
ArrayList<Flow> flows = new ArrayList<Flow>();
ArrayList<Whirl> whirls = new ArrayList<Whirl>();
ArrayList<Leaf> leafs = new ArrayList<Leaf>();
ArrayList<Exit> exits = new ArrayList<Exit>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Killer> killers = new ArrayList<Killer>();

Rock rock;
Trunk trunk;
Flow flow;
Whirl whirl;
Leaf leaf;
Exit exit;
Star star;
Killer killer;

int pMillis;
int defaultRange = 2000;
boolean move = false;
boolean clone = false;
float scale = 1;
PVector center;
PVector pos = new PVector(0, 0);
PVector clickPos = new PVector(0, 0);
PVector dif = new PVector(0, 0);
color bg = color(0);
color c1 = color(255, 32);
color c2 = color(255, 32);
color cc = color(255, 255, 0, 128);
color rc1 = color(255);
color rc2 = color(255);
color tc1 = color(255);
color tc2 = color(255);
color wc1 = color(255);
color wc2 = color(255);
File level;

public void setup(){
  size(1000, 600);
  surface.setResizable(true);
  center = new PVector(450, -280);
  imageMode(CENTER);
  ellipseMode(CENTER);
  rectMode(CENTER);
  createGUI();
  customGUI();
  pMillis = millis();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){
  panelCreate.setVisible(false);
  panelProperties.setVisible(false);
  panelLevel.moveTo(264, 0);
  panelNew.moveTo(376, 0);
  panelLevel.setCollapsed(true);
  panelNew.setCollapsed(true);
}

public void draw(){
  pMillis = millis();

  int w = strToInt(textW.getText());
  int h = strToInt(textH.getText());
  int s = strToInt(textS.getText());
  pushMatrix();
  translate(width/2, height/2);
  scale(1 / sliderScale.getValueF());

  background(bg);
  noFill();
  strokeWeight(1);
  stroke(255);
  rect(w / 2 - center.x, -h / 2 - center.y, w, -h);

  for(Rock o: rocks) o.update();
  for(Trunk o: trunks) o.update();
  for(Flow o: flows) o.update();
  for(Whirl o: whirls) o.update();
  for(Leaf o: leafs) o.update();
  for(Exit o: exits) o.update();
  for(Star o: stars) o.update();
  for(Killer o: killers) o.update();

  if(!panelCreate.isVisible()) pos.set((mouseX - width / 2) * sliderScale.getValueF() + center.x, (mouseY - height / 2) * sliderScale.getValueF() + center.y);
  if(cbSnap.isSelected() && s > 7) {
    if(!panelCreate.isVisible()) pos.set(pos.x + sign(pos.x) * s / 2 - (pos.x + sign(pos.x) * s / 2) % s, pos.y + sign(pos.y) * s / 2 - (pos.y + sign(pos.y) * s / 2) % s);
    int xmin = (int)(center.x - width / 2 * sliderScale.getValueF());
    int xmax = (int)(center.x + width / 2 * sliderScale.getValueF());
    int ymin = (int)(center.y - height / 2 * sliderScale.getValueF());
    int ymax = (int)(center.y + height / 2 * sliderScale.getValueF());
    noStroke();
    fill(255);
    for(int n = xmin - xmin % s ; n <= xmax - xmax % s; n +=s) for(int m = ymin - ymin % s; m <= ymax - ymax % s; m += s) ellipse(n - center.x, m - center.y, 3, 3);
  }
  if(move)fill(0, 255, 0);
  else if(clone)fill(0, 255, 255);
  else fill(255, 0, 0);
  ellipse(pos.x - center.x, pos.y - center.y, 12, 12);
  popMatrix();
}

void mouseClicked() {
  int s = 8;
  if(mouseY < 40) return;
  if(panelProperties.isVisible() && mouseX < 136 && mouseY < 312) return;
  if(cbSnap.isSelected()) s = strToInt(textS.getText()); 
  if(mouseButton == RIGHT) {
    move = false;
    clone = false;
    panelCreate.moveTo(mouseX, mouseY);
    panelCreate.setVisible(true);
  }
  else {
    panelCreate.setVisible(false);
    if(move) {
      move = false;
      if(exit != null) exit.pos.set(pos);
      else if(leaf != null) leaf.pos.set(pos);
      else if(whirl != null) whirl.pos.set(pos);
      else if(flow != null) flow.pos.set(pos);
      else if(trunk != null) trunk.pos.set(pos);
      else if(rock != null) rock.pos.set(pos);
      else if(star != null) star.pos.set(pos);
      else if(killer != null) killer.pos.set(pos);
    }
    else if(clone) {
      if(exit != null) exits.add(new Exit(pos.copy(), exit.range, exit.c));
      else if(leaf != null) leafs.add(new Leaf(pos.copy(), leaf.c));
      else if(whirl != null) whirls.add(new Whirl(pos.copy(), whirl.flow, whirl.rotation, whirl.range, whirl.vel, whirl.followX, whirl.followY, whirl.bounceX, whirl.bounceY, whirl.c));
      else if(flow != null) flows.add(new Flow(pos.copy(), flow.flow, flow.range, flow.vel, flow.followX, flow.followY));
      else if(trunk != null) trunks.add(new Trunk(pos.copy(), trunk.w, trunk.h, trunk.angle, trunk.vel, trunk.aRot, trunk.followX, trunk.followY, trunk.bounceX, trunk.bounceY, trunk.c));
      else if(rock != null) rocks.add(new Rock(pos.copy(), rock.diam, rock.vel, rock.followX, rock.followY, rock.bounceX, rock.bounceY, rock.c));
      else if(star != null) stars.add(new Star(pos.copy(), star.diam, star.vel, star.followX, star.followY, star.bounceX, star.bounceY, star.c));
      else if(killer != null) killers.add(new Killer(pos.copy(), killer.diam, killer.vel, killer.followX, killer.followY, killer.bounceX, killer.bounceY, killer.c));
    }

    panelProperties.setVisible(false);
    whirl = null;
    flow = null;
    rock = null;
    trunk = null;
    leaf = null;
    exit = null;
    star = null;
    killer = null;
    for(Whirl o: whirls) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Whirl Properties");
      whirl = o;
      textX.setText(intToStr(whirl.pos.x));
      textY.setText(intToStr(whirl.pos.y));
      textVX.setText(intToStr(whirl.vel.x));
      textVY.setText(intToStr(whirl.vel.y));
      textRange.setText(intToStr(whirl.range));
      textRot.setText(intToStr(whirl.rotation));
      textFX.setText(intToStr(whirl.flow));
      cbFollowX.setSelected(whirl.followX);
      cbFollowY.setSelected(whirl.followY);
      cbBounceX.setSelected(whirl.bounceX);
      cbBounceY.setSelected(whirl.bounceY);
      labelVel.setVisible(true);
      textVX.setVisible(true);
      textVY.setVisible(true);
      labelRange.setVisible(true);
      textRange.setVisible(true);
      labelDiam.setVisible(false);
      textDiam.setVisible(false);
      labelDim.setVisible(false);
      textWid.setVisible(false);
      textHei.setVisible(false);
      labelAngle.setVisible(false);
      textAngle.setVisible(false);
      labelARot.setVisible(false);
      textARot.setVisible(false);
      labelRot.setVisible(true);
      textRot.setVisible(true);
      labelFlow.setVisible(true);
      textFX.setVisible(true);
      textFY.setVisible(false);
      cbFollowX.setVisible(true);
      cbFollowY.setVisible(true);
      cbBounceX.setVisible(true);
      cbBounceY.setVisible(true);
      buttonColor.setVisible(true);
    }
    for(Flow o: flows) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Flow Properties");
      flow = o;
      textX.setText(intToStr(flow.pos.x));
      textY.setText(intToStr(flow.pos.y));
      textVX.setText(intToStr(flow.vel.x));
      textVY.setText(intToStr(flow.vel.y));
      textFX.setText(intToStr(flow.flow.x));
      textFY.setText(intToStr(flow.flow.y));
      textRange.setText(intToStr(flow.range));
      cbFollowX.setSelected(flow.followX);
      cbFollowY.setSelected(flow.followY);
      labelVel.setVisible(true);
      textVX.setVisible(true);
      textVY.setVisible(true);
      labelRange.setVisible(true);
      textRange.setVisible(true);
      labelDiam.setVisible(false);
      textDiam.setVisible(false);
      labelDim.setVisible(false);
      textWid.setVisible(false);
      textHei.setVisible(false);
      labelAngle.setVisible(false);
      textAngle.setVisible(false);
      labelARot.setVisible(false);
      textARot.setVisible(false);
      labelRot.setVisible(false);
      textRot.setVisible(false);
      labelFlow.setVisible(true);
      textFX.setVisible(true);
      textFY.setVisible(true);
      cbFollowX.setVisible(true);
      cbFollowY.setVisible(true);
      cbBounceX.setVisible(false);
      cbBounceY.setVisible(false);
      buttonColor.setVisible(false);
    }
    for(Rock o: rocks) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Rock Properties");
      rock = o;
      textX.setText(intToStr(rock.pos.x));
      textY.setText(intToStr(rock.pos.y));
      textVX.setText(intToStr(rock.vel.x));
      textVY.setText(intToStr(rock.vel.y));
      textDiam.setText(intToStr(rock.diam));
      cbFollowX.setSelected(rock.followX);
      cbFollowY.setSelected(rock.followY);
      cbBounceX.setSelected(rock.bounceX);
      cbBounceY.setSelected(rock.bounceY);
      labelVel.setVisible(true);
      textVX.setVisible(true);
      textVY.setVisible(true);
      labelRange.setVisible(false);
      textRange.setVisible(false);
      labelDiam.setVisible(true);
      textDiam.setVisible(true);
      labelDim.setVisible(false);
      textWid.setVisible(false);
      textHei.setVisible(false);
      labelAngle.setVisible(false);
      textAngle.setVisible(false);
      labelARot.setVisible(false);
      textARot.setVisible(false);
      labelRot.setVisible(false);
      textRot.setVisible(false);
      labelFlow.setVisible(false);
      textFX.setVisible(false);
      textFY.setVisible(false);
      cbFollowX.setVisible(true);
      cbFollowY.setVisible(true);
      cbBounceX.setVisible(true);
      cbBounceY.setVisible(true);
      buttonColor.setVisible(true);
    }
    for(Trunk o: trunks) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Trunk Properties");
      trunk = o;
      textX.setText(intToStr(trunk.pos.x));
      textY.setText(intToStr(trunk.pos.y));
      textVX.setText(intToStr(trunk.vel.x));
      textVY.setText(intToStr(trunk.vel.y));
      textWid.setText(intToStr(trunk.w));
      textHei.setText(intToStr(trunk.h));
      textAngle.setText(floatToStr(trunk.angle));
      textARot.setText(floatToStr(trunk.aRot));
      cbFollowX.setSelected(trunk.followX);
      cbFollowY.setSelected(trunk.followY);
      cbBounceX.setSelected(trunk.bounceX);
      cbBounceY.setSelected(trunk.bounceY);
      labelVel.setVisible(true);
      textVX.setVisible(true);
      textVY.setVisible(true);
      labelRange.setVisible(false);
      textRange.setVisible(false);
      labelDiam.setVisible(false);
      textDiam.setVisible(false);
      labelDim.setVisible(true);
      textWid.setVisible(true);
      textHei.setVisible(true);
      labelAngle.setVisible(true);
      textAngle.setVisible(true);
      labelARot.setVisible(true);
      textARot.setVisible(true);
      labelRot.setVisible(false);
      textRot.setVisible(false);
      labelFlow.setVisible(false);
      textFX.setVisible(false);
      textFY.setVisible(false);
      cbFollowX.setVisible(true);
      cbFollowY.setVisible(true);
      cbBounceX.setVisible(true);
      cbBounceY.setVisible(true);
      buttonColor.setVisible(true);
    }
    for(Leaf o: leafs) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Leaf Properties");
      leaf = o;
      textX.setText(intToStr(leaf.pos.x));
      textY.setText(intToStr(leaf.pos.y));
      labelVel.setVisible(false);
      textVX.setVisible(false);
      textVY.setVisible(false);
      labelRange.setVisible(false);
      textRange.setVisible(false);
      labelDiam.setVisible(false);
      textDiam.setVisible(false);
      labelDim.setVisible(false);
      textWid.setVisible(false);
      textHei.setVisible(false);
      labelAngle.setVisible(false);
      textAngle.setVisible(false);
      labelARot.setVisible(false);
      textARot.setVisible(false);
      labelRot.setVisible(false);
      textRot.setVisible(false);
      labelFlow.setVisible(false);
      textFX.setVisible(false);
      textFY.setVisible(false);
      cbFollowX.setVisible(false);
      cbFollowY.setVisible(false);
      cbBounceX.setVisible(false);
      cbBounceY.setVisible(false);
      buttonColor.setVisible(true);
    }
    for(Exit o: exits) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Exit Properties");
      exit = o;
      textX.setText(intToStr(exit.pos.x));
      textY.setText(intToStr(exit.pos.y));
      textRange.setText(intToStr(exit.range));
      labelVel.setVisible(false);
      textVX.setVisible(false);
      textVY.setVisible(false);
      labelRange.setVisible(true);
      textRange.setVisible(true);
      labelDiam.setVisible(false);
      textDiam.setVisible(false);
      labelDim.setVisible(false);
      textWid.setVisible(false);
      textHei.setVisible(false);
      labelAngle.setVisible(false);
      textAngle.setVisible(false);
      labelARot.setVisible(false);
      textARot.setVisible(false);
      labelRot.setVisible(false);
      textRot.setVisible(false);
      labelFlow.setVisible(false);
      textFX.setVisible(false);
      textFY.setVisible(false);
      cbFollowX.setVisible(false);
      cbFollowY.setVisible(false);
      cbBounceX.setVisible(false);
      cbBounceY.setVisible(false);
      buttonColor.setVisible(true);
    }
    for(Star o: stars) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Star Properties");
      star = o;
      textX.setText(intToStr(star.pos.x));
      textY.setText(intToStr(star.pos.y));
      textVX.setText(intToStr(star.vel.x));
      textVY.setText(intToStr(star.vel.y));
      textDiam.setText(intToStr(star.diam));
      cbFollowX.setSelected(star.followX);
      cbFollowY.setSelected(star.followY);
      cbBounceX.setSelected(star.bounceX);
      cbBounceY.setSelected(star.bounceY);
      labelVel.setVisible(true);
      textVX.setVisible(true);
      textVY.setVisible(true);
      labelRange.setVisible(false);
      textRange.setVisible(false);
      labelDiam.setVisible(true);
      textDiam.setVisible(true);
      labelDim.setVisible(false);
      textWid.setVisible(false);
      textHei.setVisible(false);
      labelAngle.setVisible(false);
      textAngle.setVisible(false);
      labelARot.setVisible(false);
      textARot.setVisible(false);
      labelRot.setVisible(false);
      textRot.setVisible(false);
      labelFlow.setVisible(false);
      textFX.setVisible(false);
      textFY.setVisible(false);
      cbFollowX.setVisible(true);
      cbFollowY.setVisible(true);
      cbBounceX.setVisible(true);
      cbBounceY.setVisible(true);
      buttonColor.setVisible(true);
    }
    for(Killer o: killers) if(o.pos.dist(pos) <= s / 2) {
      panelProperties.setVisible(true);
      panelProperties.setText("Killer Properties");
      killer = o;
      textX.setText(intToStr(killer.pos.x));
      textY.setText(intToStr(killer.pos.y));
      textVX.setText(intToStr(killer.vel.x));
      textVY.setText(intToStr(killer.vel.y));
      textDiam.setText(intToStr(killer.diam));
      cbFollowX.setSelected(killer.followX);
      cbFollowY.setSelected(killer.followY);
      cbBounceX.setSelected(killer.bounceX);
      cbBounceY.setSelected(killer.bounceY);
      labelVel.setVisible(true);
      textVX.setVisible(true);
      textVY.setVisible(true);
      labelRange.setVisible(false);
      textRange.setVisible(false);
      labelDiam.setVisible(true);
      textDiam.setVisible(true);
      labelDim.setVisible(false);
      textWid.setVisible(false);
      textHei.setVisible(false);
      labelAngle.setVisible(false);
      textAngle.setVisible(false);
      labelARot.setVisible(false);
      textARot.setVisible(false);
      labelRot.setVisible(false);
      textRot.setVisible(false);
      labelFlow.setVisible(false);
      textFX.setVisible(false);
      textFY.setVisible(false);
      cbFollowX.setVisible(true);
      cbFollowY.setVisible(true);
      cbBounceX.setVisible(true);
      cbBounceY.setVisible(true);
      buttonColor.setVisible(true);
    }
  }
}

void mousePressed() {
  clickPos.set(mouseX, mouseY);
}

void mouseDragged() {
  if(mouseY < 40) return;
  if(panelProperties.isVisible() && mouseX < 136 && mouseY < 312) return;
  center.sub(PVector.mult(PVector.sub(new PVector(mouseX, mouseY), clickPos), sliderScale.getValueF()));
  clickPos.set(mouseX, mouseY);
}

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
          trunks.add(new Trunk(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("w"), o.getInt("h"), o.getFloat("angle"), new PVector(o.getInt("vx", 0), o.getInt("vy", 0)), o.getFloat("aRot", 0), o.getBoolean("followx", false), o.getBoolean("followy", false), o.getBoolean("bouncex", false), o.getBoolean("bouncey", false), o.getInt("color", color(255))));
          break;
        case "leaf":
          leafs.add(new Leaf(new PVector(o.getInt("x"), o.getInt("y")), o.getInt("color", color(255))));
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
    json.setInt("version", 1);
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
      if(o.angle != 0) jsonNode.setFloat("angle", o.angle);
      if(o.aRot != 0) jsonNode.setFloat("aRot", o.aRot);
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
      if(o.c != color(255)) jsonNode.setInt("color", o.c);
      jsonNodes.setJSONObject(jsonNodes.size(), jsonNode);
    }
    for(Exit o: exits) {
      JSONObject jsonNode = new JSONObject();
      jsonNode.setString("type", "exit");
      jsonNode.setInt("x", (int)o.pos.x); jsonNode.setInt("y", (int)o.pos.y);
      if(o.range != defaultRange) jsonNode.setInt("range", o.range);
      if(o.c != color(255, 0)) jsonNode.setInt("color", o.c);
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
    json.setJSONArray("obj", jsonNodes);
    saveJSONObject(json, path);
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

boolean isInt(String s) {
  return !(Float.isNaN(int(s)));
}

String intToStr(int n) {
  return str(n);
}

String intToStr(float n) {
  return str((int)n);
}

int strToInt(String s) {
  return int(s);
}

String floatToStr(float n) {
  return str(n);
}

float strToFloat(String s) {
  return float(s);
}

int sign(float v) {
  if(v == 0) return 1;
  else return (int)(abs(v) / v);
}
