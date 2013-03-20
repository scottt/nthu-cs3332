% Problem 10, P(X=i) = gamma/(i + 1), i = {0, 1, 2, 3, 4}
gamma = 60/137; % solved by hand using sum(P) == 1
Px = @(x) gamma/(x+1);
X = 0:4;
P = arrayfun(Px, X);
ux = X * P';
sx2 = arrayfun(@(x) x^2, X) * P';
varx = sx2 - ux^2;
fprintf('(a) gamma: %f (i.e. 60/137)\n(b) ux: %f (i.e. 163/137)\n', gamma, ux);
fprintf('(c) varx: %f (i.e. 33300/18769)\n', varx);
