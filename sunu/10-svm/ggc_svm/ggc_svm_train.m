clc;    close all;  clear all;

load GgcTrnData

options.solver = 'imdm';
model = bsvm2(data, options);

save ggc_svm model

%
figure;
ppatterns(data);
ppatterns(model.sv.X,'ko',12);

xlabel(char(data.Etiket(1)));  ylabel(char(data.Etiket(2)));  title('Space');
legend(char(data.Etiket(1)), char(data.Etiket(2)));
