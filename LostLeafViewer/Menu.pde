class Menu extends State {
  Button [] buttons;
  PVector [] wd;
  PFont font;

  Menu() {
  }
  
  Menu(String link) {
    int n = 0;
    Table table = loadTable(link, "header,csv");
    int btnCount = table.getRowCount();
    int h = height / btnCount;
    buttons = new Button[btnCount];
    if(btnCount > 10) h = height / ((btnCount + 1) / 2);
    for(TableRow row : table.rows()) {
      if(btnCount > 10) {
        if (n % 2 == 0) buttons[n] = new Button(-width / 4, n / 2 * h - (h / 2 * (btnCount / 2 + btnCount % 2 - 1)), width * 5 / 12, h * 5 / 6, row.getString("label"), row.getString("link"), false, false);
        else buttons[n] = new Button(width / 4, (n - 1) / 2 * h - (h / 2 * (btnCount / 2 + btnCount % 2 - 1)), width * 5 / 12, h * 5 / 6, row.getString("label"), row.getString("link"), false, false);
      }
      else buttons[n] = new Button(0, n * h - (h / 2 * (btnCount - 1)), width * 5 / 6, h * 5 / 6, row.getString("label"), row.getString("link"), false, false);
      n++;
    }
    wd = new PVector[200];
    for(int w = 0; w < wd.length; w++) wd[w] = new PVector(random(-height / 2, height / 2), random(-height / 2, height / 2));
    font = createFont("Arvo-Regular_201.ttf", 24, true);
    textFont(font);
  }

  void draw() {
    background(0);
    translate(width / 2, height / 2);
    int m = millis();
    int r = height / 2;
    strokeWeight(width / 20);
    stroke(255, 32);
    noFill();
    rotate(m / 1200.0);
    for(int n = 0; n < 8; n ++) {
      rotate(QUARTER_PI);
      arc(r / 2, r / 2, r * 1.4142, r * 1.4142, -QUARTER_PI + PI, QUARTER_PI + PI);
    }
    noStroke();
    fill(255, 16);
    rotate(m / 600.0);
    for(PVector o: wd) ellipse(o.x, o.y, width / 6, width / 6);
    rotate(-m / 600.0);
    rotate(-m / 1200.0);
    for(Button b: buttons) b.draw();
  }
  
  void touchStarted() {
    for(Button b: buttons) b.touch();
  }

  void touchMoved() {
    for(Button b: buttons) b.touch();
  }
 
  void touchEnded() {
    for(Button b: buttons) b.touchEnded();
  }
}
