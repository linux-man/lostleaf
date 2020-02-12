/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void buttonRock_click(GButton source, GEvent event) { //_CODE_:buttonRock:923412:
  rocks.add(new Rock(pos.copy()));
} //_CODE_:buttonRock:923412:

public void buttonTrunk_click(GButton source, GEvent event) { //_CODE_:buttonTrunk:360389:
  trunks.add(new Trunk(pos.copy()));
} //_CODE_:buttonTrunk:360389:

public void buttonFlow_click(GButton source, GEvent event) { //_CODE_:buttonFlow:934774:
  flows.add(new Flow(pos.copy()));
} //_CODE_:buttonFlow:934774:

public void buttonWhirl_click(GButton source, GEvent event) { //_CODE_:buttonWhirl:202466:
  whirls.add(new Whirl(pos.copy()));
} //_CODE_:buttonWhirl:202466:

public void buttonLeaf_click(GButton source, GEvent event) { //_CODE_:buttonLeaf:892772:
  leafs.add(new Leaf(pos.copy()));  
} //_CODE_:buttonLeaf:892772:

public void buttonExit_click(GButton source, GEvent event) { //_CODE_:buttonExit:428542:
  exits.add(new Exit(pos.copy()));
} //_CODE_:buttonExit:428542:

public void buttonStar_click(GButton source, GEvent event) { //_CODE_:buttonStar:817049:
  stars.add(new Star(pos.copy()));
} //_CODE_:buttonStar:817049:

public void buttonKiller_click(GButton source, GEvent event) { //_CODE_:buttonKiller:716442:
  killers.add(new Killer(pos.copy()));
} //_CODE_:buttonKiller:716442:

public void buttonArea_click(GButton source, GEvent event) { //_CODE_:buttonArea:259582:
  areas.add(new Area(pos.copy()));
} //_CODE_:buttonArea:259582:

public void textX_change(GTextField source, GEvent event) { //_CODE_:textX:693334:
  int x = strToInt(source.getText());
  if(whirl != null) whirl.pos.x = x;
  else if(flow != null) flow.pos.x = x;
  else if(rock != null) rock.pos.x = x;
  else if(trunk != null) trunk.pos.x = x;
  else if(leaf != null) leaf.pos.x = x;
  else if(exit != null) exit.pos.x = x;
  else if(star != null) star.pos.x = x;
  else if(killer != null) killer.pos.x = x;
} //_CODE_:textX:693334:

public void textY_change(GTextField source, GEvent event) { //_CODE_:textY:322263:
  int y = strToInt(source.getText());
  if(whirl != null) whirl.pos.y = y;
  else if(flow != null) flow.pos.y = y;
  else if(rock != null) rock.pos.y = y;
  else if(trunk != null) trunk.pos.y = y;
  else if(leaf != null) leaf.pos.y = y;
  else if(exit != null) exit.pos.y = y;
  else if(star != null) star.pos.y = y;
  else if(killer != null) killer.pos.y = y;
} //_CODE_:textY:322263:

public void textFX_change(GTextField source, GEvent event) { //_CODE_:textFX:810412:
  int x = strToInt(source.getText());
  if(flow != null) flow.flow.x = x;
  else if(whirl != null) whirl.flow = x;
} //_CODE_:textFX:810412:

public void textFY_change(GTextField source, GEvent event) { //_CODE_:textFY:789509:
  if(flow != null) flow.flow.y = strToInt(source.getText());
} //_CODE_:textFY:789509:

public void textRange_change(GTextField source, GEvent event) { //_CODE_:textRange:551357:
  int x = strToInt(source.getText());
  if(whirl != null) whirl.range = x;
  else if(flow != null) flow.range = x;
  else if(exit != null) exit.range = x;
} //_CODE_:textRange:551357:

public void textVX_change(GTextField source, GEvent event) { //_CODE_:textVX:735220:
  int x = strToInt(source.getText());
  if(whirl != null) whirl.vel.x = x;
  else if(flow != null) flow.vel.x = x;
  else if(rock != null) rock.vel.x = x;
  else if(trunk != null) trunk.vel.x = x;
  else if(star != null) star.vel.x = x;
  else if(killer != null) killer.vel.x = x;
} //_CODE_:textVX:735220:

public void textVY_change(GTextField source, GEvent event) { //_CODE_:textVY:431031:
  int y = strToInt(source.getText());
  if(whirl != null) whirl.vel.y = y;
  else if(flow != null) flow.vel.y = y;
  else if(rock != null) rock.vel.y = y;
  else if(trunk != null) trunk.vel.y = y;
  else if(star != null) star.vel.y = y;
  else if(killer != null) killer.vel.y = y;
} //_CODE_:textVY:431031:

public void textDiam_change(GTextField source, GEvent event) { //_CODE_:textDiam:654766:
  if(rock != null) rock.diam = strToInt(source.getText());
  else if(star != null) star.diam = strToInt(source.getText());
  else if(killer != null) killer.diam = strToInt(source.getText());
  else if(leaf != null) leaf.diam = strToInt(source.getText());
} //_CODE_:textDiam:654766:

public void textWid_change(GTextField source, GEvent event) { //_CODE_:textWid:882318:
  if(trunk != null) trunk.w = strToInt(source.getText());
} //_CODE_:textWid:882318:

public void textHei_change(GTextField source, GEvent event) { //_CODE_:textHei:347397:
  if(trunk != null) trunk.h = strToInt(source.getText());
} //_CODE_:textHei:347397:

public void textAngle_change(GTextField source, GEvent event) { //_CODE_:textAngle:232844:
  if(trunk != null) trunk.angle = strToInt(source.getText());
} //_CODE_:textAngle:232844:

public void textARot_change(GTextField source, GEvent event) { //_CODE_:textARot:574210:
  if(trunk != null) trunk.aRot = strToInt(source.getText());
} //_CODE_:textARot:574210:

public void buttonDel_click(GButton source, GEvent event) { //_CODE_:buttonDel:405440:
  if(flow != null) flows.remove(flow);
  else if(whirl != null) whirls.remove(whirl);
  else if(rock != null) rocks.remove(rock);
  else if(trunk != null) trunks.remove(trunk);
  else if(leaf != null) leafs.remove(leaf);
  else if(exit != null) exits.remove(exit);
  else if(star != null) stars.remove(star);
  else if(killer != null) killers.remove(killer);
  else if(area != null) areas.remove(area);
  panelProperties.setVisible(false);
} //_CODE_:buttonDel:405440:

public void cbFollowX_clicked(GCheckbox source, GEvent event) { //_CODE_:cbFollowX:783922:
  boolean s = source.isSelected();
  if(flow != null) flow.followX = s;
  else if(whirl != null) whirl.followX = s;
  else if(rock != null) rock.followX = s;
  else if(trunk != null) trunk.followX = s;
  else if(star != null) star.followX = s;
  else if(killer != null) killer.followX = s;
  else if(killer != null) killer.followX = s;
  else if(area != null) area.followX = s;
} //_CODE_:cbFollowX:783922:

