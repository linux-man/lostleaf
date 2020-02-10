/*
Lost Leaf is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Lost Leaf is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Lost Leaf.  If not, see <http://www.gnu.org/licenses/>.
*/

import cassette.audiofiles.*;

State st;

SoundFile music, drop;

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
Table store;

void setup() {
  fullScreen();
  startSensors();
  orientation(PORTRAIT);
  maxTilt = 0;
  tilt = new PVector(0, 0);
  imageMode(CENTER);
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  defaultRange = 2000;
  music = new SoundFile(this, "deepblue.mp3");
  drop = new SoundFile(this, "waterdrop.mp3");
  music.loop();
  File f = new File(sketchPath("store.csv"));
  if(f.exists()) store = loadTable("store.csv", "header,csv");
  else {
    store = new Table();
    store.addColumn("link");
    saveTable(store, "store.csv", "header,csv");
  }
  pMillis = millis();
  st = new Splash();
}

void draw() {
  dt = (millis() - pMillis) / 1000.0;
  pMillis = millis();
  st.draw();
}

void touchStarted() {st.touchStarted();}

void touchMoved() {st.touchMoved();}

void touchEnded() {st.touchEnded();}

int sign(float v) {
  if(v == 0) return 1;
  else return (int)(abs(v) / v);
}
