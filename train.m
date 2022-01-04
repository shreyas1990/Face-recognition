

function [weightInHid weightHidOut errorPlot] = train(Faces, output, learningRate)

errorPlot= [];
numberOfInputsNodes = length(Faces(:,1));   % the number of inputs in the network
numberOfOutputsNodes = length(output(:,1)); % the number of output nodes required
numberOfImages = length(Faces(1,:));        % the number of training samples given
numberOfHiddenNodes = 30;                   % Number of nodes in hidden layer

%%% Randomly initialize weights between input and hidden layer. %%%
weightInputToHidden = 0.001*randn(numberOfHiddenNodes,numberOfInputsNodes+1);

%%% Randomly initialize weights between hidden and output layer. %%%
weightHiddenToOutput = 0.001*randn(numberOfOutputsNodes,numberOfHiddenNodes+1);

%%% sigmoid function %%%
Faces = 1./(1+exp(-(Faces)));               % activation function


for numberOfIteration = 1:100000
    overAllError = 0;
    for i = 1:numberOfImages
        
        %%%%%%%%% Forward propagation %%%%%%%%%
        
        % Input to hidden layer = weight*input;
        networkTillHidden = (weightInputToHidden(:,1:end-1)*Faces(:,i)+weightInputToHidden(:,end))';
        outputOfHidden = 1./(1+exp(-networkTillHidden));
        
        % Output of hidden layer is input to next layer 
        networkTillOutputLayer = (weightHiddenToOutput(:,1:end-1)*outputOfHidden' + weightHiddenToOutput(:,end))';
        
        %Final output.
        outputOfOutputLayer = 1./(1+exp(-networkTillOutputLayer));
        
        %%%%%%%%% Backward Propagation %%%%%%%%%
       
        % Error = Actual output-expected output.
        err = (outputOfOutputLayer-output(:,i)');
        overAllError = overAllError+abs(err);
        
        % Calculating delta from the error for output layer.
        deltaOfOutputLayer = outputOfOutputLayer.*(1-outputOfOutputLayer).*err;
        
        % Calculating delta for hidden layer from the delta of output layer.
        for allHidenNodes = 1:numberOfHiddenNodes
             summation(allHidenNodes) = weightHiddenToOutput(:,allHidenNodes)'*deltaOfOutputLayer';
        end
        deltaOfHiddenLayer = outputOfHidden.*(1-outputOfHidden).*summation;
        
        % Updating weights based on delta. 
        for allHidenNodes = 1:numberOfHiddenNodes
            weightHiddenToOutput(:,allHidenNodes) = weightHiddenToOutput(:,allHidenNodes)-learningRate*deltaOfOutputLayer(:)*outputOfHidden(allHidenNodes);
        end
        weightHiddenToOutput(:,allHidenNodes+1) = weightHiddenToOutput(:,allHidenNodes+1)-learningRate*deltaOfOutputLayer(:)*1;
       
        for allInputNodes = 1:numberOfInputsNodes
            weightInputToHidden(:,allInputNodes) = weightInputToHidden(:,allInputNodes)-learningRate*deltaOfHiddenLayer(:)*Faces(allInputNodes,i);
        end
        weightInputToHidden(:,allInputNodes+1) = weightInputToHidden(:,allInputNodes+1)-learningRate*deltaOfHiddenLayer(:)*1;
    end
    
    errorPlot = [errorPlot max(overAllError)];
    
    % Checking if error is below a threshhold
    if max(overAllError)<.001
        break;
    end
end
%%% Learnt weights %%%
weightInHid = weightInputToHidden;
weightHidOut = weightHiddenToOutput;

end