
%%% some of the samples have been ignored in the initial test, they are %%%
%%% used to compare in the later state and to determine the accuracy %%%
clear all;
Name = char('an2i','at33','boland','bpm', 'ch4f', 'cheyer', 'kk49', 'night', 'saavik', 'steffi');
Position = char('up','left');
Emotion = char('angry','happy','neutral','sad');
Eyes = char('open');

%%% loading the data %%%
[Faces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);

%%% training the samples and obtaining the weights %%%
[weightInputToHidden weightHiddenToOutput errorPlot] = train(Faces, oEmotion, .05);

%%% plotting the  error graph %%%
plot(errorPlot);
title('expected output vs actual output');
xlabel('Iteration');
ylabel('error');

%%% testing for a set of samples which are not part of training sample %%%
Position = char('right','straight');

[testFaces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);

%%% displaying the accuracy %%%
[op err a] = test(weightInputToHidden,weightHiddenToOutput,testFaces,oEmotion);
accuracy = ['The accuracy of the sample set 1 = ', int2str(a), '%'];
disp(accuracy);

