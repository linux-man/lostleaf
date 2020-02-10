import javax.swing.*;
import javax.swing.filechooser.*;

import javax.swing.JColorChooser;
import javax.swing.colorchooser.AbstractColorChooserPanel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;

File openDialog(String title) {
  FileNameExtensionFilter f;
  JFileChooser chooser = new JFileChooser();
  f = new FileNameExtensionFilter("Level files", "ll");
  chooser.addChoosableFileFilter(f);
  chooser.setFileFilter(f);
  chooser.setDialogTitle(title);
  chooser.setSelectedFile(new File(sketchPath() + "/data/."));
  int returnVal = chooser.showOpenDialog(this.frame);
  if (returnVal == JFileChooser.APPROVE_OPTION) return chooser.getSelectedFile();
  return null;
}

File saveDialog(String title) {
  FileNameExtensionFilter f;
  if(level == null) level = new File(sketchPath() + "/data/.");
  JFileChooser chooser = new JFileChooser();
  f = new FileNameExtensionFilter("Level files", "ll");
  chooser.addChoosableFileFilter(f);
  chooser.setFileFilter(f);
  chooser.setDialogTitle(title);
  chooser.setSelectedFile(level);
  int returnVal = chooser.showSaveDialog(this.frame);
  if (returnVal == JFileChooser.APPROVE_OPTION) {
    return chooser.getSelectedFile();
  }
  return null;
}

Color result;

color colorChooser(color c) {
  result = new Color(int(red(c)), int(green(c)), int(blue(c)), int(alpha(c)));
  final JColorChooser CC = new JColorChooser();
  CC.setColor(result);
  CC.setPreviewPanel(new JPanel());
  AbstractColorChooserPanel[] panels = CC.getChooserPanels();
  for (AbstractColorChooserPanel accp : panels) {
    if(!(accp.getDisplayName().equals("RGB") || accp.getDisplayName().equals("Swatches") || accp.getDisplayName().equals("HSL"))) {
      CC.removeChooserPanel(accp);
    }
  }
  JDialog dialog = JColorChooser.createDialog(this.frame, "Select color", true, CC,
  new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      result = CC.getColor();
    }
  },
  null);
  dialog.setVisible(true);
  return color(result.getRed(), result.getGreen(), result.getBlue(), result.getAlpha());
}
