% Problem 14: CS3332 score statistics
if (OCTAVE_VERSION)
	pkg load statistics
	pkg load plot
endif
scores = [
61 72 77 58 67 70 76 70 76 83 \
42 58 49 74 65 55 90 80 31 61 \
53 82 90 51 48 55 84 70 48 76 \
61 76 70 70 66 50 80 73 77 43 \
71 99 66 63 63 52 54 80 67 29 \
52 83 62 60 61 86 61 70 73 \
]';
printf('(a) '); order_statistics = sort(scores)'
% statistics() -> minimum, first quartile, median, third quartile, maximum, mean,
% standard deviation, skewness, and kurtosis 
t = statistics(scores);
min_x = min(scores);
x25 = quantile(scores, 0.25, 1); % 'percentiles' has multiple reasonable definitions
m = median(scores);
x75 = quantile(scores, 0.75, 1); %  hopefully this one matches the textbook
max_x = max(scores);
printf('(b) x25:  %.2f, x75:  %.2f, median: %.2f\n', x25, x75, m); % (b)
summary = sprintf('(c) Five-number summary: %.2f, %.2f, %.2f, %.2f, %.2f',
	          min_x, x25, m, x75, max_x); % (c)
printf('%s\n', summary);
printf('(d) See plot\n');
boxplot(scores, 0, '.', 0);
axis([20 105 0.5 1.5],'ticx'); tics('x', 20:5:100);
daspect([20 1 1]); pbaspect([1 1 1]);
title('Prob. 14: CS3332 scores box-and-whisker diagram');
if (OCTAVE_VERSION)
	% make the plot landscape oriented and shaped like a thin long strip
	orient landscape;
	papersize_orig = get (gcf, "papersize");
	dpi = get (0, "screenpixelsperinch");
	pos = get (gcf, "position");
	papersize = [11 3.5];
	orient landscape;
	set (gcf, "papersize", papersize);
	set (gcf, "paperposition", [0, 0, papersize]);
	print -dpng 14.png; print -dsvg 14.svg;
	%print -dpdf 14.pdf;
endif
