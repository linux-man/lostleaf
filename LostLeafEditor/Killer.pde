class Killer {
  PVector pos, vel;
  int diam;
  boolean followX, followY, bounceX, bounceY;
  color c;

  Killer(PVector p) {
    this(p, 50, new PVector(0, 0), false, false, false, false, color(255));
  }

  Killer(PVector p, int d, PVector v, boolean fx, boolean fy, boolean bx, boolean by, color co) {
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
    int m = millis();
    fill(c);
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(pos.x - center.x, pos.y - center.y);
    rotate(m / 600.0);
    for(float n = 0; n < TWO_PI; n += HALF_PI / 2) arc(0, 0, diam * 4/5, diam * 4/5, n, n + QUARTER_PI / 2);      
    for(float n = QUARTER_PI / 2; n < TWO_PI; n += HALF_PI / 2) arc(0, 0, diam, diam, n, n + QUARTER_PI / 2);         
    fill(255);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
