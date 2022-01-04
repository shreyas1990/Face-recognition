%%% Given a set of attributes, this function will load the image from the input folder and returns all images,its features and the class it belongs to %%%

function [Faces oFaces oPosition oEmotion oEyes] = InputAndOutput(Name, Position, Emotion,Eyes)

Faces = [];
oFaces = [];            % expected output for the face
oPosition = [];         % expected output for the position
oEmotion = [];          % expected output for the emotion
oEyes = [];             % expected output for the eyes

for i = 1:length(Name(:,1))
    for j = 1:length(Position(:,1))
        for k = 1:length(Emotion(:,1))
            for l = 1:length(Eyes(:,1))
                image1 = imread(strcat(Name(i,:),'/',Name(i,:),'_',Position(j,:),'_',Emotion(k,:),'_',Eyes(l,:),'_','4.pgm'));          % reading the image from the input folder
                Faces(:,((((((i-1)*length(Position(:,1)))+j-1)*length(Emotion(:,1)))+k-1)*length(Eyes(:,1)))+l) = image1(:);            % storing the read image in the Faces array

                
                %%% returning the eexpected value for face %%%
                fac = zeros(length(Name(:,1)),1);
                fac(i) = 1;
                oFaces(:,((((((i-1)*length(Position(:,1)))+j-1)*length(Emotion(:,1)))+k-1)*length(Eyes(:,1)))+l) = fac';
                
                
                %%% returning the expected value for position of the face %%% 
                pos = zeros(length(Position(:,1)),1);
                pos(j) = 1;
                oPosition(:,((((((i-1)*length(Position(:,1)))+j-1)*length(Emotion(:,1)))+k-1)*length(Eyes(:,1)))+l) = pos';
                
                
                %%% returning the emotion %%%
                emo = zeros(length(Emotion(:,1)),1);
                emo(k) = 1;
                oEmotion(:,((((((i-1)*length(Position(:,1)))+j-1)*length(Emotion(:,1)))+k-1)*length(Eyes(:,1)))+l) = emo';
                
                
                
                %%% returning the status of the eyes %%%
                tEyes = zeros(length(Eyes(:,1)),1);
                tEyes(l) = 1;
                oEyes(:,((((((i-1)*length(Position(:,1)))+j-1)*length(Emotion(:,1)))+k-1)*length(Eyes(:,1)))+l) = tEyes';
            end
        end
    end
end
end