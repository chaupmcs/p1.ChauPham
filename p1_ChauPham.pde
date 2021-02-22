import g4p_controls.*;
import de.looksgood.ani.*;
import controlP5.*;

ControlP5 controlP5;
Knob knob_power_level;
int knob_x = 170;
int knob_y = 140;
int knob_radius = 60;

// Declare some buttons for the interface
GImageButton[] gimagebtn_digit_buttons = new GImageButton[9]; // 9 digit buttons
GImageButton gimagebtn_stop_btn, gimagebtn_30s_btn; // other buttons

PImage[] pimage_screens_display = new PImage[4]; // 4 digits in the LCD screen
PImage[] pimage_screen_image = new PImage[10]; // 10 possible digits can be shown in the LCD screen
PImage colon;
int colon_x = 190;
int colon_y = 50;
int colon_width = 20;
int colon_height = 50;
int digit_width = 40;
int screen_y = colon_y, screen_height = colon_height;
  

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
  knob_power_level = controlP5.addKnob("knob",100,200,180,knob_x,knob_y,knob_radius);
  knob_power_level.setCaptionLabel("Power level: 8")
    .setNumberOfTickMarks(10)
    .snapToTickMarks(true)
    .setColorForeground(color(255))
    .setColorBackground(color(0, 160, 100))
    .setColorActive(color(255,255,0))
    .setColorValue(color(0, 160, 100));

// Draw 9 buttons (1->9) as a 3x3 matrix.
  for (int i=0; i<9;i++){
    String[] img_name =  new String [] {"btn/" + (i+1)+ ".png"} ;
    gimagebtn_digit_buttons[0] = new GImageButton(this, x_start_btn + space_btw_col * (i%3),
              y_start_btn + space_btw_row * (i/3), btn_size, btn_size, img_name);
  }

            
            
// Load screen digits
  for (int i=0; i<10; i++){
    pimage_screen_image[i] = loadImage("screen/" + i + ".png");
  }
  colon = loadImage("screen/colon.png");

// init pimage_screens_display to all 0(s)
for (int i=0; i<4; i++){
    pimage_screens_display[i] = pimage_screen_image[0];
}



// Draw stop btn
  gimagebtn_stop_btn = new GImageButton(this, x_start_btn, y_start_btn +space_btw_row * 3.3,
                          btn_size, btn_size, new String [] {"btn/stop.png"} );
                          
// Draw 30s btn
  gimagebtn_30s_btn = new GImageButton(this, x_start_btn+space_btw_col, y_start_btn +space_btw_row * 3.3,
                          btn_size, btn_size, new String [] {"btn/30s.png"} );
                          
// Backgound
  background(200);
  fill(50);      
  
  textSize(13); 
  text("Press any +button to START!", x_start_btn+space_btw_col*2, y_start_btn +space_btw_row * 3.3, 70, 70);
  
// Add guide for the knob
  textSize(16); 
  text("-", knob_x - 10, knob_radius + knob_y);
  text("+", knob_x + knob_radius,  knob_radius + knob_y);
  
// LCD Screen to display time
  fill(225, 225, 225); 
  rect(110, 50, 180, 50); 
  
//Add items for the screen 
  image(colon,colon_x,colon_y,colon_width,colon_height); //colon
  for (int i=0; i<4; i++){
      image(pimage_screens_display[i],colon_x + (i-2) * digit_width + int(i>=2)* colon_width, screen_y, digit_width, screen_height); 
  }


}

void draw() {
  
  // Test count down
  print("time is " + count_time);
  count_time--;
  

 
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
  knob_power_level.setCaptionLabel("Power level: "+(theValue/10-10));
}
