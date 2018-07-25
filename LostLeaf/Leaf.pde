class Leaf {
  PVector pos, mov;
  color c;
  //int radius;

  float ds;
  int touched, crunched;
  boolean sucked, saved;

  Leaf(PVector p, color co) {
    pos = p;
    c = co;
    mov = new PVector(0, 0);
    sucked = false;
    saved = false;
    ds = 1;
    //radius = 0;
  }

  void update() {
    if(!(sucked || saved)) {
      mov.set(0, 0);

      for(Flow o: flows) {
        if(pos.dist(o.pos) < o.range) mov.add(PVector.mult(o.flow, dt));
      }

      for(Whirl o: whirls) {
        if(pos.dist(o.pos) < o.range) {
          PVector d = PVector.sub(pos, o.pos);
          PVector r = d.copy();
          float len = d.mag();
          r.rotate(o.rotation * 100 / (len * len) * dt);
          mov.add(PVector.sub(r, d));
          mov.add(r.setMag(-o.flow * 100 / (len) * dt));
          if(len < o.flow * 100 / (len) * dt) sucked = true;
        }
      }

      for(Killer o: killers) {
        if(pos.dist(o.pos) < o.diam / 2) sucked = true;
      }

      crunched = 0;
      touched = 0;
      for(Obstacle o: rocks) updateO(o);
      crunched = touched;
      for(Trunk t: trunks) {
        touched = 0;
        for(Obstacle o: t.obstacles) updateO(o);
        if(touched > 0) crunched++;
      }
      if(crunched > 1) sucked = true;

      for(Exit o: exits) {
        if(pos.dist(o.pos) < o.range) saved = true;
      }

      for(Star o: stars) {
        if(pos.dist(o.pos) < o.diam / 2) o.catched = true;
      }
      pos.add(mov);
    }
    fill(c);
    translate((int)(pos.x - center.x), (int)(pos.y - center.y));
    rotate(mov.heading());
    if(sucked) ds += dt * 3;
    else if(saved) ds -= dt * 3 / 4;
    scale(1 / ds);
    triangle(20, 0, -20, -15, -20, 15);
    scale(ds);
    rotate(-mov.heading());
    translate(-(int)(pos.x - center.x), -(int)(pos.y - center.y));
  }

  void updateO(Obstacle o) {
    if(pos.dist(o.pos) < o.diam * 2) {
      PVector d = PVector.sub(pos, o.pos);
      PVector m = mov.copy();
      float len = d.mag();//float len = d.mag() - radius;
      float v = mov.mag();
      float dot = m.normalize().dot(d.normalize());
      float cross = m.cross(d).z;
      mov.add(new PVector(dot, cross).mult(v * o.diam * o.diam / 2 / (len * len)).rotate(mov.heading()));
      if(pos.dist(o.pos) < o.diam * 3 / 4) touched++;
    }
  }
}
