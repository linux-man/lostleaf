class Trunk {
  PVector pos, vel;
  int w, h;
  float angle, aRot;
  boolean followX, followY, bounceX, bounceY;
  color c;
  Obstacle[] obstacles;

  boolean moving;

  Trunk(PVector p) {
    this(p, 50, 50, 0, new PVector(0, 0), 0, false, false, false, false, color(random(min(red(tc1), red(tc2)), max(red(tc1), red(tc2))), random(min(green(tc1), green(tc2)), max(green(tc1), green(tc2))), random(min(blue(tc1), blue(tc2)), max(blue(tc1), blue(tc2))), random(min(alpha(tc1), alpha(tc2)), max(alpha(tc1), alpha(tc2)))));
  }

  Trunk(PVector p, int wi, int he, int a, PVector v, int ar, boolean fx, boolean fy, boolean bx, boolean by, color co) {
    pos = p;
    w = wi;
    h = he;
    angle = a * PI / 180;
    vel = v;
    aRot = ar * PI / 180;
    followX = fx;
    followY = fy;
    bounceX = bx;
    bounceY = by;
    c = co;

    moving = vel.magSq() > 0;

    int q = ceil(w / h) + 1;
    PVector v0 = PVector.fromAngle(angle).setMag(- w / 2 + h / 2);
    PVector vn = PVector.fromAngle(angle).setMag((w - h) / (q - 1));
    obstacles = new Obstacle[q];
    for(int n = 0; n < q; n++) obstacles[n] = new Obstacle(PVector.add(pos, v0).add(PVector.mult(vn, n)), h);
  }

  void update() {
    if(moving) {
      move(PVector.mult(vel, dt));
      if(bounceX || bounceY) {
        for(Obstacle o: rocks) if(pos.dist(o.pos) < o.diam / 2) {
          if(bounceX) vel.x = ((pos.x < o.pos.x) ? -1 : 1) * abs(vel.x);
          if(bounceY) vel.y = ((pos.y < o.pos.y) ? -1 : 1) * abs(vel.y);
        }
        for(Trunk t: trunks) {
          if(t != this) for(Obstacle o: t.obstacles) if(pos.dist(o.pos) < o.diam / 2) {
          if(bounceX) vel.x = ((pos.x < o.pos.x) ? -1 : 1) * abs(vel.x);
          if(bounceY) vel.y = ((pos.y < o.pos.y) ? -1 : 1) * abs(vel.y);
          }
        }
      }
    }
    if(followX) move(new PVector(dif.x, 0));
    if(followY) move(new PVector(0, dif.y));

    if(aRot != 0) rot(aRot * dt);
    fill(c);
    translate((int)(pos.x - center.x), (int)(pos.y - center.y));
    rotate(angle);
    rect(0, 0, w, h, h / 2);
    rotate(-angle);
    translate(-(int)(pos.x - center.x), -(int)(pos.y - center.y));
    /* To show Obstacles
    for(int n = 0; n < obstacles.length; n++) {
      ellipse(obstacles[n].pos.x, obstacles[n].pos.y, obstacles[n].diam, obstacles[n].diam);
    }
    */
  }

  void change(float a) {
    change(pos, w, a);
  }

  void change(PVector p) {
    change(p, w, angle);    
  }

  void change(int wi, float a) {
    change(pos, wi, a);
  }

  void change(PVector p, int wi, float a) {
    pos = p;
    w = wi;
    angle = a;

    int q = ceil(w / h) + 1;
    PVector v0 = PVector.fromAngle(angle).setMag(- w / 2 + h / 2);
    PVector vn = PVector.fromAngle(angle).setMag((w - h) / (q - 1));
    obstacles = new Obstacle[q];
    for(int n = 0; n < q; n++) obstacles[n] = new Obstacle(PVector.add(pos, v0).add(PVector.mult(vn, n)), h);
    /* Without width change
    PVector v0 = PVector.fromAngle(angle).setMag(- w / 2 + h / 2);
    PVector vn = PVector.fromAngle(angle).setMag((w - h) / (obstacles.length - 1));
    for(int n = 0; n < obstacles.length; n++) obstacles[n].pos.set(PVector.add(pos, v0).add(PVector.mult(vn, n)));
    */
  }

  void move(PVector p) {
    change(PVector.add(pos, p));    
  }

  void rot(float a) {
    change(angle + a);
  }
}
