% Problem 14: CS3332 score statistics
if (exist('OCTAVE_VERSION', 'builtin'))
	pkg load statistics
	pkg load plot
end
scores = [
61 72 77 58 67 70 76 70 76 83 ...
42 58 49 74 65 55 90 80 31 61 ...
53 82 90 51 48 55 84 70 48 76 ...
61 76 70 70 66 50 80 73 77 43 ...
71 99 66 63 63 52 54 80 67 29 ...
52 83 62 60 61 86 61 70 73 ...
]';
fprintf('(a) '); order_statistics = sort(scores)'
x25 = textbook_quantile(order_statistics, .25);
m = median(scores);
x75 = textbook_quantile(order_statistics, .75);
if (exist('OCTAVE_VERSION', 'builtin'))
	% Only Octave's quantile() takes the METHOD parameter
	x25_ = quantile(scores, .25, 1, 1); x75_ = quantile(scores, .75, 1, 1);
	assert(x25 == x25_ && x75 == x75_)
end
fprintf('(b) x25:  %.2f, x75:  %.2f, median: %.2f\n', x25, x75, m);
fprintf('(c) Five-number summary: %.2f, %.2f, %.2f, %.2f, %.2f\n', ...
	          min(scores), x25, m, x75, max(scores));
fprintf('(d) See plot\n'); boxplot(scores, 0, '.', 0);
daspect([20 1 1]); pbaspect([1 1 1]);
title('Prob. 14: CS3332 scores box-and-whisker diagram');
if (exist('OCTAVE_VERSION', 'builtin'))
	axis([20 105 0.5 1.5],'ticx'); tics('x', 20:5:100);
	% make the plot landscape oriented and shaped like a thin long strip
	orient landscape;
	papersize_orig = get (gcf, 'papersize');
	dpi = get (0, 'screenpixelsperinch');
	pos = get (gcf, 'position');
	papersize = [11 3.5];
	orient landscape;
	set (gcf, 'papersize', papersize);
	set (gcf, 'paperposition', [0, 0, papersize]);
	print -dpng 14.png; print -dsvg 14.svg;
	%print -dpdf 14.pdf;
end
