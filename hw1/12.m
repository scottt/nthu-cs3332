% Problem 12: Clutch size
number_of_eggs = [
7 5 13 7 7 8 9 9 9 8 8 9 9 7 7 \
5 9 7 7 4 9 8 8 10 9 7 8 8 8 7 \
9 7 7 10 8 7 9 7 10 8 9 7 11 10 9 \
9 4 8 6 8 9 9 9 8 8 5 8 8 9 9 \
14 10 8 9 9 9 8 7 9 7 9 10 10 7 6 \
11 7 7 6 9 7 7 6 8 9 4 6 9 8 9 \
7 9 9 9 9 8 8 8 9 9 9 8 10 9 9 \
8 5 7 8 7 6 7 7 7 6 5 9 \
];
u = unique(number_of_eggs);
printf('(a) '); frequency_table = arrayfun(@(x) sum(number_of_eggs == x), u)
bar(u, frequency_table); % (b) draw histogram
title('Prob 12: Clutch size frequency histogram');
tics('x', 4:14); axis([3 15]);
xlabel('clutch size'); ylabel('frequency');
printf('(b) mode: %f\n', mode(number_of_eggs));
if (OCTAVE_VERSION)
	print -dpng 12.png; print -dsvg 12.svg;
endif
