import g4p_controls.*;
import de.looksgood.ani.*;
import controlP5.*;

ControlP5 controlP5;
Knob myKnobA;

// Declare some buttons for the interface
GImageButton[] gimagebtn_digit_buttons = new GImageButton[9];
GImageButton gimagebtn_stop_btn, gimagebtn_start_btn; 

PImage[] pimage_screens_list = new PImage[4]; // 4 digits in the LCD screen


int space_btw_row = 80;
int space_btw_col = 90;
int x_start_btn = 80;
int y_start_btn = 250;
int btn_size= 50;

int count_time = 60;

void setup() {
// Set up the size for microwave interface
  size(400, 600);
  
// Set 1 frame per second  
  frameRate(1);
  
  
// "Ani" for animation, perhap will be used later.
  Ani.init(this);
  
  smooth();
  
// Create a knob for power level
  controlP5 = new ControlP5(this);
  myKnobA = controlP5.addKnob("knob",100,200,180,170,140,60);
  myKnobA.setCaptionLabel("8")
    .setNumberOfTickMarks(10)
    .snapToTickMarks(true)
    .setColorForeground(color(255))
    .setColorBackground(color(0, 160, 100))
    .setColorActive(color(255,255,0))
    .setColorValue(color(0, 160, 100));

// Draw 9 buttons (1->9) into 3x3 matrix.
for (int i=0; i<9;i++){
  String[] img_name =  new String [] {"btn/" + (i+1)+ ".png"} ;
  gimagebtn_digit_buttons[0] = new GImageButton(this, x_start_btn + space_btw_col * (i%3),
            y_start_btn + space_btw_row * (i/3), btn_size, btn_size, img_name);
}

}

void draw() {
  background(200);
  textSize(16); 
 
  fill(225, 225, 225); 
  rect(100, 50, 200, 50); 
  
  print("time is " + count_time);
  count_time--;
 
  //delay(1000);
}



//// Event Handler

// Handle the event when the buttons were clicked
void handleButtonEvents(GImageButton button, GEvent event) {
  if (button == button && event == GEvent.CLICKED) {
      // todo
  }
}

// Handle the event when the knob was turned
void knob(int theValue) {
  myKnobA.setCaptionLabel(""+(theValue/10-10));
}
