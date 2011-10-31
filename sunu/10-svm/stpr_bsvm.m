data = load('pentagon');

options = struct('ker','rbf','arg',1,'C',10);
model = bsvm2(data,options )

figure; 
ppatterns(data); ppatterns(model.sv.X,'ok',12);
pboundary(model);
