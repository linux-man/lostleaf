class Obstacle {
  PVector pos, vel;
  int diam;
  boolean followX, followY, bounceX, bounceY;

  boolean moving;

  Obstacle(PVector p, int d) {
    this(p, d, new PVector(0, 0), false, false, false, false);
  }

  Obstacle(PVector p, int d, PVector v, boolean fx, boolean fy, boolean bx, boolean by) {
    pos = p;
    diam = d;
    vel = v;
    followX = fx;
    followY = fy;
    bounceX = bx;
    bounceY = by;

    moving = vel.magSq() > 0;
  }

  void update() {
    if(moving) {
      move(PVector.mult(vel, dt));
      
      if(bounceX || bounceY) {
        for(Obstacle o: rocks) if(o != this && pos.dist(o.pos) < (diam + o.diam) / 2) {
          if(bounceX) vel.x = ((pos.x < o.pos.x) ? -1 : 1) * abs(vel.x);
          if(bounceY) vel.y = ((pos.y < o.pos.y) ? -1 : 1) * abs(vel.y);
        }
        for(Trunk t: trunks) {
          for(Obstacle o: t.obstacles) if(pos.dist(o.pos) < (diam + o.diam) / 2) {
          if(bounceX) vel.x = ((pos.x < o.pos.x) ? -1 : 1) * abs(vel.x);
          if(bounceY) vel.y = ((pos.y < o.pos.y) ? -1 : 1) * abs(vel.y);
          }
        }
      }
    }
    if(followX) pos.add(dif.x, 0);
    if(followY) pos.add(0, dif.y);
  }

  void change(int d) {
    diam = d;
  }

  void move(PVector p) {
    pos.add(p);    
  }
}
