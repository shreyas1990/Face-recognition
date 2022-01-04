
%%% some of the samples have been ignored in the initial test, they are %%%
%%% used to compare in the later state and to determine the accuracy %%%
clear all;
Name = char('an2i','at33','boland','bpm', 'ch4f', 'cheyer', 'kk49', 'night', 'saavik', 'steffi');
Position = char('right','straight');
Emotion = char('angry','happy');
Eyes = char('open','sunglasses');


%%% loading the  data %%%
[Faces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);

%%% training the samples and obtaining the  weights %%%
[weightInputToHidden weightHiddenToOutput errorPlot] = train(Faces, oEyes, .01);

%%% plotting the  error graph %%%
plot(errorPlot);
title('expected output vs actual output');
xlabel('Iteration');
ylabel('Error');

%%% testing  for a set of samples which are not part of the training sample %%% 
Emotion = char('neutral','sad');

[testFaces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);

%%% calculating the accuracy %%%
[op err a] = test(weightInputToHidden,weightHiddenToOutput,testFaces,oEyes);
accuracy = ['The accuracy of the sample set 1 = ', int2str(a), '%'];
disp(accuracy);

