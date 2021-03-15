%% clear
clear; clc;

rng('default');

[base, inputs, targets] = loadbase('bank/bank-full.csv');

[inputs_train, targets_train, inputs_test, targets_test] = dividebase(inputs, targets, 70);

net = mlp(inputs_train, targets_train, inputs_test, targets_test, [10, 5], 'trainlm', 'logsig');
