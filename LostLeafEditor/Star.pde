class Star {
  PVector pos, vel;
  int diam;
  boolean followX, followY, bounceX, bounceY;
  color c;

  int m;

  Star(PVector p) {
    this(p, 50, new PVector(0, 0), false, false, false, false, color(255));
  }

  Star(PVector p, int d, PVector v, boolean fx, boolean fy, boolean bx, boolean by, color co) {
    pos = p;
    diam = d;
    vel = v;
    followX = fx;
    followY = fy;
    bounceX = bx;
    bounceY = by;
    c = co;
  }

  void update() {
    m = millis();
    noFill();
    strokeWeight(6);
    stroke(c);
    pushMatrix();
    translate(pos.x - center.x, pos.y - center.y);
    rotate(m / 1200.0);
    line(-diam / 2, 0, diam / 2, 0);
    line(0, -diam / 2, 0, diam / 2);
    line(0.7 * (-diam / 2), 0.7 * (diam / 2), 0.7 * (diam / 2), 0.7 * (-diam / 2));
    line(0.7 * (-diam / 2), 0.7 * (-diam / 2), 0.7 * (diam / 2), 0.7 * (diam / 2));
    strokeWeight(1);
    stroke(0);
    fill(255);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
