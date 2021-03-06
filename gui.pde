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

public void btnCh1_click1(GButton source, GEvent event) { //_CODE_:btnCh1:900756:
  myClient.write("< SET 1 AUDIO_MUTE TOGGLE >");
} //_CODE_:btnCh1:900756:

public void btnCh2_click1(GButton source, GEvent event) { //_CODE_:btnCh2:636520:
  myClient.write("< SET 2 AUDIO_MUTE TOGGLE >");
} //_CODE_:btnCh2:636520:

public void btnReset_click1(GButton source, GEvent event) { //_CODE_:btnReset:467145:
  connectTCPClient();
} //_CODE_:btnReset:467145:

public void btnCh3_click1(GButton source, GEvent event) { //_CODE_:btnCh3:899034:
  myClient.write("< SET 3 AUDIO_MUTE TOGGLE >");
} //_CODE_:btnCh3:899034:

public void btnCh4_click1(GButton source, GEvent event) { //_CODE_:btnCh4:529906:
  myClient.write("< SET 4 AUDIO_MUTE TOGGLE >");
} //_CODE_:btnCh4:529906:

public void btn_muteAll_click1(GButton source, GEvent event) { //_CODE_:btn_muteAll:835687:
  if (!globalMute){
    for (int i = 0; i < buttons.length; i++){
     myClient.write("< SET "+ (i + 1) + " AUDIO_MUTE ON >");
    }
    globalMute = true;
  } else {
    for (int i = 0; i < buttons.length; i++){
     myClient.write("< SET "+ (i + 1) + " AUDIO_MUTE OFF >");
    }
    globalMute = false;
  }
} //_CODE_:btn_muteAll:835687:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.CYAN_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  btnCh1 = new GButton(this, 200, 320, 80, 30);
  btnCh1.setText("Channel 1");
  btnCh1.setTextBold();
  btnCh1.addEventHandler(this, "btnCh1_click1");
  btnCh2 = new GButton(this, 300, 320, 80, 30);
  btnCh2.setText("Channel 2");
  btnCh2.setTextBold();
  btnCh2.addEventHandler(this, "btnCh2_click1");
  btnReset = new GButton(this, 50, 10, 80, 30);
  btnReset.setText("Reset Connection");
  btnReset.setTextBold();
  btnReset.addEventHandler(this, "btnReset_click1");
  btnCh3 = new GButton(this, 400, 320, 80, 30);
  btnCh3.setText("Channel 3");
  btnCh3.setTextBold();
  btnCh3.addEventHandler(this, "btnCh3_click1");
  btnCh4 = new GButton(this, 500, 320, 80, 30);
  btnCh4.setText("Channel 4");
  btnCh4.setTextBold();
  btnCh4.addEventHandler(this, "btnCh4_click1");
  btn_muteAll = new GButton(this, 150, 10, 80, 30);
  btn_muteAll.setText("Mute/Umute All");
  btn_muteAll.setTextBold();
  btn_muteAll.addEventHandler(this, "btn_muteAll_click1");
}

// Variable declarations 
// autogenerated do not edit
GButton btnCh1; 
GButton btnCh2; 
GButton btnReset; 
GButton btnCh3; 
GButton btnCh4; 
GButton btn_muteAll; 