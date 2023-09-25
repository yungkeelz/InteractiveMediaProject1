void setup() {
  size(800, 600);
  background(255);
  noLoop();
}

void draw() {
  // Building outline
  stroke(0); // Black color
  fill(255); // White fill
  rect(50, 50, 700, 500);

  // Big square room in one corner
  rect(50, 50, 250, 250);
  
  // Small rectangular rooms
  rect(650, 100, 90, 150); // Top right corner
  rect(650, 350, 90, 150); // Bottom right corner
  
  // Elevator section in the middle of the top edge
  fill(200); // Light gray for the elevator to differentiate
  rect(370, 50, 150, 60, 20);

  // Entrance and Exit
  fill(0); // Black color for entrance/exit
  rect(50, 275, 10, 50); // Entrance on the left
  rect(740, 275, 10, 50); // Exit on the right
}
