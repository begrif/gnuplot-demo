set title "data with color changing error bars"
# taken from https://stackoverflow.com/questions/58526110/gnuplot-errorbars-with-variable-style

# here we define a sliding scale of color from 0 = black to 1 = yellow
# these colors will be used to make points with small error bars darker
# and those larger error bars harder to see
set palette defined ( 0 "black", 1 "yellow" ) 

# The colorbox range defaults to [-1:1], so limit to our defined colors.
set cbrange [0:1]

# instead, we could just hide the colorbox
# set nocolorbox

# x in 1, y in 2, error size in 3, color also in 3
# now using "a" color not `rgb` space, namely the palette
# previously defined
plot "errors.data" using 1:2:3:3 \
	with errorbars \
	linecolor palette z
