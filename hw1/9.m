% Problem 9: throw two dice. r.v. X is min of dice face
fprintf('(a) p.m.f.: P(X=x) = (13 - 2*x) / 36\n');
X = 1:6;
P = (13 - 2.*X) / 36;
assert(sum(P) == 1)
fprintf('(b) See plot\n');
bar(X, P, 1);
title('Prob. 9: Dice throwing probability histogram, min of two');
xlabel('dice face, min of two, six sided');
ux = X * P';
sx2 = (X.^2*P') - ux^2;
sx2_ = (X - ux).^2 * P'; % alternative way to calculate varx
assert(abs(sx2 - sx2_)/sx2_ < .001)
fprintf('(c) ux: %f (i.e. 301/36), varx: %f (i.e. 2555/1296)\n', ux, sx2);
if (exist('OCTAVE_VERSION', 'builtin'))
	print -dpng 9.png; print -dsvg 9.svg;
end
