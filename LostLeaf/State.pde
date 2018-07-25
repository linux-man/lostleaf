class State {
  
  void draw() {}
  void touchStarted() {}

  void touchMoved() {}

  void touchEnded() {}

  void mousePressed() {
    touchStarted();
  }

  void mouseDragged() {
    touchMoved();
  }

  void mouseReleased() {
    touchEnded();
  }
}
