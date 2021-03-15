function [prepared_base] = preparebase(base)
    attr_bool = [5, 7, 8, 17];
    attr_string = [2, 3, 4, 9, 11, 16];
    
    prepared_base = base;
    
    [rows, ~] = size(base);
    [~, nab] = size(attr_bool);
    [~, nas] = size(attr_string);
    
    for j = 1:nab
        for i = 1:rows
            if strcmp(base(i, attr_bool(j)), "yes")
                prepared_base(i, attr_bool(j)) = 1;
            else
                prepared_base(i, attr_bool(j)) = 0;
            end
        end
    end
    
    for k = 1:nas
        col = base(:, attr_string(k));
        categories = unique(col);
        
        for i = 1:rows
            indexC = strfind(categories,col(i));
            index = find(not(cellfun('isempty', indexC)));
            col(i) = index;
        end
        prepared_base(:, attr_string(k)) = col;
    end
    
    prepared_base = str2double(prepared_base)';
end