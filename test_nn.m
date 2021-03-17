function [acc, prec, recall, f1_score, confusion] = test_nn(net, inputs_test, targets_test)
    outputs = net(inputs_test);
    
    test_idx = vec2ind(targets_test);
    outputs_idx = vec2ind(outputs);
    
    TP = sum(outputs_idx == 1 & test_idx == 1);
    TN = sum(outputs_idx == 2 & test_idx == 2);
    FP = sum(outputs_idx == 1 & test_idx == 2);
    FN = sum(outputs_idx == 2 & test_idx == 1);
    acc = 100 * (TP + TN) / (TP + TN + FP + FN);
    prec = 100 * TP / (TP + FP);
    recall = 100 * TP / (TP + FN);
    f1_score = (2 * prec * recall) / (prec + recall);
    
    confusion = zeros(2, 2);
    confusion(1, 1) = TP;
    confusion(1, 2) = FP;
    confusion(2, 1) = FN;
    confusion(2, 2) = TN;
    % plotconfusion(targets_test, outputs);
end