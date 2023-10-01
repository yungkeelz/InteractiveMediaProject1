import controlP5.*;
import processing.sound.*;

SoundFile soundfile;

Table peopleData_00_In, peopleData_02_In, peopleData_05_In, temperatureData;
int maxPeople;
int numDots;
PVector[] dots;
ControlP5 cp5;
Slider timeSlider;
int Time = 30;
color currentColor, targetColor;
PVector[] targetPositions;
float lerpSpeed = 0.005;
PImage floorplan, floorplan2, floorplan5;
String currentLevel = "Level 00";
float minTemp =  18.83871;  
float maxTemp =  22.51613; 
int index = 0;

void setup() {
  size(800, 600, P3D);
  frameRate(30);

  floorplan = loadImage("00.png");
  floorplan2 = loadImage("02.png");
  floorplan5 = loadImage("05.png");

  peopleData_00_In = loadTable("CB11.PC00.06.West_ CB11.00.Wattle In.csv", "csv");
  peopleData_02_In = loadTable("CB11.PC02.14.Broadway_ CB11.02.Broadway.East In.csv", "csv");
  peopleData_05_In = loadTable("CB11.PC05.23_ CB11.05.CR09 In.csv", "csv");
  temperatureData = loadTable("ES_B_05_416_7C15_ Temperature Celsius.csv");

  cp5 = new ControlP5(this);

  timeSlider = cp5.addSlider("Time")
    .setPosition(100, 550)
    .setWidth(600)
    .setHeight(20)
    .setRange(0, 1440)
    .setValue(0)
    .setColorForeground(color(120))
    .setColorBackground(color(50));

  cp5.addButton("Level 00")
    .setPosition(650, 40)
    .onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        currentLevel = "Level 00";
        index = 0;
      }
    });

  cp5.addButton("Level 02")
    .setPosition(650, 60)
    .onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        currentLevel = "Level 02";
        index = 0;
      }
    });

  cp5.addButton("Level 05")
    .setPosition(650, 80)
    .onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        currentLevel = "Level 05";
        index = 0;
      }
    });

  currentColor = color(200, 200, 200);
  targetColor = color(200, 200, 200);

  targetPositions = new PVector[1000];
  for (int i = 0; i < targetPositions.length; i++) {
    targetPositions[i] = new PVector(random(0, width), random(0, height), random(-300, 300));
  }
}

void draw() {
  background(0);
  lights();

  Table currentData;
  if (currentLevel.equals("Level 00")) {
    currentData = peopleData_00_In;
    image(floorplan, 0, 0, width, height);
  } else if (currentLevel.equals("Level 02")) {
    currentData = peopleData_02_In;
    image(floorplan2, 0, 0, width, height);
  } else {
    currentData = peopleData_05_In;
    image(floorplan5, 0, 0, width, height);
  }

  Time = int(timeSlider.getValue());
  float temperature = getTemperature(Time);

  fill(255);
  textAlign(LEFT);
  textSize(14);
  text("UTS BUILDING 11", 90, 50);
  text("People Entered Through Here Today: " + numDots, 90, 70);
  int hours = Time / 60;
  int minutes = Time % 60;
  text("Time: " + nf(hours, 2) + ":" + nf(minutes, 2), 90, 90);
  text("Temperature: " + nf(temperature,2,2) + " °C", 90, 110);

  float intensity = map(temperature, minTemp, maxTemp, 0, 1);
  currentColor = lerpColor(color(255, 255, 255), color(255, 0, 0), intensity);

  maxPeople = getMaxPeople(currentData);
  numDots = int(map(Time, 0, 1440, 0, maxPeople));

  drawDots3D();
}

void drawDots3D() {
  pushMatrix();
  translate(width / 2, height / 2, -200);

  dots = new PVector[numDots];
  for (int i = 0; i < numDots; i++) {
    if (dots[i] == null) {
      dots[i] = new PVector(random(0, width), random(0, height), random(-300, 300));
    }

    dots[i].x = lerp(dots[i].x, targetPositions[i].x, lerpSpeed);
    dots[i].y = lerp(dots[i].y, targetPositions[i].y, lerpSpeed);
    dots[i].z = lerp(dots[i].z, targetPositions[i].z, lerpSpeed);

    float intensity = map(Time, 0, 1440, 0, 1);
    color dotColor = lerpColor(color(255, 255, 255), color(255, 0, 0), intensity);

    pushMatrix();
    translate(dots[i].x - width / 2, dots[i].y - height / 2, dots[i].z);
    fill(dotColor);
    noStroke();
    sphere(10);
    popMatrix();
  }

  popMatrix();
}

int getMaxPeople(Table data) {
  int max = 0;
  for (int i = 0; i < data.getRowCount(); i++) {
    int numPeople = data.getInt(i, 1);
    if (numPeople > max) {
      max = numPeople;
    }
  }
  return max;
}

float getTemperature(int time) {
  for (TableRow row : temperatureData.rows()) {
    int t = row.getInt(0);
    if (t >= time) {
      return row.getFloat(1);
    }
  }
  return 0;
}
