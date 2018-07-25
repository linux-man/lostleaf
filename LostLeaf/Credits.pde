class Credits extends State {
  PFont font1, font2;

  Credits() {
    font1 = createFont("Arvo-Italic_201.ttf", 12 * displayDensity, true);
    font2 = createFont("Arvo-Regular_201.ttf", 12 * displayDensity, true);
    music.stop();
  }

  void draw() {
    noStroke();
    background(0);
    fill(255);
    textFont(font1);
    text("Developer", width / 2, height / 10, width, height / 10);
    textFont(font2);
    text("Caldas Lopes", width / 2, height * 2 / 10, width, height / 10);

    //textFont(font1);
    //text("Level Design", width / 2, height * 3 / 10, width, height / 10);
    //textFont(font2);
    //text("Future\nDesigners", width / 2, height * 5 / 10, width, height / 10);

    textFont(font1);
    text("Sound", width / 2, height * 7 / 10, width, height / 10);
    textFont(font2);
    text("Deep Blue (https://www.bensound.com/)\nWater Drop Recorded by Mike Koenig\nLicensed under Creative Commons: By Attribution 3.0", width / 2, height * 8 / 10, width, height / 10);
}
  
  void touchEnded() {
    System.exit(0);
  }
}
