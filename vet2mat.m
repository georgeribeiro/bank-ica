function [mat] = vet2mat(vet)
    [~, c] = size(vet);
    mat = zeros(2, c);
    
    for i = 1:c
       if vet(i) == 1
           mat(1, i) = 1;
       else
           mat(2, i) = 1;
       end
    end
end