clc;    close all;  clear all;

load EmgTstDataBinary

feature = feature_extraction(data);

load emg_svm;
y = svmclass(feature.X, model);

Etiket = [data.Etiket(data.y'); data.Etiket(y')]'

err = mean(abs(data.y - y).^2)
