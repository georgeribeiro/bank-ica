function [inputs_train, inputs_test, targets_train, targets_test] = partition_train_test_kfold(inputs_train_class0, inputs_train_class1, k, iter)
    
    percent = 100/k;
    
    [~, samples_class0] = size(inputs_train_class0);
    [~, samples_class1] = size(inputs_train_class1);

    n_window_sample_class0 = int64(floor(percent * samples_class0) / 100);
    n_window_sample_class1 = int64(floor(percent * samples_class1) / 100);
    
    upper_limit_class0 = n_window_sample_class0 * iter;
    upper_limit_class1 = n_window_sample_class1 * iter;
    
    lower_limit_class0 = upper_limit_class0 - n_window_sample_class0 + 1;
    lower_limit_class1 = upper_limit_class0 - n_window_sample_class0 + 1;
    
    if iter == k
       upper_limit_class0 = n_window_sample_class0;
       upper_limit_class1 = n_window_sample_class1;
    end
    
    inputs_test_final_class0 = inputs_train_class0(:, lower_limit_class0:upper_limit_class0);
    inputs_test_final_class1 = inputs_train_class1(:, lower_limit_class1:upper_limit_class1);
    
    if iter == 1
        inputs_train_final_class0 = inputs_train_class0(:, upper_limit_class0+1:samples_class0);
        inputs_train_final_class1 = inputs_train_class0(:, upper_limit_class1+1:samples_class1);
    elseif iter == k
        inputs_train_final_class0 = inputs_train_class0(:, 1:lower_limit_class0+1-1);
        inputs_train_final_class1 = inputs_train_class0(:, 1:lower_limit_class1+1-1);
    else
        inputs_train_final_class0 = [inputs_train_class0(:, 1:lower_limit_class0-1), inputs_train_class0(:, upper_limit_class0+1:samples_class0)];
        inputs_train_final_class1 = [inputs_train_class1(:, 1:lower_limit_class1-1), inputs_train_class1(:, upper_limit_class1+1:samples_class1)];
    end
    
    [~, n_inputs_train_class0] = size(inputs_train_final_class0);
    train_class0 = [zeros(1, n_inputs_train_class0); ones(1, n_inputs_train_class0)];
    
    [~, n_inputs_train_class1] = size(inputs_train_final_class1);
    train_class1 = [zeros(1, n_inputs_train_class1); ones(1, n_inputs_train_class1)];
    
    [~, n_inputs_test_class0] = size(inputs_test_final_class0);
    test_class0 = [zeros(1, n_inputs_test_class0); ones(1, n_inputs_test_class0)];
    
    [~, n_inputs_test_class1] = size(inputs_test_final_class1);
    test_class1 = [ones(1, n_inputs_test_class1); zeros(1, n_inputs_test_class1)];
    
    inputs_train = [inputs_train_final_class0, inputs_train_final_class1];
    inputs_test = [inputs_test_final_class0, inputs_test_final_class1];
    
    targets_train = [train_class0, train_class1];
    targets_test = [test_class1, test_class0];
    
    [inputs_train, targets_train] = shuffle_inputs_targets(inputs_train, targets_train);
    [inputs_test, targets_test] = shuffle_inputs_targets(inputs_test, targets_test);
end