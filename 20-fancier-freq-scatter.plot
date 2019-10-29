set title "scatter plot with point size as a variable"

# point types 1-3 are x and * shapes; pointtypes 4 and 5, are hollow and
# solid squares; 6 & 7 circles, 8 & 9 triangles; 10 11 rotated triangles,
# 12 & 13 rotated squares, then back to 1. point type 0 is just a dot,
# no size change available

# plot it once with hollow circles, once with just a point, once with
# the point labeled with the size (just above the point), once with
# the point labeled with the co-ordinates (just below the point)
plot 'dist.data' using 1:2:3 \
	with points pointtype 6 pointsize variable \
	notitle, \
     'dist.data' using 1:2 \
        with points pointtype 0 \
        notitle, \
     'dist.data' using 1:2:3 \
        with labels \
        notitle offset char 0, 1, \
     'dist.data' using 1:2:(sprintf("%dx%d", $1, $2)) \
        with labels \
        notitle offset char 0, -1
