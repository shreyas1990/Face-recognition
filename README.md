# Face-recognition
This repository contains the implementation of Back propagation based Neural network to recognise faces.


INPUT
The input to the problem consists of sets of images with different attributes associated with each image.
Attributes: 
• name- name of the person
• emotion-whether the person was angry,sad,happy,neutral
• position-which direction he/she was looking at ( i.e. up,straight,left,right)
• eyes-if the eyes were covered with sunglasses or if it were open

ALGORITHM
The main algorithm used in this project is the back-propagation algorithm. It can be divided into two phases : propagation and weight updates.
Propogation phase:
• Forward propagation of a training pattern's input through the neural network in order to generate the output activations.
• Backward propagation of the propagation's output activations through the neural network using the training pattern target in order to generate the deltas of all output and hidden neurons.

Weight Update:
• Multiply its output delta and input activation to get the gradient of the weight.
• Subtract a ratio (percentage) of the gradient from the weight.

PSEUDOCODE
Initialize the network weights.
Repeat :
  for each training sample
  // forward pass //
    prediction = neural-net-output
    actual = teacher-output
    calculate the error (prediction-actual)
  // backward pass //
    compute the deltawh for all weights from hidden layer to output layer
    compute the deltawi for all weights from input layer to hidden layer
    update network weights until all samples are classified correctly
return the network

