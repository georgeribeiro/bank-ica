function [net] = mlp(inputs_train, targets_train, inputs_test, targets_test, hidden_layers, trainFcn, transferFcn)
    net = feedforwardnet(hidden_layers, trainFcn);
    net.divideParam.trainRatio = 1;
    net.divideParam.valRatio = 0;
    net.divideParam.testRatio = 0;
    net.trainParam.mu = 0.01;
    net.trainParam.goal = 0.001;
    net.trainParam.epochs = 1000;
    net.trainParam.min_grad = 0;
    
    [~, c] = size(hidden_layers);
    for i = 1:c
       net.layers{i}.transferFcn = transferFcn; 
    end
    
    [net, ~] = train(net, inputs_train, targets_train);
    
    outputs = net(inputs_test);
    outputs
    
    % comparação
 end