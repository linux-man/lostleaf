class Exit {
  PVector pos;
  int range;
  color c;
  boolean save;
  
 
  Exit(PVector p) {
    this(p, 200, color(255, 0), true);
  }

  Exit(PVector p, int r, color co, boolean s) {
    pos = p;
    range = r;
    c = co;
    save = s;
  }

  void update() {
    fill(255);
    strokeWeight(1);
    stroke(0);
    ellipse(pos.x - center.x, pos.y - center.y, 10, 10);
    noFill();
    stroke(255, 255, 0);
    ellipse(pos.x - center.x, pos.y - center.y, range * 2, range * 2);
  }
}
