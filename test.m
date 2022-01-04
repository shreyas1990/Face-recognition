
                            %%% Forward propagation. %%%
%%%%%%%% The function gives the accuracy with which the classification happened. %%%%%%%%

function [out error accuracy]  = test(weightInputToHidden, weightHiddenToOutput, testFaces, oFaces)
 test = 1./(1+exp(-testFaces));
 opt = 1./(1+exp(-(weightInputToHidden*[test;ones(1,length(test(1,:)))])));
 ot = 1./(1+exp(-(weightHiddenToOutput*[opt;ones(1,length(test(1,:)))])));
out = round(ot);

error = out - oFaces;
accuracy = max(error(:,:));
accuracy = 100*length(find(accuracy == 0))/length(accuracy);
end