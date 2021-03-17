function [zcored_base, mean_z, std_z] = zscore(base)
    [attrs, samples] = size(base);
    zcored_base = zeros(attrs, samples);
    
    mean_z = zeros(attrs, 1);
    std_z = zeros(attrs, 1);
    for row = 1:attrs
       mz =  mean(base(row, :));
       sz = std(base(row, :));
       
       for col = 1:samples
            zcored_base(row, col) = (base(row, col) - mz) / sz;
       end
       mean_z(row) = mz;
       std_z(row) = sz;
    end
end