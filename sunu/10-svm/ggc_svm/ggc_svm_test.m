clc;    close all;  clear all;

load GgcTstData

load ggc_svm;
y = svmclass(data.X, model);

Etiket = [data.Etiket(data.y'); data.Etiket(y')]'

err = mean(abs(data.y - y).^2)