public void cbFollowY_clicked(GCheckbox source, GEvent event) { //_CODE_:cbFollowY:242827:
  boolean s = source.isSelected();
  if(flow != null) flow.followY = s;
  else if(whirl != null) whirl.followY = s;
  else if(rock != null) rock.followY = s;
  else if(trunk != null) trunk.followY = s;
  else if(star != null) star.followY = s;
  else if(killer != null) killer.followY = s;
  else if(area != null) area.followY = s;
} //_CODE_:cbFollowY:242827:

public void buttonColor_click(GButton source, GEvent event) { //_CODE_:buttonColor:517347:
  color c = color(255);
  if(whirl != null) c = whirl.c;
  else if(rock != null) c = rock.c;
  else if(trunk != null) c = trunk.c;
  else if(leaf != null) c = leaf.c;
  else if(exit != null) c = exit.c;
  else if(star != null) c = star.c;
  else if(killer != null) c = killer.c;
  c = colorChooser(c);
  if(whirl != null) whirl.c = c;
  else if(rock != null) rock.c = c;
  else if(trunk != null) trunk.c = c;
  else if(leaf != null) leaf.c = c;
  else if(exit != null) exit.c = c;
  else if(star != null) star.c = c;
  else if(killer != null) killer.c = c;
} //_CODE_:buttonColor:517347:

public void cbBounceX_clicked(GCheckbox source, GEvent event) { //_CODE_:cbBounceX:264789:
  boolean s = source.isSelected();
  if(whirl != null) whirl.bounceX = s;
  else if(rock != null) rock.bounceX = s;
  else if(trunk != null) trunk.bounceX = s;
  else if(star != null) star.bounceX = s;
  else if(killer != null) killer.bounceX = s;
  else if(area != null) area.bounceX = s;
} //_CODE_:cbBounceX:264789:

public void cbBounceY_clicked(GCheckbox source, GEvent event) { //_CODE_:cbBounceY:219860:
  boolean s = source.isSelected();
  if(whirl != null) whirl.bounceY = s;
  else if(rock != null) rock.bounceY = s;
  else if(trunk != null) trunk.bounceY = s;
  else if(star != null) star.bounceY = s;
  else if(killer != null) killer.bounceY = s;
  else if(area != null) area.bounceY = s;
} //_CODE_:cbBounceY:219860:

public void buttonMove_click(GButton source, GEvent event) { //_CODE_:buttonMove:210926:
  move = true;
  clone = false;
} //_CODE_:buttonMove:210926:

public void buttonClone_click(GButton source, GEvent event) { //_CODE_:buttonClone:203882:
  clone = !clone;
  move = false;
} //_CODE_:buttonClone:203882:

public void textRot_change(GTextField source, GEvent event) { //_CODE_:textRot:879048:
  if(whirl != null) whirl.rotation = strToInt(source.getText());
} //_CODE_:textRot:879048:

public void panelNew_click(GPanel source, GEvent event) { //_CODE_:panelNew:509105:
  panelLevel.setCollapsed(true);
} //_CODE_:panelNew:509105:

public void buttonRockColor1_click(GButton source, GEvent event) { //_CODE_:buttonRockColor1:572893:
  rc1 = colorChooser(rc1);
} //_CODE_:buttonRockColor1:572893:

public void buttonRockColor2_click(GButton source, GEvent event) { //_CODE_:buttonRockColor2:525147:
  rc2 = colorChooser(rc2);
} //_CODE_:buttonRockColor2:525147:

public void buttonWhirlColor1_click(GButton source, GEvent event) { //_CODE_:buttonWhirlColor1:914060:
  wc1 = colorChooser(wc1);
} //_CODE_:buttonWhirlColor1:914060:

public void buttonWhirlColor2_click(GButton source, GEvent event) { //_CODE_:buttonWhirlColor2:863383:
  wc2 = colorChooser(wc2);
} //_CODE_:buttonWhirlColor2:863383:

public void buttonTrunkColor1_click(GButton source, GEvent event) { //_CODE_:buttonTrunkColor1:445136:
  tc1 = colorChooser(tc1);
} //_CODE_:buttonTrunkColor1:445136:

public void buttonTrunkColor2_click(GButton source, GEvent event) { //_CODE_:buttonTrunkColor2:356496:
  tc2 = colorChooser(tc2);
} //_CODE_:buttonTrunkColor2:356496:

public void panelLevel_click(GPanel source, GEvent event) { //_CODE_:panelLevel:246707:
  panelNew.setCollapsed(true);
} //_CODE_:panelLevel:246707:

public void buttonBg_click(GButton source, GEvent event) { //_CODE_:buttonBg:408473:
  bg = colorChooser(bg);
} //_CODE_:buttonBg:408473:

public void buttonColor1_click(GButton source, GEvent event) { //_CODE_:buttonColor1:720159:
  c1 = colorChooser(c1);
} //_CODE_:buttonColor1:720159:

public void buttonColor2_click(GButton source, GEvent event) { //_CODE_:buttonColor2:848864:
  c2 = colorChooser(c2);
} //_CODE_:buttonColor2:848864:

public void buttonControlsColor_click(GButton source, GEvent event) { //_CODE_:buttonControlsColor:504595:
  cc = colorChooser(cc);
} //_CODE_:buttonControlsColor:504595:

public void buttonLoad_click(GButton source, GEvent event) { //_CODE_:buttonLoad:928435:
  loadLevel(openDialog("Load Level"));
} //_CODE_:buttonLoad:928435:

public void buttonSaveAs_click(GButton source, GEvent event) { //_CODE_:buttonSaveAs:278614:
  saveLevel(saveDialog("Save Level"));
} //_CODE_:buttonSaveAs:278614:

public void buttonNew_click(GButton source, GEvent event) { //_CODE_:buttonNew:671950:
  level = null;
  clearNodes();
  center.set(450, -height / 2);
  textW.setText("900");
  textH.setText("1600");
  panelCreate.setVisible(false);
  panelProperties.setVisible(false);
  panelAreaProperties.setVisible(false);
} //_CODE_:buttonNew:671950:

public void buttonSave_click(GButton source, GEvent event) { //_CODE_:buttonSave:217893:
  if(level != null) saveLevel(level);
  else saveLevel(saveDialog("Save Level"));
} //_CODE_:buttonSave:217893:

public void dropListObj_click(GDropList source, GEvent event) { //_CODE_:dropListObj:859383:
  area.object = source.getSelectedIndex ();
  switch(area.object) {
    case 0: case 2: case 3://Rocks, Stars, Killers
      showHideAreaNonWhirls();
      break;
    case 1: 
      showHideAreaWhirls();
      break;
  }
} //_CODE_:dropListObj:859383:

public void textMinQuant_change(GTextField source, GEvent event) { //_CODE_:textMinQuant:500992:
  area.quantMin = strToInt(source.getText());
} //_CODE_:textMinQuant:500992:

