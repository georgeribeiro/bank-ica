%% clear
clear all; clc;

rng(0);

[base, inputs, targets] = loadbase('bank/bank-full.csv');

[inputs_train, targets_train, inputs_test, targets_test] = dividebase(inputs, targets, 40);

[inputs_train, mean_z, std_z] = zscore(inputs_train);
[inputs_test] = zscore_with_mean_std(inputs_test, mean_z, std_z);

net = rbf(inputs_train, targets_train);

[acc, prec, recall, f1_score, confusion] = test_nn(net, inputs_test, targets_test);

fprintf('Acurácia: %f%%\n', acc);
fprintf('Precisão: %f%%\n', prec);
fprintf('Recall: %f%%\n', recall);
fprintf('F1 Score: %f%%\n', f1_score);