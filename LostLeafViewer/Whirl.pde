class Whirl {
  PVector pos, vel;
  int flow, rotation, range;
  boolean followX, followY, bounceX, bounceY;
  color c;

  int sign, addPi, r, f;
  boolean moving;

  Whirl(PVector p) {
    this(p, 0, 0, defaultRange, new PVector(0, 0), false, false, false, false, color(random(min(red(wc1), red(wc2)), max(red(wc1), red(wc2))), random(min(green(wc1), green(wc2)), max(green(wc1), green(wc2))), random(min(blue(wc1), blue(wc2)), max(blue(wc1), blue(wc2))), random(min(alpha(wc1), alpha(wc2)), max(alpha(wc1), alpha(wc2)))));
  }

  Whirl(PVector p, int fl, int ro, int ra, PVector v, boolean fx, boolean fy, boolean bx, boolean by, color co) {
    pos = p;
    flow = fl;
    rotation = ro;
    range = ra;
    vel = v;
    followX = fx;
    followY = fy;
    bounceX = bx;
    bounceY = by;
    c = co;

    moving = vel.magSq() > 0;
  }

  void update() {
    if(moving) {
      move(PVector.mult(vel, dt));
      if(bounceX || bounceY) {
        for(Obstacle o: rocks) if(pos.dist(o.pos) < o.diam) {
          if(bounceX) vel.x = ((pos.x < o.pos.x) ? -1 : 1) * abs(vel.x);
          if(bounceY) vel.y = ((pos.y < o.pos.y) ? -1 : 1) * abs(vel.y);
        }
        for(Trunk t: trunks) {
          for(Obstacle o: t.obstacles) if(pos.dist(o.pos) < o.diam) {
            if(bounceX) vel.x = ((pos.x < o.pos.x) ? -1 : 1) * abs(vel.x);
            if(bounceY) vel.y = ((pos.y < o.pos.y) ? -1 : 1) * abs(vel.y);
          }
        }
      }
    }
    if(followX) pos.add(dif.x, 0);
    if(followY) pos.add(0, dif.y);
    sign = sign(rotation);
    r = max(abs(flow), 50);
    f = (flow == 0) ? 0 : 20;
    addPi = (sign > 0) ? 1 : 0;
    stroke(c);
    int m = millis();
    translate((int)(pos.x - center.x), (int)(pos.y - center.y));
    rotate(m / 120000.0 * rotation);
    ellipse(0, 0, f * 2, f * 2);
    if(rotation != 0) {
      for(int n = 0; n < 8; n ++) {
        rotate(QUARTER_PI);
        arc(sign * r / 2, r / 2 + f, r * sqrt(2), r * sqrt(2), -QUARTER_PI + PI * addPi, QUARTER_PI + PI * addPi);
      }
    }
    rotate(-TWO_PI);
    rotate(-m / 120000.0 * rotation);    
    translate(-(int)(pos.x - center.x), -(int)(pos.y - center.y));
  }

  void change(int fl, int ro) {
    flow = fl;
    rotation = ro;
  }

  void move(PVector p) {
    pos.add(p);    
  }
}
