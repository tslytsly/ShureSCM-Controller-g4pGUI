class Button {

  color c;
  float xpos;
  float ypos;
  float radius;
  int buttonNum;

  Button(float x_, float y_, float r_, color c_, int num) {
    c = c_;
    xpos = x_;
    ypos = y_;
    radius = r_;
    buttonNum = num;
  }

  void show() {
    fill(c);
    rect(xpos, ypos, radius, radius);
  }
  
  boolean clicked(){
    //println(xpos + " " + mouseX + " " + ypos + " " + mouseY);
    return((mouseX >= xpos && mouseX <= xpos+radius) && (mouseY >= ypos && mouseY <= ypos+radius));
  }
  
  void getState(){
   myClient.write("< GET " + str(buttonNum) + " AUDIO_MUTE >"); 
  }
}