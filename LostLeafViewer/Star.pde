class Star extends Obstacle {
  color c;
  boolean catched;

  int m;

  Star(PVector p, int d, PVector v, boolean fx, boolean fy, boolean bx, boolean by, color co) {
    super(p, d, v, fx, fy, bx, by);
    c = co;
    catched = false;
  }

  void update() {
    super.update();
    m = millis();
    stroke(c);
    translate((int)(pos.x - center.x), (int)(pos.y - center.y));
    rotate(m / 1200.0);
    line(-diam / 2, 0, diam / 2, 0);
    line(0, -diam / 2, 0, diam / 2);
    line(0.7 * (-diam / 2), 0.7 * (diam / 2), 0.7 * (diam / 2), 0.7 * (-diam / 2));
    line(0.7 * (-diam / 2), 0.7 * (-diam / 2), 0.7 * (diam / 2), 0.7 * (diam / 2));
    rotate(-m / 1200.0);
    translate(-(int)(pos.x - center.x), -(int)(pos.y - center.y));
  }
}
