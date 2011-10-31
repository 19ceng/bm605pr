  trn = load('riply_trn');       %  load training data
  
  options.ker = 'rbf';           %  use RBF kernel
  options.arg = 1;               %  kernel argument
  options.C = 10;                %  regularization constant
  % train SVM classifier
  model = smo(trn,options);
% model = svmlight(trn,options);
% model = svmquadprog(trn,options);
  
% visualization
  figure;
  ppatterns(trn); psvm(model);
  
  tst = load('riply_tst');         % load testing data
  ypred = svmclass(tst.X,model);   % classify data
  cerror(ypred,tst.y)             % compute error