public void textMaxQuant_change(GTextField source, GEvent event) { //_CODE_:textMaxQuant:790984:
  area.quantMax = strToInt(source.getText());
} //_CODE_:textMaxQuant:790984:

public void textMinVX_change(GTextField source, GEvent event) { //_CODE_:textMinVX:433550:
  area.velMin.x = strToInt(source.getText());
} //_CODE_:textMinVX:433550:

public void textMaxVX_change(GTextField source, GEvent event) { //_CODE_:textMaxVX:819764:
  area.velMax.x = strToInt(source.getText());
} //_CODE_:textMaxVX:819764:

public void textMinVY_change(GTextField source, GEvent event) { //_CODE_:textMinVY:822584:
  area.velMin.y = strToInt(source.getText());
} //_CODE_:textMinVY:822584:

public void textMaxVY_change(GTextField source, GEvent event) { //_CODE_:textMaxVY:906842:
  area.velMax.y = strToInt(source.getText());
} //_CODE_:textMaxVY:906842:

public void buttonAreaColor1_click(GButton source, GEvent event) { //_CODE_:buttonAreaColor1:968901:
  area.c1 = colorChooser(area.c1);
} //_CODE_:buttonAreaColor1:968901:

public void buttonAreaColor2_click(GButton source, GEvent event) { //_CODE_:buttonAreaColor2:508744:
  area.c2 = colorChooser(area.c2);
} //_CODE_:buttonAreaColor2:508744:

public void textAreaX_change(GTextField source, GEvent event) { //_CODE_:textAreaX:589381:
  area.pos.x = strToInt(source.getText());
} //_CODE_:textAreaX:589381:

public void textAreaY_change(GTextField source, GEvent event) { //_CODE_:textAreaY:555219:
  area.pos.y = strToInt(source.getText());
} //_CODE_:textAreaY:555219:

public void textAreaWid_change(GTextField source, GEvent event) { //_CODE_:textAreaWid:761327:
  area.w = strToInt(source.getText());
} //_CODE_:textAreaWid:761327:

public void textAreaHei_change(GTextField source, GEvent event) { //_CODE_:textAreaHei:211712:
  area.h = strToInt(source.getText());
} //_CODE_:textAreaHei:211712:

public void textAreaSeed_change(GTextField source, GEvent event) { //_CODE_:textAreaSeed:280220:
  area.seed = strToInt(source.getText());
} //_CODE_:textAreaSeed:280220:

public void textMinRange_change(GTextField source, GEvent event) { //_CODE_:textMinRange:622195:
  area.rangeMin = strToInt(source.getText());
} //_CODE_:textMinRange:622195:

public void textMaxRange_change(GTextField source, GEvent event) { //_CODE_:textMaxRange:792646:
  area.rangeMax = strToInt(source.getText());
} //_CODE_:textMaxRange:792646:

public void textMinDiam_change(GTextField source, GEvent event) { //_CODE_:textMinDiam:325466:
  area.diamMin = strToInt(source.getText());
} //_CODE_:textMinDiam:325466:

public void textMaxDiam_change(GTextField source, GEvent event) { //_CODE_:textMaxDiam:399243:
  area.diamMax = strToInt(source.getText());
} //_CODE_:textMaxDiam:399243:

public void textMinRot_change(GTextField source, GEvent event) { //_CODE_:textMinRot:487511:
  area.rotationMin = strToInt(source.getText());
} //_CODE_:textMinRot:487511:

public void textMaxRot_change(GTextField source, GEvent event) { //_CODE_:textMaxRot:852320:
  area.rotationMax = strToInt(source.getText());
} //_CODE_:textMaxRot:852320:

public void textMinFlow_change(GTextField source, GEvent event) { //_CODE_:textMinFlow:361766:
  area.flowMin = strToInt(source.getText());
} //_CODE_:textMinFlow:361766:

