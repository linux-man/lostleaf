class Splash extends State {
  PImage logo;

  Splash() {
    logo = loadImage("softlab.png");
    logo.resize(width/2, 0);
  }

  void draw() {
    background(0);
    image(logo, width/2, height/2);
    if(millis() > 5000) touchEnded();
  }
  
  void touchEnded() {
    st = new Menu("menu");
  }
}
