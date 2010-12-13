clc;    close all;  clear all;

load EmgTrnDataBinary

feature = feature_extraction(data);

options.solver = 'imdm';
model = bsvm2(feature, options);
save emg_svm model;

figure; 
ppatterns(feature);
ppatterns(model.sv.X,'ko',12);
pboundary(model);
xlabel(char(feature.Etiket(1)));  ylabel(char(feature.Etiket(2)));  title('Feature Space'); 
legend(char(data.Etiket(1)), char(data.Etiket(2)));
