function [inputs_p, targets_p] = shuffle_inputs_targets(inputs, targets)
    [~, samples] = size(inputs);
    v = randperm(samples);
    
    
    inputs_p = inputs;
    targets_p = targets;
    
    for i = 1:samples
       inputs_p(:, i) = inputs(:, v(i));
       targets_p(:, i) = targets(:, v(i));
    end
end