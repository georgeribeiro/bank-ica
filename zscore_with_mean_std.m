function [zscored_base] = zscore_with_mean_std(base, mean_z, std_z)
    [attrs, samples] = size(base);
    zscored_base = zeros(attrs, samples);
    
    for row = 1:attrs
        mz = mean_z(row);
        sz = std_z(row);
        
        for col = 1:samples
            zscored_base(row, col) = (base(row, col) - mz) / sz;
        end
    end
end