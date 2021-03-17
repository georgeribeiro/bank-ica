function [net] = rbf(inputs_train, targets_train)
    goal = 0;
    spread = 300;
    MN = 110; % epochs?
    DF = 10;
    net = newrb(inputs_train, targets_train, goal, spread, MN, DF);
end