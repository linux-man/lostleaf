class LevelMenu extends Menu {

  LevelMenu(String link, boolean finished) {
    int n = 0;
    int btnCount = 2;
    if(finished) btnCount++;
    String menu = link.substring(0, link.lastIndexOf("/") + 1) + "menu";
    Table table = loadTable(menu, "header,csv");
    int h = height / btnCount;
    buttons = new Button[btnCount];
    buttons[n] = new Button(0, n * h - (h / 2 * (btnCount - 1)), width * 5 / 6, h * 5 / 6, "Restart", link, false, false);
    n++;
    buttons[n] = new Button(0, n * h - (h / 2 * (btnCount - 1)), width * 5 / 6, h * 5 / 6, "Back", menu, false, false);
    n++;
    if(finished) {
      buttons[n] = new Button(0, n * h - (h / 2 * (btnCount - 1)), width * 5 / 6, h * 5 / 6, "Next", table.getString(table.findRowIndex(link, "link") + 1, "link"), false, true);
    }
    wd = new PVector[200];
    for(int w = 0; w < wd.length; w++) wd[w] = new PVector(random(-height / 2, height / 2), random(-height / 2, height / 2));
    font = createFont("Arvo-Regular_201.ttf", 24, true);
    textFont(font);
  }
}
