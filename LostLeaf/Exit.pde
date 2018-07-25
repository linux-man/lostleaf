class Exit {
  PVector pos;
  int range;
  color c;

  Exit(PVector p, int r, color co) {
    pos = p;
    range = r;
    c = co;
  }
  
  void update() {
   fill(c);
   ellipse((int)(pos.x - center.x), (int)(pos.y - center.y), range * 2, range * 2); 
  }
}
