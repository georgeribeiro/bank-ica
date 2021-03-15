function [inputs_train, targets_train, inputs_test, targets_test] = dividebase(inputs, targets, percent)
    [attrs, samples] = size(inputs);
    
    n_samples_0 = 0;
    for i = 1:samples
        if targets(1, i) == 0
            n_samples_0 = n_samples_0 + 1;
        end
    end
    n_samples_1 = samples - n_samples_0;
    
    n_sample_train_0 = floor(n_samples_0 * percent / 100);
    n_sample_train_1 = floor(n_samples_1 * percent / 100);
    
    n_sample_test_0 = n_samples_0 - n_sample_train_0;
    n_sample_test_1 = n_samples_1 - n_sample_train_1;
    
    n_sample_train = n_sample_train_0 + n_sample_train_1;
    n_sample_test = n_sample_test_0 + n_sample_test_1;
    
    inputs_train = zeros(attrs, n_sample_train);
    inputs_test = zeros(attrs, n_sample_test);
    targets_train = zeros(1, n_sample_train);
    targets_test = zeros(1, n_sample_test);
    
    i_sample_test_target_0 = 0;
    i_sample_test_target_1 = 0;
    i_test = 1;
    i_train = 1;
    
    for i = 1:samples
       if targets(1, i) == 0 % targets 0
           if i_sample_test_target_0 < n_sample_test_0
               inputs_test(:, i_test) = inputs(:, i);
               targets_test(i_test) = targets(1, i);
               i_test = i_test + 1;
               i_sample_test_target_0 = i_sample_test_target_0 + 1;
           else
               inputs_train(:, i_train) = inputs(:, i);
               targets_train(i_train) = targets(1, i);
               i_train = i_train + 1;
           end
       else % targets 1
           if i_sample_test_target_1 < n_sample_test_1
              inputs_test(:, i_test) = inputs(:, i);
              targets_test(i_test) = targets(1, i);
              i_test = i_test + 1;
              i_sample_test_target_1 = i_sample_test_target_1 + 1;
           else
               inputs_train(:, i_train) = inputs(:, i);
               targets_train(i_train) = targets(1, i);
               i_train = i_train + 1;
           end
       end
    end
end