function [] = print_result(acc, prec, recall, f1_score)
    fprintf('Acur�cia: %f%%\n', acc);
    fprintf('Precis�o: %f%%\n', prec);
    fprintf('Recall: %f%%\n', recall);
    fprintf('F1 Score: %f%%\n', f1_score);
end