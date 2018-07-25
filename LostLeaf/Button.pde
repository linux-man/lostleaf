class Button {
  int x, y, w, h;
  String label, link;
  boolean pressed, locked, done;

  Button(int x, int y, int w, int h, String label, String link, boolean l, boolean d) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.link = link;
    this.locked = l;
    this.done = d;
  }

  void draw() {
    if(locked) fill(64, 128);
    else if(pressed) fill(255, 128);
    else if(done) fill(0, 192, 0, 128);
    else fill(128, 128);
    rect(x, y, w, h, h / 4);
    fill(255);
    text(label, x, y, w, h);
  }

  void touch() {
    pressed = isOver();
  }

  void touchEnded() {
    if(isOver()) {
      if(link.equals("exit")) st = new Credits();
      else if(link.endsWith(".ll")) st = new Intro(link);
      else st = new Menu(link);
    }
  }

  boolean isOver() {
    if(locked) return false;
    int x = this.x + width / 2;
    int y = this.y + height / 2;
    return (mouseX >= x - w / 2 && mouseX <= x + w / 2 && mouseY >= y - h / 2 && mouseY <= y + h / 2);
  }
}
