/*
Lost Leaf is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Lost Leaf is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Backstage.  If not, see <http://www.gnu.org/licenses/>.
*/

State st;

Water[] water;

ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Trunk> trunks = new ArrayList<Trunk>();
ArrayList<Flow> flows = new ArrayList<Flow>();
ArrayList<Whirl> whirls = new ArrayList<Whirl>();
ArrayList<Leaf> leafs = new ArrayList<Leaf>();
ArrayList<Exit> exits = new ArrayList<Exit>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Killer> killers = new ArrayList<Killer>();

int pMillis, drops, defaultRange, maxTilt;
float dt, scale;
boolean rotate, tiltX, tiltY;
PVector center, tilt, dif;
color c1, c2, rc1, rc2, tc1, tc2, wc1, wc2;

void setup() {
  size(400, 700);
  maxTilt = 0;
  tilt = new PVector(0, 0);
  imageMode(CENTER);
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  defaultRange = 2000;
  pMillis = millis();
  st = new Menu("menu");
}

void draw() {
  dt = (millis() - pMillis) / 1000.0;
  pMillis = millis();
  st.draw();
}

void mousePressed() {st.touchStarted();}

void mouseDragged() {st.touchMoved();}

void mouseReleased() {st.touchEnded();}

int sign(float v) {
  if(v == 0) return 1;
  else return (int)(abs(v) / v);
}
