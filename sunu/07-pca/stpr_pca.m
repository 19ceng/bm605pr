X = gsamp([5;5],[1 0.8;0.8 1],100);  % generate data
model = pca(X,1);                    % train PCA
Z = linproj(X,model);                % lower dim. proj.
XR = pcarec(X,model);                % reconstr. data
figure; hold on; axis equal;         % visualization
h1 = ppatterns(X,'kx');
h2 = ppatterns(XR,'bo');
[dummy,mn] = min(Z);
[dummy,mx] = max(Z);
h3 = plot([XR(1,mn) XR(1,mx)],[XR(2,mn) XR(2,mx)],'r');
legend([h1 h2 h3], ...
 'Input vectors','Reconstructed', 'PCA subspace');
