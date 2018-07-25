class Rock extends Obstacle {
  color c;

  Rock(PVector p) {
    this(p, 50);
  }

  Rock(PVector p, int d) {
    super(p, d);
    c = color(random(min(red(rc1), red(rc2)), max(red(rc1), red(rc2))), random(min(green(rc1), green(rc2)), max(green(rc1), green(rc2))), random(min(blue(rc1), blue(rc2)), max(blue(rc1), blue(rc2))), random(min(alpha(rc1), alpha(rc2)), max(alpha(rc1), alpha(rc2))));
  }

  Rock(PVector p, int d, PVector v, boolean fx, boolean fy, boolean bx, boolean by, color co) {
    super(p, d, v, fx, fy, bx, by);
    c = co;
  }

  void update() {
    super.update();
    fill(c);
    ellipse((int)(pos.x - center.x), (int)(pos.y - center.y), diam, diam);
  }
}
