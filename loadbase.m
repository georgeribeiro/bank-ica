function [base, inputs, targets] = loadbase(path)
    mtfile = strcat(path, '.mat');
    if isfile(mtfile)
       m = matfile(mtfile);
       base = m.base;
    else
        base = readtable(path, 'TextType', 'string');
        base = base{:, :};
        strrep(base(:,:), '"', ''); % remove quotes
        base = shufflebase(base);
        base = preparebase(base);
        save(mtfile, 'base');
    end
    [rows, ~] = size(base);
    inputs = base(1:rows-1, :);
    targets = base(rows, :);
end