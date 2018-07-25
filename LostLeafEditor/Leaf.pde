class Leaf {
  PVector pos;
  color c;
  int radius;

  Leaf(PVector p) {
    this(p, color(255));
  }

  Leaf(PVector p, color co) {
    pos = p;
    c = co;
    radius = 0;
  }

  void update() {
    fill(c);
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(pos.x - center.x, pos.y - center.y);
    triangle(20, 0, -20, -15, -20, 15);
    fill(255);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
