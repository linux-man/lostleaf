/*
Lost Leaf is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Lost Leaf is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Lost Leaf.  If not, see <http://www.gnu.org/licenses/>.
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
ArrayList<Area> areas = new ArrayList<Area>();

Rock rock;
Trunk trunk;
Flow flow;
Whirl whirl;
Leaf leaf;
Exit exit;
Star star;
Killer killer;
Area area;

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
  panelAreaProperties.setVisible(false);
  panelAreaProperties.moveTo(0, 24);
  panelLevel.moveTo(264, 0);
  panelNew.moveTo(376, 0);
  panelLevel.setCollapsed(true);
  panelNew.setCollapsed(true);
  buttonAreaDel.addEventHandler(this, "buttonDel_click");
  buttonAreaMove.addEventHandler(this, "buttonMove_click");
  buttonAreaClone.addEventHandler(this, "buttonClone_click");
  cbAreaFollowX.addEventHandler(this, "cbFollowX_clicked");
  cbAreaFollowY.addEventHandler(this, "cbFollowY_clicked");
  cbAreaBounceX.addEventHandler(this, "cbBounceX_clicked");
  cbAreaBounceY.addEventHandler(this, "cbBounceY_clicked");
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
  for(Area o: areas) o.update();

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
  if(overGUI()) return;
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
      else if(area != null) area.pos.set(pos);
    }
    else if(clone) {
      if(exit != null) exits.add(new Exit(pos.copy(), exit.range, exit.c, exit.save));
      else if(leaf != null) leafs.add(new Leaf(pos.copy(), leaf.diam, leaf.c, leaf.primary));
      else if(whirl != null) whirls.add(new Whirl(pos.copy(), whirl.flow, whirl.rotation, whirl.range, whirl.vel, whirl.followX, whirl.followY, whirl.bounceX, whirl.bounceY, whirl.c));
      else if(flow != null) flows.add(new Flow(pos.copy(), flow.flow, flow.range, flow.vel, flow.followX, flow.followY));
      else if(trunk != null) trunks.add(new Trunk(pos.copy(), trunk.w, trunk.h, trunk.angle, trunk.vel, trunk.aRot, trunk.followX, trunk.followY, trunk.bounceX, trunk.bounceY, trunk.c));
      else if(rock != null) rocks.add(new Rock(pos.copy(), rock.diam, rock.vel, rock.followX, rock.followY, rock.bounceX, rock.bounceY, rock.c));
      else if(star != null) stars.add(new Star(pos.copy(), star.diam, star.vel, star.followX, star.followY, star.bounceX, star.bounceY, star.c));
      else if(killer != null) killers.add(new Killer(pos.copy(), killer.diam, killer.vel, killer.followX, killer.followY, killer.bounceX, killer.bounceY, killer.c));
      else if(area != null) areas.add(new Area(pos.copy(), area.velMin, area.velMax, area.w, area.h, area.seed, area.object, area.quantMin, area.quantMax, area.diamMin, area.diamMax,
      area.flowMin, area.flowMax, area.rotationMin, area.rotationMax, area.rangeMin, area.rangeMax, area.followX, area.followY, area.bounceX, area.bounceY, area.c1, area.c2));
    }

    panelProperties.setVisible(false);
    panelAreaProperties.setVisible(false);
    whirl = null;
    flow = null;
    rock = null;
    trunk = null;
    leaf = null;
    exit = null;
    star = null;
    killer = null;
    area = null;
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
      cbPrimaryLeaf.setVisible(false);
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
      cbPrimaryLeaf.setVisible(false);
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
      showHideRKS();
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
      textAngle.setText(intToStr(trunk.angle));
      textARot.setText(intToStr(trunk.aRot));
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
      cbPrimaryLeaf.setVisible(false);
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
      textDiam.setText(intToStr(leaf.diam));
      labelVel.setVisible(false);
      textVX.setVisible(false);
      textVY.setVisible(false);
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
      cbPrimaryLeaf.setText("Primary");
      cbPrimaryLeaf.setVisible(true);
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
      cbPrimaryLeaf.setSelected(exit.save);
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
      cbPrimaryLeaf.setText("Save");
      cbPrimaryLeaf.setVisible(true);
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
      showHideRKS();
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
      showHideRKS();
    }
    for(Area o: areas) if(o.pos.dist(pos) <= s / 2) {
      panelAreaProperties.setVisible(true);
      area = o;
      textAreaX.setText(intToStr(area.pos.x));
      textAreaY.setText(intToStr(area.pos.y));
      textAreaWid.setText(intToStr(area.w));
      textAreaHei.setText(intToStr(area.h));
      textAreaSeed.setText(intToStr(area.seed));
      dropListObj.setSelected(area.object);
      textMinQuant.setText(intToStr(area.quantMin));
      textMaxQuant.setText(intToStr(area.quantMax));
      textX.setText(intToStr(area.pos.x));
      textY.setText(intToStr(area.pos.y));
      textMinVX.setText(intToStr(area.velMin.x));
      textMinVY.setText(intToStr(area.velMin.y));
      textMaxVX.setText(intToStr(area.velMax.x));
      textMaxVY.setText(intToStr(area.velMax.y));
      cbAreaFollowX.setSelected(area.followX);
      cbAreaFollowY.setSelected(area.followY);
      cbAreaBounceX.setSelected(area.bounceX);
      cbAreaBounceY.setSelected(area.bounceY);
      //Rocks, Stars, Killers
      textMinDiam.setText(intToStr(area.diamMin));
      textMaxDiam.setText(intToStr(area.diamMax));
      //Whirls
      textMinRange.setText(intToStr(area.rangeMin));
      textMaxRange.setText(intToStr(area.rangeMax));
      textMinRot.setText(intToStr(area.rotationMin));
      textMaxRot.setText(intToStr(area.rotationMax));
      textMinFlow.setText(intToStr(area.flowMin));
      textMaxFlow.setText(intToStr(area.flowMax));

      switch(area.object) {
        case 0: case 2: case 3://Rocks, Stars, Killers
          showHideAreaNonWhirls();
          break;
        case 1: 
          showHideAreaWhirls();
          break;
      }
    }
  }
}

void mousePressed() {
  clickPos.set(mouseX, mouseY);
}

void mouseDragged() {
  if(overGUI()) return;
  center.sub(PVector.mult(PVector.sub(new PVector(mouseX, mouseY), clickPos), sliderScale.getValueF()));
  clickPos.set(mouseX, mouseY);
}