public void textMaxFlow_change(GTextField source, GEvent event) { //_CODE_:textMaxFlow:399493:
  area.flowMax = strToInt(source.getText());
} //_CODE_:textMaxFlow:399493:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.RED_SCHEME);
  G4P.setMouseOverEnabled(false);
  GButton.useRoundCorners(false);
  G4P.setDisplayFont("Arial", G4P.PLAIN, 12);
  surface.setTitle("Lost Leaf Editor");
  panelCreate = new GPanel(this, 8, 328, 64, 160, "Create");
  panelCreate.setCollapsible(false);
  panelCreate.setDraggable(false);
  panelCreate.setText("Create");
  panelCreate.setOpaque(true);
  buttonRock = new GButton(this, 0, 16, 64, 16);
  buttonRock.setText("Rock");
  buttonRock.addEventHandler(this, "buttonRock_click");
  buttonTrunk = new GButton(this, 0, 32, 64, 16);
  buttonTrunk.setText("Trunk");
  buttonTrunk.addEventHandler(this, "buttonTrunk_click");
  buttonFlow = new GButton(this, 0, 48, 64, 16);
  buttonFlow.setText("Flow");
  buttonFlow.addEventHandler(this, "buttonFlow_click");
  buttonWhirl = new GButton(this, 0, 64, 64, 16);
  buttonWhirl.setText("Whirl");
  buttonWhirl.addEventHandler(this, "buttonWhirl_click");
  buttonLeaf = new GButton(this, 0, 80, 64, 16);
  buttonLeaf.setText("Leaf");
  buttonLeaf.addEventHandler(this, "buttonLeaf_click");
  buttonExit = new GButton(this, 0, 96, 64, 16);
  buttonExit.setText("Exit");
  buttonExit.addEventHandler(this, "buttonExit_click");
  buttonStar = new GButton(this, 0, 112, 64, 16);
  buttonStar.setText("Star");
  buttonStar.addEventHandler(this, "buttonStar_click");
  buttonKiller = new GButton(this, 0, 128, 64, 16);
  buttonKiller.setText("Killer");
  buttonKiller.addEventHandler(this, "buttonKiller_click");
  buttonArea = new GButton(this, 0, 144, 64, 16);
  buttonArea.setText("Area");
  buttonArea.addEventHandler(this, "buttonArea_click");
  panelCreate.addControl(buttonRock);
  panelCreate.addControl(buttonTrunk);
  panelCreate.addControl(buttonFlow);
  panelCreate.addControl(buttonWhirl);
  panelCreate.addControl(buttonLeaf);
  panelCreate.addControl(buttonExit);
  panelCreate.addControl(buttonStar);
  panelCreate.addControl(buttonKiller);
  panelCreate.addControl(buttonArea);
  panelProperties = new GPanel(this, 0, 24, 152, 296, "Properties");
  panelProperties.setCollapsible(false);
  panelProperties.setDraggable(false);
  panelProperties.setText("Properties");
  panelProperties.setOpaque(true);
  labelPos = new GLabel(this, 0, 24, 48, 16);
  labelPos.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelPos.setText("Pos");
  labelPos.setOpaque(false);
  labelFlow = new GLabel(this, 0, 152, 48, 16);
  labelFlow.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelFlow.setText("Flow");
  labelFlow.setOpaque(false);
  labelRange = new GLabel(this, 0, 56, 48, 16);
  labelRange.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelRange.setText("Range");
  labelRange.setOpaque(false);
  labelVel = new GLabel(this, 0, 40, 48, 16);
  labelVel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelVel.setText("Vel");
  labelVel.setOpaque(false);
  labelDiam = new GLabel(this, 0, 72, 48, 16);
  labelDiam.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelDiam.setText("Diam");
  labelDiam.setOpaque(false);
  labelDim = new GLabel(this, 0, 88, 48, 16);
  labelDim.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelDim.setText("Dim");
  labelDim.setOpaque(false);
  labelAngle = new GLabel(this, 0, 104, 48, 16);
  labelAngle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAngle.setText("Angle");
  labelAngle.setOpaque(false);
  labelARot = new GLabel(this, 0, 120, 48, 16);
  labelARot.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelARot.setText("A. Rot");
  labelARot.setOpaque(false);
  labelRot = new GLabel(this, 0, 136, 48, 16);
  labelRot.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelRot.setText("Rot");
  labelRot.setOpaque(false);
  textX = new GTextField(this, 48, 24, 48, 16, G4P.SCROLLBARS_NONE);
  textX.setOpaque(true);
  textX.addEventHandler(this, "textX_change");
  textY = new GTextField(this, 96, 24, 48, 16, G4P.SCROLLBARS_NONE);
  textY.setOpaque(true);
  textY.addEventHandler(this, "textY_change");
  textFX = new GTextField(this, 48, 152, 48, 16, G4P.SCROLLBARS_NONE);
  textFX.setOpaque(true);
  textFX.addEventHandler(this, "textFX_change");
  textFY = new GTextField(this, 96, 152, 48, 16, G4P.SCROLLBARS_NONE);
  textFY.setOpaque(true);
  textFY.addEventHandler(this, "textFY_change");
  textRange = new GTextField(this, 48, 56, 48, 16, G4P.SCROLLBARS_NONE);
  textRange.setOpaque(true);
  textRange.addEventHandler(this, "textRange_change");
  textVX = new GTextField(this, 48, 40, 48, 16, G4P.SCROLLBARS_NONE);
  textVX.setOpaque(true);
  textVX.addEventHandler(this, "textVX_change");
  textVY = new GTextField(this, 96, 40, 48, 16, G4P.SCROLLBARS_NONE);
  textVY.setOpaque(true);
  textVY.addEventHandler(this, "textVY_change");
  textDiam = new GTextField(this, 48, 72, 48, 16, G4P.SCROLLBARS_NONE);
  textDiam.setOpaque(true);
  textDiam.addEventHandler(this, "textDiam_change");
  textWid = new GTextField(this, 48, 88, 48, 16, G4P.SCROLLBARS_NONE);
  textWid.setOpaque(true);
  textWid.addEventHandler(this, "textWid_change");
  textHei = new GTextField(this, 96, 88, 48, 16, G4P.SCROLLBARS_NONE);
  textHei.setOpaque(true);
  textHei.addEventHandler(this, "textHei_change");
  textAngle = new GTextField(this, 48, 104, 48, 16, G4P.SCROLLBARS_NONE);
  textAngle.setOpaque(true);
  textAngle.addEventHandler(this, "textAngle_change");
  textARot = new GTextField(this, 48, 120, 48, 16, G4P.SCROLLBARS_NONE);
  textARot.setOpaque(true);
  textARot.addEventHandler(this, "textARot_change");
  buttonDel = new GButton(this, 80, 248, 64, 16);
  buttonDel.setText("Delete");
  buttonDel.addEventHandler(this, "buttonDel_click");
  cbFollowX = new GCheckbox(this, 0, 176, 80, 16);
  cbFollowX.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbFollowX.setText("Follow X");
  cbFollowX.setOpaque(false);
  cbFollowX.addEventHandler(this, "cbFollowX_clicked");
  cbFollowY = new GCheckbox(this, 0, 192, 80, 16);
  cbFollowY.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbFollowY.setText("Follow Y");
  cbFollowY.setOpaque(false);
  cbFollowY.addEventHandler(this, "cbFollowY_clicked");
  buttonColor = new GButton(this, 8, 248, 64, 16);
  buttonColor.setText("Color");
  buttonColor.addEventHandler(this, "buttonColor_click");
  cbBounceX = new GCheckbox(this, 0, 208, 80, 16);
  cbBounceX.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbBounceX.setText("Bounce X");
  cbBounceX.setOpaque(false);
  cbBounceX.addEventHandler(this, "cbBounceX_clicked");
  cbBounceY = new GCheckbox(this, 0, 224, 80, 16);
  cbBounceY.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbBounceY.setText("Bounce Y");
  cbBounceY.setOpaque(false);
  cbBounceY.addEventHandler(this, "cbBounceY_clicked");
  buttonMove = new GButton(this, 8, 272, 64, 16);
  buttonMove.setText("Move");
  buttonMove.addEventHandler(this, "buttonMove_click");
  buttonClone = new GButton(this, 80, 272, 64, 16);
  buttonClone.setText("Clone");
  buttonClone.addEventHandler(this, "buttonClone_click");
  textRot = new GTextField(this, 48, 136, 48, 16, G4P.SCROLLBARS_NONE);
  textRot.setOpaque(true);
  textRot.addEventHandler(this, "textRot_change");
  panelProperties.addControl(labelPos);
  panelProperties.addControl(labelFlow);
  panelProperties.addControl(labelRange);
  panelProperties.addControl(labelVel);
  panelProperties.addControl(labelDiam);
  panelProperties.addControl(labelDim);
  panelProperties.addControl(labelAngle);
  panelProperties.addControl(labelARot);
  panelProperties.addControl(labelRot);
  panelProperties.addControl(textX);
  panelProperties.addControl(textY);
  panelProperties.addControl(textFX);
  panelProperties.addControl(textFY);
  panelProperties.addControl(textRange);
  panelProperties.addControl(textVX);
  panelProperties.addControl(textVY);
  panelProperties.addControl(textDiam);
  panelProperties.addControl(textWid);
  panelProperties.addControl(textHei);
  panelProperties.addControl(textAngle);
  panelProperties.addControl(textARot);
  panelProperties.addControl(buttonDel);
  panelProperties.addControl(cbFollowX);
  panelProperties.addControl(cbFollowY);
  panelProperties.addControl(buttonColor);
  panelProperties.addControl(cbBounceX);
  panelProperties.addControl(cbBounceY);
  panelProperties.addControl(buttonMove);
  panelProperties.addControl(buttonClone);
  panelProperties.addControl(textRot);
  panelNew = new GPanel(this, 464, 264, 352, 160, "New Objects");
  panelNew.setDraggable(false);
  panelNew.setText("New Objects");
  panelNew.setOpaque(true);
  panelNew.addEventHandler(this, "panelNew_click");
  labelNewRocks = new GLabel(this, 0, 40, 48, 16);
  labelNewRocks.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelNewRocks.setText("Rocks");
  labelNewRocks.setOpaque(false);
  labelNewTrunks = new GLabel(this, 0, 64, 48, 16);
  labelNewTrunks.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelNewTrunks.setText("Trunks");
  labelNewTrunks.setOpaque(false);
  labelNewWhirls = new GLabel(this, 0, 104, 48, 16);
  labelNewWhirls.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelNewWhirls.setText("Whirls");
  labelNewWhirls.setOpaque(false);
  labelNewNum = new GLabel(this, 48, 24, 40, 16);
  labelNewNum.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelNewNum.setText("Num");
  labelNewNum.setOpaque(false);
  labelNewMaxWidth = new GLabel(this, 88, 24, 64, 16);
  labelNewMaxWidth.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelNewMaxWidth.setText("Max Width");
  labelNewMaxWidth.setOpaque(false);
  textRockNum = new GTextField(this, 48, 40, 40, 16, G4P.SCROLLBARS_NONE);
  textRockNum.setText("0");
  textRockNum.setOpaque(true);
  textTrunkNum = new GTextField(this, 48, 64, 40, 16, G4P.SCROLLBARS_NONE);
  textTrunkNum.setText("0");
  textTrunkNum.setOpaque(true);
  textWhirlNum = new GTextField(this, 48, 104, 40, 16, G4P.SCROLLBARS_NONE);
  textWhirlNum.setText("0");
  textWhirlNum.setOpaque(true);
  textRockMax = new GTextField(this, 88, 40, 64, 16, G4P.SCROLLBARS_NONE);
  textRockMax.setText("100");
  textRockMax.setOpaque(true);
  textTrunkMax = new GTextField(this, 88, 64, 64, 16, G4P.SCROLLBARS_NONE);
  textTrunkMax.setText("600");
  textTrunkMax.setOpaque(true);
  textWhirlMaxFlow = new GTextField(this, 88, 104, 64, 16, G4P.SCROLLBARS_NONE);
  textWhirlMaxFlow.setText("0");
  textWhirlMaxFlow.setOpaque(true);
  textWhirlMaxRot = new GTextField(this, 152, 104, 64, 16, G4P.SCROLLBARS_NONE);
  textWhirlMaxRot.setText("400");
  textWhirlMaxRot.setOpaque(true);
  labelNewMaxFlow = new GLabel(this, 88, 88, 64, 16);
  labelNewMaxFlow.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelNewMaxFlow.setText("Max Flow");
  labelNewMaxFlow.setOpaque(false);
  labelNewMaxRot = new GLabel(this, 152, 88, 64, 16);
  labelNewMaxRot.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelNewMaxRot.setText("Max Rot");
  labelNewMaxRot.setOpaque(false);
  buttonRockColor1 = new GButton(this, 224, 40, 56, 16);
  buttonRockColor1.setText("Color 1");
  buttonRockColor1.addEventHandler(this, "buttonRockColor1_click");
  buttonRockColor2 = new GButton(this, 288, 40, 56, 16);
  buttonRockColor2.setText("Color 2");
  buttonRockColor2.addEventHandler(this, "buttonRockColor2_click");
  buttonWhirlColor1 = new GButton(this, 224, 104, 56, 16);
  buttonWhirlColor1.setText("Color 1");
  buttonWhirlColor1.addEventHandler(this, "buttonWhirlColor1_click");
  buttonWhirlColor2 = new GButton(this, 288, 104, 56, 16);
  buttonWhirlColor2.setText("Color 2");
  buttonWhirlColor2.addEventHandler(this, "buttonWhirlColor2_click");
  buttonTrunkColor1 = new GButton(this, 224, 64, 56, 16);
  buttonTrunkColor1.setText("Color 1");
  buttonTrunkColor1.addEventHandler(this, "buttonTrunkColor1_click");
  buttonTrunkColor2 = new GButton(this, 288, 64, 56, 16);
  buttonTrunkColor2.setText("Color 2");
  buttonTrunkColor2.addEventHandler(this, "buttonTrunkColor2_click");
  panelNew.addControl(labelNewRocks);
  panelNew.addControl(labelNewTrunks);
  panelNew.addControl(labelNewWhirls);
  panelNew.addControl(labelNewNum);
  panelNew.addControl(labelNewMaxWidth);
  panelNew.addControl(textRockNum);
  panelNew.addControl(textTrunkNum);
  panelNew.addControl(textWhirlNum);
  panelNew.addControl(textRockMax);
  panelNew.addControl(textTrunkMax);
  panelNew.addControl(textWhirlMaxFlow);
  panelNew.addControl(textWhirlMaxRot);
  panelNew.addControl(labelNewMaxFlow);
  panelNew.addControl(labelNewMaxRot);
  panelNew.addControl(buttonRockColor1);
  panelNew.addControl(buttonRockColor2);
  panelNew.addControl(buttonWhirlColor1);
  panelNew.addControl(buttonWhirlColor2);
  panelNew.addControl(buttonTrunkColor1);
  panelNew.addControl(buttonTrunkColor2);
  panelLevel = new GPanel(this, 528, 24, 288, 216, "Level Properties");
  panelLevel.setDraggable(false);
  panelLevel.setText("Level Properties");
  panelLevel.setOpaque(true);
  panelLevel.addEventHandler(this, "panelLevel_click");
  labelLevelDim = new GLabel(this, 0, 24, 80, 16);
  labelLevelDim.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelLevelDim.setText("Dim");
  labelLevelDim.setOpaque(false);
  textW = new GTextField(this, 80, 24, 40, 16, G4P.SCROLLBARS_NONE);
  textW.setText("900");
  textW.setOpaque(true);
  textH = new GTextField(this, 120, 24, 40, 16, G4P.SCROLLBARS_NONE);
  textH.setText("1600");
  textH.setOpaque(true);
  cbGFollowX = new GCheckbox(this, 0, 48, 80, 16);
  cbGFollowX.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbGFollowX.setText("Follow X");
  cbGFollowX.setOpaque(false);
  cbGFollowY = new GCheckbox(this, 80, 48, 80, 16);
  cbGFollowY.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbGFollowY.setText("Follow Y");
  cbGFollowY.setOpaque(false);
  cbRotate = new GCheckbox(this, 160, 48, 80, 16);
  cbRotate.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbRotate.setText("Rotate");
  cbRotate.setOpaque(false);
  labelLevelScale = new GLabel(this, 160, 24, 80, 16);
  labelLevelScale.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelLevelScale.setText("Scale");
  labelLevelScale.setOpaque(false);
  textScale = new GTextField(this, 240, 24, 40, 16, G4P.SCROLLBARS_NONE);
  textScale.setText("1");
  textScale.setOpaque(true);
  cbTiltX = new GCheckbox(this, 0, 72, 80, 16);
  cbTiltX.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbTiltX.setText("Tilt X");
  cbTiltX.setOpaque(false);
  cbTiltY = new GCheckbox(this, 80, 72, 80, 16);
  cbTiltY.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbTiltY.setText("Tilt Y");
  cbTiltY.setOpaque(false);
  labelLevelMaxTilt = new GLabel(this, 160, 72, 80, 16);
  labelLevelMaxTilt.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelLevelMaxTilt.setText("Max Tilt");
  labelLevelMaxTilt.setOpaque(false);
  textMaxTilt = new GTextField(this, 240, 72, 40, 16, G4P.SCROLLBARS_NONE);
  textMaxTilt.setText("100");
  textMaxTilt.setOpaque(true);
  labelLevelSavedLeafs = new GLabel(this, 0, 96, 80, 16);
  labelLevelSavedLeafs.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelLevelSavedLeafs.setText("Saved Leafs");
  labelLevelSavedLeafs.setOpaque(false);
  textVictory = new GTextField(this, 80, 96, 40, 16, G4P.SCROLLBARS_NONE);
  textVictory.setText("1");
  textVictory.setOpaque(true);
  buttonBg = new GButton(this, 8, 144, 96, 16);
  buttonBg.setText("Background");
  buttonBg.addEventHandler(this, "buttonBg_click");
  buttonColor1 = new GButton(this, 8, 168, 48, 16);
  buttonColor1.setText("Color 1");
  buttonColor1.addEventHandler(this, "buttonColor1_click");
  buttonColor2 = new GButton(this, 56, 168, 48, 16);
  buttonColor2.setText("Color 2");
  buttonColor2.addEventHandler(this, "buttonColor2_click");
  buttonControlsColor = new GButton(this, 8, 192, 96, 16);
  buttonControlsColor.setText("Controls Color");
  buttonControlsColor.addEventHandler(this, "buttonControlsColor_click");
  labelIntroText = new GLabel(this, 160, 120, 80, 16);
  labelIntroText.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelIntroText.setText("Intro Text");
  labelIntroText.setOpaque(false);
  textIntro = new GTextArea(this, 112, 136, 168, 72, G4P.SCROLLBARS_NONE);
  textIntro.setOpaque(true);
  labelLevelStars = new GLabel(this, 160, 96, 80, 16);
  labelLevelStars.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelLevelStars.setText("Stars");
  labelLevelStars.setOpaque(false);
  textPoints = new GTextField(this, 240, 96, 40, 16, G4P.SCROLLBARS_NONE);
  textPoints.setText("0");
  textPoints.setOpaque(true);
  panelLevel.addControl(labelLevelDim);
  panelLevel.addControl(textW);
  panelLevel.addControl(textH);
  panelLevel.addControl(cbGFollowX);
  panelLevel.addControl(cbGFollowY);
  panelLevel.addControl(cbRotate);
  panelLevel.addControl(labelLevelScale);
  panelLevel.addControl(textScale);
  panelLevel.addControl(cbTiltX);
  panelLevel.addControl(cbTiltY);
  panelLevel.addControl(labelLevelMaxTilt);
  panelLevel.addControl(textMaxTilt);
  panelLevel.addControl(labelLevelSavedLeafs);
  panelLevel.addControl(textVictory);
  panelLevel.addControl(buttonBg);
  panelLevel.addControl(buttonColor1);
  panelLevel.addControl(buttonColor2);
  panelLevel.addControl(buttonControlsColor);
  panelLevel.addControl(labelIntroText);
  panelLevel.addControl(textIntro);
  panelLevel.addControl(labelLevelStars);
  panelLevel.addControl(textPoints);
  buttonLoad = new GButton(this, 64, 0, 56, 18);
  buttonLoad.setText("Load");
  buttonLoad.addEventHandler(this, "buttonLoad_click");
  buttonSaveAs = new GButton(this, 192, 0, 56, 18);
  buttonSaveAs.setText("Save As");
  buttonSaveAs.addEventHandler(this, "buttonSaveAs_click");
  cbSnap = new GCheckbox(this, 480, 0, 56, 16);
  cbSnap.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbSnap.setText("Snap");
  cbSnap.setOpaque(true);
  cbSnap.setSelected(true);
  textS = new GTextField(this, 536, 0, 32, 16, G4P.SCROLLBARS_NONE);
  textS.setText("50");
  textS.setOpaque(true);
  buttonNew = new GButton(this, 0, 0, 56, 18);
  buttonNew.setText("New");
  buttonNew.addEventHandler(this, "buttonNew_click");
  sliderScale = new GSlider(this, 576, 0, 168, 16, 10.0);
  sliderScale.setLimits(1.0, 1.0, 10.0);
  sliderScale.setNbrTicks(10);
  sliderScale.setNumberFormat(G4P.DECIMAL, 2);
  sliderScale.setOpaque(false);
  buttonSave = new GButton(this, 128, 0, 56, 18);
  buttonSave.setText("Save");
  buttonSave.addEventHandler(this, "buttonSave_click");
  panelAreaProperties = new GPanel(this, 152, 24, 152, 352, "Area Properties");
  panelAreaProperties.setCollapsible(false);
  panelAreaProperties.setDraggable(false);
  panelAreaProperties.setText("Area Properties");
  panelAreaProperties.setOpaque(true);
  labelAreaPos = new GLabel(this, 0, 24, 48, 16);
  labelAreaPos.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaPos.setText("Pos");
  labelAreaPos.setOpaque(false);
  labelAreaDim = new GLabel(this, 0, 40, 48, 16);
  labelAreaDim.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaDim.setText("Dim");
  labelAreaDim.setOpaque(false);
  labelAreaObjs = new GLabel(this, 0, 80, 48, 16);
  labelAreaObjs.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaObjs.setText("Objects");
  labelAreaObjs.setOpaque(false);
  labelAreaQuant = new GLabel(this, 0, 112, 48, 16);
  labelAreaQuant.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaQuant.setText("Quant");
  labelAreaQuant.setOpaque(false);
  labelAreaSeed = new GLabel(this, 0, 56, 48, 16);
  labelAreaSeed.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaSeed.setText("Seed");
  labelAreaSeed.setOpaque(false);
  labelAreaVX = new GLabel(this, 0, 128, 48, 16);
  labelAreaVX.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaVX.setText("Vel X");
  labelAreaVX.setOpaque(false);
  labelAreaVY = new GLabel(this, 0, 144, 48, 16);
  labelAreaVY.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaVY.setText("Vel Y");
  labelAreaVY.setOpaque(false);
  labelAreaMin = new GLabel(this, 48, 96, 48, 16);
  labelAreaMin.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaMin.setText("Min");
  labelAreaMin.setOpaque(false);
  labelAreaMax = new GLabel(this, 96, 96, 48, 16);
  labelAreaMax.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaMax.setText("Max");
  labelAreaMax.setOpaque(false);
  dropListObj = new GDropList(this, 48, 80, 96, 80, 4, 10);
  dropListObj.setItems(loadStrings("list_859383"), 0);
  dropListObj.addEventHandler(this, "dropListObj_click");
  textMinQuant = new GTextField(this, 48, 112, 48, 16, G4P.SCROLLBARS_NONE);
  textMinQuant.setOpaque(true);
  textMinQuant.addEventHandler(this, "textMinQuant_change");
  textMaxQuant = new GTextField(this, 96, 112, 48, 16, G4P.SCROLLBARS_NONE);
  textMaxQuant.setOpaque(true);
  textMaxQuant.addEventHandler(this, "textMaxQuant_change");
  textMinVX = new GTextField(this, 48, 128, 48, 16, G4P.SCROLLBARS_NONE);
  textMinVX.setOpaque(true);
  textMinVX.addEventHandler(this, "textMinVX_change");
  textMaxVX = new GTextField(this, 96, 128, 48, 16, G4P.SCROLLBARS_NONE);
  textMaxVX.setOpaque(true);
  textMaxVX.addEventHandler(this, "textMaxVX_change");
  textMinVY = new GTextField(this, 48, 144, 48, 16, G4P.SCROLLBARS_NONE);
  textMinVY.setOpaque(true);
  textMinVY.addEventHandler(this, "textMinVY_change");
  textMaxVY = new GTextField(this, 96, 144, 48, 16, G4P.SCROLLBARS_NONE);
  textMaxVY.setOpaque(true);
  textMaxVY.addEventHandler(this, "textMaxVY_change");
  buttonAreaColor1 = new GButton(this, 8, 304, 32, 16);
  buttonAreaColor1.setText("C 1");
  buttonAreaColor1.addEventHandler(this, "buttonAreaColor1_click");
  buttonAreaColor2 = new GButton(this, 40, 304, 32, 16);
  buttonAreaColor2.setText("C 2");
  buttonAreaColor2.addEventHandler(this, "buttonAreaColor2_click");
  textAreaX = new GTextField(this, 48, 24, 48, 16, G4P.SCROLLBARS_NONE);
  textAreaX.setOpaque(true);
  textAreaX.addEventHandler(this, "textAreaX_change");
  textAreaY = new GTextField(this, 96, 24, 48, 16, G4P.SCROLLBARS_NONE);
  textAreaY.setOpaque(true);
  textAreaY.addEventHandler(this, "textAreaY_change");
  textAreaWid = new GTextField(this, 48, 40, 48, 16, G4P.SCROLLBARS_NONE);
  textAreaWid.setOpaque(true);
  textAreaWid.addEventHandler(this, "textAreaWid_change");
  textAreaHei = new GTextField(this, 96, 40, 48, 16, G4P.SCROLLBARS_NONE);
  textAreaHei.setOpaque(true);
  textAreaHei.addEventHandler(this, "textAreaHei_change");
  textAreaSeed = new GTextField(this, 48, 56, 48, 16, G4P.SCROLLBARS_NONE);
  textAreaSeed.setOpaque(true);
  textAreaSeed.addEventHandler(this, "textAreaSeed_change");
  labelAreaDiam = new GLabel(this, 0, 176, 48, 16);
  labelAreaDiam.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaDiam.setText("Diam");
  labelAreaDiam.setOpaque(false);
  textMinRange = new GTextField(this, 48, 160, 48, 16, G4P.SCROLLBARS_NONE);
  textMinRange.setOpaque(true);
  textMinRange.addEventHandler(this, "textMinRange_change");
  textMaxRange = new GTextField(this, 96, 160, 48, 16, G4P.SCROLLBARS_NONE);
  textMaxRange.setOpaque(true);
  textMaxRange.addEventHandler(this, "textMaxRange_change");
  labelAreaRange = new GLabel(this, 0, 160, 48, 16);
  labelAreaRange.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaRange.setText("Range");
  labelAreaRange.setOpaque(false);
  labelAreaRot = new GLabel(this, 0, 192, 48, 16);
  labelAreaRot.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaRot.setText("Rot");
  labelAreaRot.setOpaque(false);
  labelAreaFlow = new GLabel(this, 0, 208, 48, 16);
  labelAreaFlow.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelAreaFlow.setText("Flow");
  labelAreaFlow.setOpaque(false);
  textMinDiam = new GTextField(this, 48, 176, 48, 16, G4P.SCROLLBARS_NONE);
  textMinDiam.setOpaque(true);
  textMinDiam.addEventHandler(this, "textMinDiam_change");
  textMaxDiam = new GTextField(this, 96, 176, 48, 16, G4P.SCROLLBARS_NONE);
  textMaxDiam.setOpaque(true);
  textMaxDiam.addEventHandler(this, "textMaxDiam_change");
  textMinRot = new GTextField(this, 48, 192, 48, 16, G4P.SCROLLBARS_NONE);
  textMinRot.setOpaque(true);
  textMinRot.addEventHandler(this, "textMinRot_change");
  textMaxRot = new GTextField(this, 96, 192, 48, 16, G4P.SCROLLBARS_NONE);
  textMaxRot.setOpaque(true);
  textMaxRot.addEventHandler(this, "textMaxRot_change");
  textMinFlow = new GTextField(this, 48, 208, 48, 16, G4P.SCROLLBARS_NONE);
  textMinFlow.setOpaque(true);
  textMinFlow.addEventHandler(this, "textMinFlow_change");
  textMaxFlow = new GTextField(this, 96, 208, 48, 16, G4P.SCROLLBARS_NONE);
  textMaxFlow.setOpaque(true);
  textMaxFlow.addEventHandler(this, "textMaxFlow_change");
  buttonAreaDel = new GButton(this, 80, 304, 64, 16);
  buttonAreaDel.setText("Delete");
  buttonAreaMove = new GButton(this, 8, 328, 64, 16);
  buttonAreaMove.setText("Move");
  buttonAreaClone = new GButton(this, 80, 328, 64, 16);
  buttonAreaClone.setText("Clone");
  cbAreaFollowX = new GCheckbox(this, 0, 232, 80, 16);
  cbAreaFollowX.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbAreaFollowX.setText("Follow X");
  cbAreaFollowX.setOpaque(false);
  cbAreaFollowY = new GCheckbox(this, 0, 248, 80, 16);
  cbAreaFollowY.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbAreaFollowY.setText("Follow Y");
  cbAreaFollowY.setOpaque(false);
  cbAreaBounceX = new GCheckbox(this, 0, 264, 80, 16);
  cbAreaBounceX.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbAreaBounceX.setText("Bounce X");
  cbAreaBounceX.setOpaque(false);
  cbAreaBounceY = new GCheckbox(this, 0, 280, 80, 16);
  cbAreaBounceY.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  cbAreaBounceY.setText("Bounce Y");
  cbAreaBounceY.setOpaque(false);
  panelAreaProperties.addControl(labelAreaPos);
  panelAreaProperties.addControl(labelAreaDim);
  panelAreaProperties.addControl(labelAreaObjs);
  panelAreaProperties.addControl(labelAreaQuant);
  panelAreaProperties.addControl(labelAreaSeed);
  panelAreaProperties.addControl(labelAreaVX);
  panelAreaProperties.addControl(labelAreaVY);
  panelAreaProperties.addControl(labelAreaMin);
  panelAreaProperties.addControl(labelAreaMax);
  panelAreaProperties.addControl(dropListObj);
  panelAreaProperties.addControl(textMinQuant);
  panelAreaProperties.addControl(textMaxQuant);
  panelAreaProperties.addControl(textMinVX);
  panelAreaProperties.addControl(textMaxVX);
  panelAreaProperties.addControl(textMinVY);
  panelAreaProperties.addControl(textMaxVY);
  panelAreaProperties.addControl(buttonAreaColor1);
  panelAreaProperties.addControl(buttonAreaColor2);
  panelAreaProperties.addControl(textAreaX);
  panelAreaProperties.addControl(textAreaY);
  panelAreaProperties.addControl(textAreaWid);
  panelAreaProperties.addControl(textAreaHei);
  panelAreaProperties.addControl(textAreaSeed);
  panelAreaProperties.addControl(labelAreaDiam);
  panelAreaProperties.addControl(textMinRange);
  panelAreaProperties.addControl(textMaxRange);
  panelAreaProperties.addControl(labelAreaRange);
  panelAreaProperties.addControl(labelAreaRot);
  panelAreaProperties.addControl(labelAreaFlow);
  panelAreaProperties.addControl(textMinDiam);
  panelAreaProperties.addControl(textMaxDiam);
  panelAreaProperties.addControl(textMinRot);
  panelAreaProperties.addControl(textMaxRot);
  panelAreaProperties.addControl(textMinFlow);
  panelAreaProperties.addControl(textMaxFlow);
  panelAreaProperties.addControl(buttonAreaDel);
  panelAreaProperties.addControl(buttonAreaMove);
  panelAreaProperties.addControl(buttonAreaClone);
  panelAreaProperties.addControl(cbAreaFollowX);
  panelAreaProperties.addControl(cbAreaFollowY);
  panelAreaProperties.addControl(cbAreaBounceX);
  panelAreaProperties.addControl(cbAreaBounceY);
}

