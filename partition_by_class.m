function [inputs_train_class0, inputs_train_class1] = partition_by_class(inputs_train, targets_train)
    [attrs, samples] = size(inputs_train);
    
    samples_class0 = 0;
    for i = 1:samples
       if targets_train(1, i) == 0
           samples_class0 = samples_class0 + 1;
       end
    end
    samples_class1 = samples - samples_class0;
    
    inputs_train_class0 = zeros(attrs, samples_class0);
    inputs_train_class1 = zeros(attrs, samples_class1);
    
    k_class0 = 1;
    k_class1 = 1;
    
    for i = 1:samples
        if targets_train(1, i) == 0
            inputs_train_class0(:, k_class0) = inputs_train(:, i);
            k_class0 = k_class0 + 1;
        else
            inputs_train_class1(:, k_class1) = inputs_train(:, i);
            k_class1 = k_class1 + 1;
        end
    end
end