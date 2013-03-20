function retval = textbook_quantile(order_statistics, p)
	n = length(order_statistics);
	k = (n + 1) * p;
	r = mod(k, 1);
	if (r == 0)
		retval = order_statistics(k);
	else
		k = floor(k);
		retval = (1 - r)*order_statistics(k) + r*order_statistics(k+1);
	end
end
