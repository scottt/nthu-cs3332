% Problem 9: throw two dice. r.v. X is min of dice face
Px = @(x) (13 - 2*x)/36;
fprintf('(a) p.m.f.: P(X=x) = (13 - 2*x)/36\n');
X = 1:6;
P = arrayfun(Px, X);
assert(sum(P) == 1)
fprintf('(b) See plot\n');
bar(X, P, 1);
title('Prob. 9: Dice throwing probability histogram, min of two');
xlabel('dice face, min of two, six sided');
ux = X * P';
sx2 = arrayfun(@(x) x^2, X) * P';
varx = sx2 - ux^2;
varx_ = arrayfun(@(x) (x - ux)^2, X) * P'; % alternative way to calculate varx
assert(abs(varx - varx_)/varx_ < .001)
fprintf('(c) ux: %f (i.e. 301/36), varx: %f (i.e. 2555/1296)\n', ux, varx);
if (exist('OCTAVE_VERSION', 'builtin'))
	print -dpng 9.png; print -dsvg 9.svg;
end
