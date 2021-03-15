function [base, inputs, targets] = loadbase(path)
    base = readtable(path, 'TextType', 'string');
    %base.Properties.VariableNames = {'age', 'job', 'marital', 'education', 'default', 'balance', 'housing', 'loan', 'contact', 'day', 'month', 'duration', 'campaign', 'pdays', 'previous', 'poutcome', 'y'};
    base = base{:, :};
    strrep(base(:,:), '"', ''); % remove quotes
    base = shufflebase(base);
    base = preparebase(base);
    [rows, ~] = size(base);
    inputs = base(1:rows-1, :);
    targets = base(rows, :);
end