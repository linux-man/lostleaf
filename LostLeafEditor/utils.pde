boolean overGUI() {
  return (mouseY < 40) || (panelProperties.isVisible() && mouseX < 152 && mouseY < 336) || (panelAreaProperties.isVisible() && mouseX < 152 && mouseY < 376);
}

void clearNodes() {
  whirls.clear();
  flows.clear();
  rocks.clear();
  trunks.clear();
  leafs.clear();
  exits.clear();
  stars.clear();
  killers.clear();
  areas.clear();
}

void showHideAreaNonWhirls() {
  labelAreaRange.setVisible(false);
  textMinRange.setVisible(false);
  textMaxRange.setVisible(false);
  labelAreaDiam.setVisible(true);
  textMinDiam.setVisible(true);
  textMaxDiam.setVisible(true);
  labelAreaRot.setVisible(false);
  textMinRot.setVisible(false);
  textMaxRot.setVisible(false);
  labelAreaFlow.setVisible(false);
  textMinFlow.setVisible(false);
  textMaxFlow.setVisible(false);
}

void showHideAreaWhirls() {
  labelAreaRange.setVisible(true);
  textMinRange.setVisible(true);
  textMaxRange.setVisible(true);
  labelAreaDiam.setVisible(false);
  textMinDiam.setVisible(false);
  textMaxDiam.setVisible(false);
  labelAreaRot.setVisible(true);
  textMinRot.setVisible(true);
  textMaxRot.setVisible(true);
  labelAreaFlow.setVisible(true);
  textMinFlow.setVisible(true);
  textMaxFlow.setVisible(true);
}

void showHideRKS() {
  labelVel.setVisible(true);
  textVX.setVisible(true);
  textVY.setVisible(true);
  labelRange.setVisible(false);
  textRange.setVisible(false);
  labelDiam.setVisible(true);
  textDiam.setVisible(true);
  labelDim.setVisible(false);
  textWid.setVisible(false);
  textHei.setVisible(false);
  labelAngle.setVisible(false);
  textAngle.setVisible(false);
  labelARot.setVisible(false);
  textARot.setVisible(false);
  labelRot.setVisible(false);
  textRot.setVisible(false);
  labelFlow.setVisible(false);
  textFX.setVisible(false);
  textFY.setVisible(false);
  cbPrimaryLeaf.setVisible(false);
  cbFollowX.setVisible(true);
  cbFollowY.setVisible(true);
  cbBounceX.setVisible(true);
  cbBounceY.setVisible(true);
  buttonColor.setVisible(true);
}

boolean isInt(String s) {
  return !(Float.isNaN(int(s)));
}

String intToStr(int n) {
  return str(n);
}

String intToStr(float n) {
  return str((int)n);
}

int strToInt(String s) {
  return int(s);
}

String floatToStr(float n) {
  return str(n);
}

float strToFloat(String s) {
  return float(s);
}

int sign(float v) {
  if(v == 0) return 1;
  else return (int)(abs(v) / v);
}
