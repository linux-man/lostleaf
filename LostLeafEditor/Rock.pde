class Rock {
  PVector pos, vel;
  int diam;
  boolean followX, followY, bounceX, bounceY;
  color c;

  Rock(PVector p) {
    this(p, 50, new PVector(0, 0), false, false, false, false, color(255));
  }

  Rock(PVector p, int d, PVector v, boolean fx, boolean fy, boolean bx, boolean by, color co) {
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
    fill(c);
    strokeWeight(1);
    stroke(0);
    ellipse(pos.x - center.x, pos.y - center.y, diam, diam);
    fill(255);
    ellipse(pos.x - center.x, pos.y - center.y, 10, 10);
  }
}
