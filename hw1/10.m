% Problem 10, P(X=i) = gamma/(i + 1), i = {0, 1, 2, 3, 4}
g = 60/137; % solved by hand using sum(P) == 1
X = 0:4;
P = g ./ (X + 1);
ux = X * P';
sx2 = X.^2 * P' - ux^2;
fprintf('(a) gamma: %f (i.e. 60/137)\n(b) ux: %f (i.e. 163/137)\n', g, ux);
fprintf('(c) varx: %f (i.e. 33300/18769)\n', sx2);
