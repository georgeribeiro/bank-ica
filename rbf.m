function [net] = rbf(inputs_train, targets_train)
    goal = 0;
    spread = 3;
    MN = 48;
    DF = 25;
    net = newrb(inputs_train, targets_train, goal, spread, MN, DF);
end