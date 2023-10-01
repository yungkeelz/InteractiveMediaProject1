int buttonWidth = 200;
int buttonHeight = 50;
Button[] buttons = new Button[4];

void setup() {
  size(600, 500);
  background(240);

  // Create buttons
  for (int i = 0; i < 4; i++) {
    buttons[i] = new Button((width - buttonWidth) / 2, 150 + i * (buttonHeight + 10), buttonWidth, buttonHeight, "level " + (i+1));
  }
}

void draw() {
  background(240);
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  text("Building 11 Density", width/2, 50);
  
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
}

void mouseClicked() {
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].clicked(mouseX, mouseY);
  }
}

class Button {
  float x, y, w, h;
  String label;

  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }

  void display() {
    fill(100);
    rect(x, y, w, h, 10);
    fill(255);
    textSize(20);
    text(label, x + w/2, y + h/2);
  }

  void clicked(float mx, float my) {
    if (mx > x && mx < x+w && my > y && my < y+h) {
      println(label + " clicked");
    }
  }
}
