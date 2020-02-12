class Area {
  PVector pos, velMin, velMax;
  int w, h, seed, object, quantMin, quantMax, diamMin, diamMax, flowMin, flowMax, rotationMin, rotationMax, rangeMin, rangeMax;
  boolean followX, followY, bounceX, bounceY;
  color c1, c2;

  int m;

  Area(PVector p) {
    this(p, new PVector(0, 0), new PVector(10, 10), 100, 100, 0, 0, 1, 4,
    40, 60, 80, 120, 80, 120, defaultRange, defaultRange,
    false, false, false, false, color(255), color(255));
  }

  Area(PVector p, PVector velmin, PVector velmax, int wi, int he, int s, int obj, int quantmin, int quantmax,
  int diammin, int diammax, int flowmin, int flowmax, int rotationmin, int rotationmax, int rangemin, int rangemax,
  boolean followx, boolean followy, boolean bouncex, boolean bouncey, color co1, color co2) {
    pos = p;
    velMin = velmin;
    velMax = velmax;
    w = wi;
    h = he;
    seed = s;
    object = obj;
    quantMin = quantmin;
    quantMax = quantmax;
    diamMin = diammin;
    diamMax = diammax;
    flowMin = flowmin;
    flowMax = flowmax;
    rotationMin = rotationmin;
    rotationMax = rotationmax;
    rangeMin =rangemin;
    rangeMax = rangemax;
    followX =followx;
    followY =followy;
    bounceX = bouncex;
    bounceY = bouncey;
    c1 = co1;
    c2 = co2;
  }
  
  void update() {
    m = millis();
    stroke(0);
    fill(255);
    switch(object) {
      case 0://Rocks
        strokeWeight(1);
        ellipse(pos.x - center.x, pos.y - center.y, diamMax, diamMax);
        break;
      case 1://Whirls
        strokeWeight(6);
        stroke(255);
        noFill();
        pushMatrix();
        translate(pos.x - center.x, pos.y - center.y);
        rotate(m / 120000.0 * rotationMax);
        ellipse(0, 0, 40, 40);
        for(int n = 0; n < 8; n ++) {
          rotate(QUARTER_PI);
          arc(10, 30, 20 * 1.4142, 20 * 1.4142, -QUARTER_PI + PI, QUARTER_PI + PI);
        }
        popMatrix();
        break;
      case 2://Stars
        strokeWeight(6);
        stroke(255);
        pushMatrix();
        translate(pos.x - center.x, pos.y - center.y);
        rotate(m / 1200.0);
        line(-diamMax / 2, 0, diamMax / 2, 0);
        line(0, -diamMax / 2, 0, diamMax / 2);
        line(0.7 * (-diamMax / 2), 0.7 * (diamMax / 2), 0.7 * (diamMax / 2), 0.7 * (-diamMax / 2));
        line(0.7 * (-diamMax / 2), 0.7 * (-diamMax / 2), 0.7 * (diamMax / 2), 0.7 * (diamMax / 2));
        popMatrix();
        break;
      case 3://Killers
        pushMatrix();
        translate(pos.x - center.x, pos.y - center.y);
        rotate(m / 600.0);
        for(float n = 0; n < TWO_PI; n += HALF_PI / 2) arc(0, 0, diamMax * 4/5, diamMax * 4/5, n, n + QUARTER_PI / 2);      
        for(float n = QUARTER_PI / 2; n < TWO_PI; n += HALF_PI / 2) arc(0, 0, diamMax, diamMax, n, n + QUARTER_PI / 2);         
        popMatrix();
        break;
    }
    strokeWeight(1);
    noFill();
    stroke(255, 0, 0);
    rect(pos.x - center.x, pos.y - center.y, w, h);
    fill(255);
    stroke(0);
    ellipse(pos.x - center.x, pos.y - center.y, 10, 10);
    
  }
}
