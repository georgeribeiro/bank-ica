function [net] = mlp(inputs_train, targets_train)
    hidden_layers = [16, 1];
    trainFcn = 'trainscg';

    net = feedforwardnet(hidden_layers, trainFcn);
    
    net.performFcn = 'mse';
    
    net.divideParam.trainRatio = 1;
    net.divideParam.valRatio = 0;
    net.divideParam.testRatio = 0;
    
    % train params
    net.trainParam.mu = 0.001;
    net.trainParam.goal = 0;
    net.trainParam.epochs = 2000;
    net.trainParam.max_fail = 10;
    net.trainParam.min_grad = 0.000001;
    
    net.layers{1}.transferFcn = 'tansig';
    net.layers{2}.transferFcn = 'purelin';
    
    [net, ~] = train(net, inputs_train, targets_train);
 end