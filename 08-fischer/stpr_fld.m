trn = load('riply_trn');       % load training data

model = fldqp(trn);            % compute FLD

figure;
ppatterns(trn); pline(model);  % plot data and solution
tst = load('riply_tst');       % load testing data
ypred = linclass(tst.X,model); % classify testing data

cerror(ypred,tst.y)            % compute testing error
