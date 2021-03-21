function [] = print_result(acc, prec, recall, f1_score)
    fprintf('Acurácia: %f%%\n', acc);
    fprintf('Precisão: %f%%\n', prec);
    fprintf('Recall: %f%%\n', recall);
    fprintf('F1 Score: %f%%\n', f1_score);
end