class Exit {
  PVector pos;
  int range;
  color c;
  boolean save;

  Exit(PVector p, int r, color co, boolean s) {
    pos = p;
    range = r;
    c = co;
    save = s;
  }
  
  void update() {
   fill(c);
   ellipse((int)(pos.x - center.x), (int)(pos.y - center.y), range * 2, range * 2); 
  }
}
