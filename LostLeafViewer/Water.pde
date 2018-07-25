class Water {
  PVector pos, mov;
  int wdx, wdy;
  float delta;
  color c;
  Water() {
    pos = new PVector(random(rotate ? -height * 0.5 / scale : -width * 0.5 / scale, rotate ? height * 0.5 / scale : width * 0.5 / scale) + center.x, random(-height * 0.5 / scale, height * 0.5 / scale) + center.y);
    mov = new PVector(0, 0);
    delta = random(1, 4);
    c = color(random(min(red(c1), red(c2)), max(red(c1), red(c2))), random(min(green(c1), green(c2)), max(green(c1), green(c2))), random(min(blue(c1), blue(c2)), max(blue(c1), blue(c2))), random(min(alpha(c1), alpha(c2)), max(alpha(c1), alpha(c2))));
    wdy = int(height * 0.5 / scale);
    if(rotate) wdx = wdy;
    else wdx = int(width * 0.5 / scale);
  }

  void update() {
    mov.set(0, 0);

    for(Flow f: flows) {
      if(pos.dist(f.pos) < f.range) mov.add(PVector.mult(f.flow, dt));
    }

    for(Whirl w: whirls) {
      if(pos.dist(w.pos) < w.range) {
        PVector d = PVector.sub(pos, w.pos);
        PVector r = d.copy();
        float len = d.mag();
        r.rotate(w.rotation * 100 / (len * len) * dt);
        mov.add(PVector.sub(r, d));
        mov.add(r.setMag(-w.flow * 100 / (len) * dt));
      }
    }

    for(Obstacle o: rocks) updateO(o);
    for(Trunk t: trunks) for(Obstacle o: t.obstacles) updateO(o);
    mov.mult(1.5);
    pos.add(mov);

    delta -= dt;
    if(delta < 0) {
      delta = random(1, 4);
      pos.set(random(-wdx, wdx) + center.x, random(-wdy, wdy) + center.y);
    }
    fill(c);
    ellipse((int)(pos.x - center.x), (int)(pos.y - center.y), 96, 96);
  }

  void updateO(Obstacle o) {
    if(pos.dist(o.pos) < o.diam * 2) {
      PVector d = PVector.sub(pos, o.pos);
      PVector m = mov.copy();
      float len = d.mag();
      float v = mov.mag();
      float dot = m.normalize().dot(d.normalize());
      float cross = m.cross(d).z;
      mov.add(new PVector(dot, cross).mult(v * o.diam * o.diam / 2 / (len * len)).rotate(mov.heading()));
    }
  }
}
