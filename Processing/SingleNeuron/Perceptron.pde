class Perceptron {
  float [] weights = new float[2];
  float learningRate = 0.1;
  
  Perceptron() {
    // initialize weights randomly
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] inputs) {
    
    // weighted sum of the inputs
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i] * weights[i];
    }
    
    // activation function SIGN
    return sign(sum);
  }
  
  int sign(float n) {
    if (n >= 0) {
      return 1;
    }
    else {
      return -1;
    }
  }
  
  void train(float[] inputs, int target) {
    // compute the error
    int guess = guess(inputs);
    // correct answer - perceptrons guess
    int error = target - guess;
    
    // adjust all the weights
    for (int i = 0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * learningRate;
    }
  }
}