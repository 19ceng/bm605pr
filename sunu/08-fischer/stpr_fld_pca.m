trn = load('riply_trn');       % load training data

modelFLD = fldqp(trn);            % compute FLD

X = trn.X;
modelPCA = pca(X,1);              % train PCA

Z = linproj(X,modelPCA);          % lower dim. proj.
XR = pcarec(X,modelPCA);          % reconstr. data

figure;
subplot(121)
ppatterns(trn); pline(modelFLD);  % plot data and solution
tst = load('riply_tst');       % load testing data
ypred = linclass(tst.X,modelFLD); % classify testing data

cerror(ypred,tst.y)            % compute testing error

ax = axis;

subplot(122)
hold on; 
h1 = ppatterns(X,'kx');
h2 = ppatterns(XR,'bo');
[dummy,mn] = min(Z);
[dummy,mx] = max(Z);
h3 = plot([XR(1,mn) XR(1,mx)],[XR(2,mn) XR(2,mx)],'r');
legend([h1 h2 h3], ...
 'Input vectors','Reconstructed', 'PCA subspace');
axis(ax)