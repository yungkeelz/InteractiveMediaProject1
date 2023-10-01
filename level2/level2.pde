void setup() {
  size(1200, 800);
  background(240);  // Slight gray for a drafting look

  // Outer walls
  stroke(0);
  strokeWeight(5);
  rect(100, 100, 1000, 600);

  // Corridors
  int corridorWidth = 70;
  rect(100, 390, 1000, corridorWidth); // Horizontal corridor
  rect(565, 100, corridorWidth, 600);  // Vertical corridor

  // Rooms
  float roomWidth = 465;
  float roomHeight = 290;
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      rect(100 + i * (roomWidth + corridorWidth), 100 + j * (roomHeight + corridorWidth), roomWidth, roomHeight);
    }
  }

  // Elevators
  fill(150);  // Grey color for elevators
  rect(580, 405, 40, 20);
  rect(580, 445, 40, 20);

  // Staircase
  fill(220);  // Light gray
  beginShape();
  vertex(670, 395);
  vertex(720, 395);
  vertex(745, 460);
  vertex(695, 460);
  endShape(CLOSE);
  beginShape();
  vertex(670, 465);
  vertex(720, 465);
  vertex(745, 530);
  vertex(695, 530);
  endShape(CLOSE);

  // Common Area
  fill(200);
  ellipse(615, 230, 150, 100);

  // Room labels
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Room 100", 332, 240);
  text("Lab 04", 830, 240);
  text("Room  105", 332, 540);
  text("Room 102", 830, 540);

  // Elevator labels
  textAlign(LEFT, CENTER);
  text("Elevator", 540, 400);
  line(630, 400, 640, 400);
  text("1", 645, 400);
  
  text("Elevator", 540, 440);
  line(630, 440, 640, 440);
  text("2", 645, 440);

  // Staircase Label (adjusted position)
  text("Staircase", 750, 500);

  // Common Area Label
  text("Common Area", 560, 245);
  // Doors
  fill(0, 0, 255); // Blue for doors
  noStroke();
  rect(265, 385, 35, 10);  // Door for Lecture Hall
  rect(865, 385, 35, 10);  // Door for Lab
  rect(565, 685, 35, 10);  // Door for Faculty Office
  rect(650, 460, 40, 10);  // Staircase Upper Door
 // rect(650, 530, 40, 10);  // Staircase Lower Door

  rect(185, 495, 10, 25);  // Men's restroom

  // Restrooms
  fill(220);  // Light gray
  rect(100, 490, 90, 90);   // restroom


  fill(0);
  text("", 105, 280);
  line(200, 280, 210, 280);
  text("", 215, 280);
  
  text("Restroom", 105, 480);
  line(200, 480, 210, 480);
  text("", 215, 480);
}

void draw() {
  // Intentionally left blank as we don't need to animate anything
}
