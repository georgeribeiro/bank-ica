function [net] = mlp(inputs_train, targets_train)
    hidden_layers = [16, 8];
    trainFcn = 'trainlm';
    transferFcn = 'logsig';

    net = feedforwardnet(hidden_layers, trainFcn);
    net.divideParam.trainRatio = 1;
    net.divideParam.valRatio = 0;
    net.divideParam.testRatio = 0;
    net.trainParam.mu = 0.01;
    net.trainParam.goal = 0.001;
    net.trainParam.epochs = 1000;
    net.trainParam.max_fail = 500;
    net.trainParam.min_grad = 0.0000001;
    net.trainParam.lr = 0.1;
    
    [~, c] = size(hidden_layers);
    for i = 1:c
       net.layers{i}.transferFcn = transferFcn; 
    end
    
    [net, ~] = train(net, inputs_train, targets_train);
 end