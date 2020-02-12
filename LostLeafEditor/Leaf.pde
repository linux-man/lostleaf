class Leaf {
  PVector pos;
  int diam;
  color c;

  Leaf(PVector p) {
    this(p, 40, color(255));
  }

  Leaf(PVector p, int d, color co) {
    pos = p;
    c = co;
    diam = d;
  }

  void update() {
    fill(c);
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(pos.x - center.x, pos.y - center.y);
    pushMatrix();
    scale(diam / 40.0);
    triangle(20, 0, -20, -15, -20, 15);
    popMatrix();
    fill(255);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
