class Trunk {
  PVector pos, vel;
  int w, h;
  float angle, aRot;
  boolean followX, followY, bounceX, bounceY;
  color c;

  Trunk(PVector p) {
    this(p, 200, 50, 0, new PVector(0, 0), 0, false, false, false, false,color(255));
  }

  Trunk(PVector p, int wi, int he, float a, PVector v, float ar, boolean fx, boolean fy, boolean bx, boolean by, color co) {
    pos = p;
    w = wi;
    h = he;
    angle = a;
    vel = v;
    aRot = ar;
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
    //noStroke();
    pushMatrix();
    translate(pos.x - center.x, pos.y - center.y);
    rotate(angle);
    rect(0, 0, w, h, h / 2);
    fill(255);
    //strokeWeight(1);
    //stroke(0);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
