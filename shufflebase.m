function [shuffled_base] = shufflebase(base)
    [rows, cols] = size(base);
    p = randperm(rows);
    shuffled_base = base;
    for i = 1:rows
        shuffled_base(i, :) = base(p(i), :);
    end
end