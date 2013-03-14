% Problem 13: correlation ACT of math and verbal scores
math_and_verbal = [
[16,19]; [18,17]; [22,18]; [20,23]; [17,20];
[25,21]; [21,24]; [23,18]; [24,18]; [31,25];
[27,29]; [28,24]; [30,24]; [27,23]; [28,24];
];
X = math_and_verbal(:, 1)'; % math scores
Y = math_and_verbal(:, 2)'; % verbal scores
ux = mean(X); uy = mean(Y);
sx2 = var(X); sy2 = var(Y);
r = corr(X, Y);
r2 = (X - ux) * (Y - uy)' / (length(X) - 1)/ sqrt(sx2 * sy2);
% check that our formula for 'r' gets the same answer as the builtin function
%!test assert((r - r2)/r2 < .001)
printf('(a) ux: %.2f, uy: %.2f, sx2: %.2f, sy2: %.2f, r: %.2f\n', ux, uy, sx2, sy2, r);
[P S] = polyfit(X, Y, 1);
Yh = P(1)*X + P(2);
plot(X, Y, 'k*', X, Yh, 'g-'); % properties: 'k*', black stars, 'g-': green lines
title('Prob. 13: Correlation of math and verbal scores');
xlabel('math'); ylabel('verbal');
line = sprintf('Y = %f * X + %f', P(1), P(2));
printf('(b) Best fitting line: %s\n', line);
printf('(c) See plot\n'); legend('', line);
if (OCTAVE_VERSION)
	print -dpng 13.png; print -dsvg 13.svg;
endif
