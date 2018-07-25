class Whirl {
  PVector pos, vel;
  int flow, rotation, range;
  boolean followX, followY, bounceX, bounceY;
  color c;
  
  int sign, addPi, r, f;

  Whirl(PVector p) {
    this(p, 100, 100, defaultRange, new PVector(0, 0), false, false, false, false, color(255));
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
  }

  void update() {
    sign = sign(rotation);
    r = max(abs(flow), 40);
    f = (flow == 0) ? 0 : 20;
    addPi = (sign > 0) ? 1 : 0;
    strokeWeight(6);
    stroke(c);
    noFill();
    int m = millis();
    pushMatrix();
    translate(pos.x - center.x, pos.y - center.y);
    rotate(m / 120000.0 * rotation);
    ellipse(0, 0, f * 2, f * 2);
    if(rotation != 0) {
      for(int n = 0; n < 8; n ++) {
        rotate(QUARTER_PI);
        arc(sign * r / 2, r / 2 + f, r * 1.4142, r * 1.4142, -QUARTER_PI + PI * addPi, QUARTER_PI + PI * addPi);
      }
    }
    strokeWeight(1);
    ellipse(0, 0, range * 2, range * 2);
    fill(255);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
