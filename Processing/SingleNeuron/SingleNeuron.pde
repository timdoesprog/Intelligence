Perceptron perceptron;
Point[] points = new Point[100];

int learningCycles = 0;


void setup() {
  size(500, 600);
  perceptron = new Perceptron();
  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }

}

void draw() {
  background(51);
  
  //display information
  textSize(16);
  fill(255);
  text("Learning Cycles: " + learningCycles, 10, height - 60);
  text("Weight 0 = " + str(perceptron.weights[0]), 10, height - 40);
  text("Weight 1 = " + str(perceptron.weights[1]), 10, height - 20);
  text("Press Space to train", width/2, height - 60);
  
  for (Point point : points) {
    point.display();
    
    // guess from perceptron
    float[] inputs = {point.x, point.y};
    int guess = perceptron.guess(inputs);
    
    // color the data
    if (guess == point.label) {
      fill(0, 255, 0);
    }
    else {
      fill(255, 0, 0);
    }
    ellipse(point.x, point.y, 8, 8);
  }
  
  // guide lines
  line(0, 0, width, height - 100);
  line(0, height - 80, width, height - 80);
}

void mousePressed() {
  
}

void keyPressed() {
  if (key == ' ') {
    // supervised learning
    for (Point point : points) {
      float[] inputs = {point.x, point.y};
      perceptron.train(inputs, point.label);
    }
    learningCycles++;
  }
}