import g4p_controls.*; //<>//
import processing.net.*;

String ipAddress = "127.0.0.1";
int port = 2202;

int channels = 4; // num channels on mixer
int buttonRadius = 100;

boolean connected = false;
boolean globalMute = false;


Button[] buttons;

Client myClient; 
String dataIn; 

void setup() { 
  size(800, 600, JAVA2D);
  createGUI();

  // create button objects
  int spacing = floor(width/channels);
  buttons = new Button[channels];
  for (int i=1; i <= channels; i++) {
    buttons[i-1] = new Button(i*spacing-buttonRadius-buttonRadius/2, height - 200, buttonRadius, 255, i);
  }

  //connect to SCM
  myClient = new Client(this, ipAddress, port);
  connectTCPClient();
} 

void draw() { 
  background(125);

  //check that the TCP session is up
  noStroke();
  if (myClient.active()) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(50, 50, 5, 5);

  //draw buttons
  for (int i=0; i < buttons.length; i++) {
    buttons[i].show();
  }
} 

// receive data from SCM
void clientEvent(Client myClient) {

  if (myClient.available() > 0) {
    dataIn = myClient.readStringUntil('>');
    print("Server Says:  ");
    println(dataIn);

    // is this a state change report?
    if (dataIn == null) {
    } else if (dataIn.contains("REP")) {
      //mute on?
      if (dataIn.contains("AUDIO_MUTE ON")) {
        //which channel?
        int chnl = int(dataIn.charAt(6))-49;
        if (buttons[chnl] != null) {
          buttons[chnl].c = color(255, 0, 0);
        }
      } else if (dataIn.contains("AUDIO_MUTE OFF")) { // mute off?
        //which channel?
        int chnl = int(dataIn.charAt(6))-49;
        if (buttons[chnl] != null) {
          buttons[chnl].c = color(0, 255, 0);
        }
      }
    }
  }
}

void mouseReleased() {
  // Tell the server which button was pressed
  for (int i=0; i < buttons.length; i++) {
    if (buttons[i].clicked()) {
      myClient.write("< SET " + str(i+1) + " AUDIO_MUTE TOGGLE >");
    }
  }
}

void connectTCPClient() {
  if (myClient.active() != true) {
    myClient.stop();
    myClient = new Client(this, ipAddress, port);
  }

  //get initial channel states
  for (int i=0; i < buttons.length; i++) {
    buttons[i].getState();
  }
}