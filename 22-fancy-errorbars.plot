set title "data with color changing error bars"
# taken from https://stackoverflow.com/questions/58526110/gnuplot-errorbars-with-variable-style

set palette defined ( 0 "black", 1 "yellow" ) 
set cbrange [0:1]

# x in 1, y in 2, error size in 3, color also in 3
plot "errors.data" using 1:2:3:3 \
	with errorbars \
	linecolor palette z


