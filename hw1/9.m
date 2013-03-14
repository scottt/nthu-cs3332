% Problem 9: throw two dice. r.v. X is min of dice face
Px = @(x) (13 - 2*x)/36;
printf('(a) p.m.f.: P(X=x) = (13 - 2*x)/36\n');
X = 1:6;
P = arrayfun(Px, X);
%!test assert(sum(p) == 1)
printf('(b) See plot\n');
bar(X, P, 1);
title('Prob. 9: Dice throwing probability histogram, min of two');
xlabel('dice face, min of two, six sided');
ux = X * P';
sx2 = arrayfun(@(x) x^2, X) * P';
varx = sx2 - ux^2;
varx_ = arrayfun(@(x) (x - ux)^2, X) * P'; % alternative way to calculate varx
%!test assert(varx == varx_)
printf('(c) ux: %f (i.e. 301/36), varx: %f (i.e. 2555/1296)\n', ux, varx);
if (OCTAVE_VERSION)
	print -dpng 9.png; print -dsvg 9.svg;
endif
