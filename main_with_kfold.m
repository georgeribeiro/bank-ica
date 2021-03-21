%% clear
clear all; clc; close all;

rng(1);

k = 10;

[base, inputs, targets] = loadbase('bank/bank-full.csv');

[inputs_train, targets_train, inputs_test, targets_test] = dividebase(inputs, targets, 90);

[inputs_train_class0, inputs_train_class1] = partition_by_class(inputs_train, targets_train);

vacc = zeros(1, k);
vprec = zeros(1, k);
vrecall = zeros(1, k);
vf1score = zeros(1, k);
vconfusion = zeros(2, 2, k);
bestacc = 0;

for i = 1:k
    [inputs_train_kfold, inputs_test_kfold, targets_train_kfold, targets_test_kfold] = partition_train_test_kfold(inputs_train_class0, inputs_train_class1, k, 1);
    [inputs_train_kfold, mean_z, std_z] = zscore(inputs_train_kfold);
    [inputs_test_kfold] = zscore_with_mean_std(inputs_test_kfold, mean_z, std_z);
    
    net = mlp(inputs_train_kfold, targets_train_kfold);
        
    [acc, prec, recall, f1_score, confusion] = test_nn(net, inputs_test_kfold, targets_test_kfold);
    
    vacc(i) = acc;
    vprec(i) = prec;
    vrecall(i) = recall;
    vf1score(i) = f1_score;
    vconfusion(:, :, i) = confusion;
    
    if acc > bestacc
        bestacc = acc;
        bestnet = net;
        best_mean_z = mean_z;
        best_std_z = std_z;
    end
end

