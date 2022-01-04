
%%% some of the samples have been ignored in the initial test, they are %%%
%%% used to compare in the later state and to determine the accuracy %%%
clear all;
Name = char('an2i','at33','boland','bpm', 'ch4f', 'cheyer', 'kk49', 'night', 'saavik', 'steffi');
Position = char('straight','up');
Emotion = char('happy','sad');
Eyes = char('open');

%%% loading the  data %%%
[Faces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);

%%% training the samples and obtaining the weights %%%
[weightInputToHidden weightHiddenToOutput errorPlot] = train(Faces, oFaces, .01);

%%% plotting the  error graph %%%
plot(errorPlot);
title('expected output vs actual output');
xlabel('Iteration');
ylabel('error');

%%% test for a set of samples which are not part of the training sample %%%
Position = char('straight','up');
Emotion = char('angry','neutral');
Eyes = char('open');

[testFaces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);

%%% displaying the accuracy %%%
[op err a] = test(weightInputToHidden,weightHiddenToOutput,testFaces,oFaces);
accuracy = ['The accuracy of the sample set 1 = ', int2str(a), '%'];
disp(accuracy);

