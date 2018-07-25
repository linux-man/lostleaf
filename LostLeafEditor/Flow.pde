class Flow {
  PVector pos, flow, vel;
  int range;
  boolean followX, followY;

  Flow(PVector p) {
    this(p, new PVector(0, -50), defaultRange, new PVector(0, 0), false, false);
  }

  Flow(PVector p, PVector f, int r, PVector v, boolean fx, boolean fy) {
    pos = p;
    flow = f;
    range = r;
    vel = v;
    followX = fx;
    followY = fy;
  }

  void update() {
    fill(255);
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(pos.x - center.x, pos.y - center.y);
    ellipse(0, 0, 10, 10);
    PVector e = PVector.add(pos, flow);
    strokeWeight(6);
    stroke(255);
    line(0, 0, flow.x, flow.y);
    noFill();
    strokeWeight(1);
    ellipse(0, 0, range * 2, range * 2);
    popMatrix();
  }
}
