class Flow {
  PVector pos, flow, vel;
  int range;
  boolean followX, followY;

  Flow(PVector p, PVector f, int r, PVector v, boolean fx, boolean fy) {
    pos = p;
    flow = f;
    range = r;
    vel = v;
    followX = fx;
    followY = fy;
  }

  void update() {
    if(vel.magSq() > 0) move(PVector.mult(vel, dt));
    if(followX) pos.add(dif.x, 0);
    if(followY) pos.add(0, dif.y);
  }

  void change(PVector p) {
    pos.set(p);    
  }

  void move(PVector p) {
    pos.add(p);    
  }
}