// Variable declarations 
// autogenerated do not edit
GPanel panelCreate; 
GButton buttonRock; 
GButton buttonTrunk; 
GButton buttonFlow; 
GButton buttonWhirl; 
GButton buttonLeaf; 
GButton buttonExit; 
GButton buttonStar; 
GButton buttonKiller; 
GButton buttonArea; 
GPanel panelProperties; 
GLabel labelPos; 
GLabel labelFlow; 
GLabel labelRange; 
GLabel labelVel; 
GLabel labelDiam; 
GLabel labelDim; 
GLabel labelAngle; 
GLabel labelARot; 
GLabel labelRot; 
GTextField textX; 
GTextField textY; 
GTextField textFX; 
GTextField textFY; 
GTextField textRange; 
GTextField textVX; 
GTextField textVY; 
GTextField textDiam; 
GTextField textWid; 
GTextField textHei; 
GTextField textAngle; 
GTextField textARot; 
GButton buttonDel; 
GCheckbox cbFollowX; 
GCheckbox cbFollowY; 
GButton buttonColor; 
GCheckbox cbBounceX; 
GCheckbox cbBounceY; 
GButton buttonMove; 
GButton buttonClone; 
GTextField textRot; 
GPanel panelNew; 
GLabel labelNewRocks; 
GLabel labelNewTrunks; 
GLabel labelNewWhirls; 
GLabel labelNewNum; 
GLabel labelNewMaxWidth; 
GTextField textRockNum; 
GTextField textTrunkNum; 
GTextField textWhirlNum; 
GTextField textRockMax; 
GTextField textTrunkMax; 
GTextField textWhirlMaxFlow; 
GTextField textWhirlMaxRot; 
GLabel labelNewMaxFlow; 
GLabel labelNewMaxRot; 
GButton buttonRockColor1; 
GButton buttonRockColor2; 
GButton buttonWhirlColor1; 
GButton buttonWhirlColor2; 
GButton buttonTrunkColor1; 
GButton buttonTrunkColor2; 
GPanel panelLevel; 
GLabel labelLevelDim; 
GTextField textW; 
GTextField textH; 
GCheckbox cbGFollowX; 
GCheckbox cbGFollowY; 
GCheckbox cbRotate; 
GLabel labelLevelScale; 
GTextField textScale; 
GCheckbox cbTiltX; 
GCheckbox cbTiltY; 
GLabel labelLevelMaxTilt; 
GTextField textMaxTilt; 
GLabel labelLevelSavedLeafs; 
GTextField textVictory; 
GButton buttonBg; 
GButton buttonColor1; 
GButton buttonColor2; 
GButton buttonControlsColor; 
GLabel labelIntroText; 
GTextArea textIntro; 
GLabel labelLevelStars; 
GTextField textPoints; 
GButton buttonLoad; 
GButton buttonSaveAs; 
GCheckbox cbSnap; 
GTextField textS; 
GButton buttonNew; 
GSlider sliderScale; 
GButton buttonSave; 
GPanel panelAreaProperties; 
GLabel labelAreaPos; 
GLabel labelAreaDim; 
GLabel labelAreaObjs; 
GLabel labelAreaQuant; 
GLabel labelAreaSeed; 
GLabel labelAreaVX; 
GLabel labelAreaVY; 
GLabel labelAreaMin; 
GLabel labelAreaMax; 
GDropList dropListObj; 
GTextField textMinQuant; 
GTextField textMaxQuant; 
GTextField textMinVX; 
GTextField textMaxVX; 
GTextField textMinVY; 
GTextField textMaxVY; 
GButton buttonAreaColor1; 
GButton buttonAreaColor2; 
GTextField textAreaX; 
GTextField textAreaY; 
GTextField textAreaWid; 
GTextField textAreaHei; 
GTextField textAreaSeed; 
GLabel labelAreaDiam; 
GTextField textMinRange; 
GTextField textMaxRange; 
GLabel labelAreaRange; 
GLabel labelAreaRot; 
GLabel labelAreaFlow; 
GTextField textMinDiam; 
GTextField textMaxDiam; 
GTextField textMinRot; 
GTextField textMaxRot; 
GTextField textMinFlow; 
GTextField textMaxFlow; 
GButton buttonAreaDel; 
GButton buttonAreaMove; 
GButton buttonAreaClone; 
GCheckbox cbAreaFollowX; 
GCheckbox cbAreaFollowY; 
GCheckbox cbAreaBounceX; 
GCheckbox cbAreaBounceY; 
