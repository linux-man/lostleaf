class Killer extends Obstacle {
  color c;

  Killer(PVector p) {
    this(p, 50);
  }

  Killer(PVector p, int d) {
    super(p, d);
    c = color(random(min(red(rc1), red(rc2)), max(red(rc1), red(rc2))), random(min(green(rc1), green(rc2)), max(green(rc1), green(rc2))), random(min(blue(rc1), blue(rc2)), max(blue(rc1), blue(rc2))), random(min(alpha(rc1), alpha(rc2)), max(alpha(rc1), alpha(rc2))));
  }

  Killer(PVector p, int d, PVector v, boolean fx, boolean fy, boolean bx, boolean by, color co) {
    super(p, d, v, fx, fy, bx, by);
    c = co;
  }

  void update() {
    super.update();
    int m = millis();
    fill(c);
    translate((int)(pos.x - center.x), (int)(pos.y - center.y));
    rotate(m / 600.0);
    for(float n = 0; n < TWO_PI; n += HALF_PI / 2) arc(0, 0, diam * 4/5, diam * 4/5, n, n + QUARTER_PI / 2);      
    for(float n = QUARTER_PI / 2; n < TWO_PI; n += HALF_PI / 2) arc(0, 0, diam, diam, n, n + QUARTER_PI / 2);         
    rotate(-m / 600.0);
    translate(-(int)(pos.x - center.x), -(int)(pos.y - center.y));
  }
}
