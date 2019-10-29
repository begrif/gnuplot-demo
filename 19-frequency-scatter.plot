set title "scatter plot with point size as a variable"

plot 'dist.data' using 1:2:3 \
	with points pointsize variable \
	title "plots scaled to frequency"
