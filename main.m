
%%% this is the main function which calls all the sub programs to train and test %%%

clear all;
Name = char('an2i','at33','boland','bpm', 'ch4f', 'cheyer', 'kk49', 'night', 'saavik', 'steffi');
Position = char('straight','up');
Emotion = char('happy','sad');
Eyes = char('open');

[Faces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);    % calling the input and the expected output function
[weightInputToHidden weightHiddenToOutput errorPlot] = train(Faces, oFaces, .05);           % calling the training function
    plot(errorPlot);                                                                        % plotting the error
 
 %%% test-including the features omitted during training %%%
 Position = char('straight','up');
 Emotion = char('angry','neutral');
 Eyes = char('open');

 
[testFaces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);


[~, ~, a] = test(weightInputToHidden,weightHiddenToOutput,testFaces,oFaces);

%%% displaying the accuracy %%%
accuracy = ['The accuracy of the sample set 1 = ', int2str(a), '%'];
disp(accuracy)

%%% test- including some of the other features %%%
Position = char('straight','up');
Emotion = char('angry','neutral');
Eyes = char('sunglasses');

 
[testFaces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion, Eyes);


[~, ~, a] = test(weightInputToHidden,weightHiddenToOutput,testFaces,oFaces);
accuracy = ['The accuracy of the sample set 1 = ', int2str(a), '%'];
disp(accuracy)