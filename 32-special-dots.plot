set title "drawing figures at every point"
# adapted from:
# https://gnuplot-tricks.blogspot.com/2010/03/bubble-plots.html
# DOES NOT WORK IN GNUPLOT 4.2
# This uses 5.0 features for a critical part of the plot.

# First some discard plots to collect x axis max
plot 'three.data' using 0:2
red_n = GPVAL_DATA_X_MAX

plot 'three.data' using 0:3
blue_n = GPVAL_DATA_X_MAX

plot 'three.data' using 0:4
green_n = GPVAL_DATA_X_MAX

# pair of functions to help with sizing nested circles
# I don't fully understand rem(), it's right out of the original,
# where it is described as a remainder function. rem()
# appears to simplify to "rem(x,n) = 0" but substituting that
# breaks the output. I guess it relies on the imprecision of
# integer math?
rem(x,n) = x - n*(x/n)
size(x,n) = 3*(1-0.8*rem(x,n)/n)

# some color picker functions that trend towards white
# with the same N value that trends towards smaller circles
c(x,n) = floor(240.0*rem(x,n)/n)
red(x,n) = sprintf("#%02X%02X%02X", 255, c(x,n), c(x,n))
blue(x,n) = sprintf("#%02X%02X%02X", c(x,n), c(x,n), 255)
green(x,n) = sprintf("#%02X%02X%02X", c(x,n), 255, c(x,n))

# originally:
# posx(X,x,n) = X + 0.03*rem(x,n)/n
# posy(Y,x,n) = Y + 0.03*rem(x,n)/n
# to adjust point position based on level, but that appears
# to be an artifact of an earlier version with cone-shaped dots
posx(X,x,n) = X
posy(Y,x,n) = Y

# copy the filename from the first plot to the real plot
set output GPVAL_OUTPUT

# do not show a key, the automatic key for this would be unusable
unset key

# dots can be on top of the border
set border back

# automatically extend the range: left[,right[,top[,bottom]]]
set offset 4,4

# how many incrememnts to use; originally 40, but 15 looks
# about the same and is much faster
level = 15

# this is basically the same thing three times, only difference
# is the color and the column of data from the file. 
# there is a for loop (not available in 4.x) that plots each
# point level times, each time using a smaller and lighter colored
# circle. The concentric circles stacked like that creates a shiny
# bubble look.
plot for [n=0:level*(red_n+1)-1] \
	'three.data' \
	    using (posx($1,n,level)):(posy($2,n,level)) \
	    every ::(n/level)::(n/level) \
		with points \
		    pointtype 7 \
		    pointsize size(n,level) \
		    linecolor rgb red(n,level), \
 \
     for [n=0:level*(blue_n+1)-1] \
	'three.data' \
	    using (posx($1,n,level)):(posy($3,n,level)) \
	    every ::(n/level)::(n/level) \
		with points \
		    pointtype 7 \
		    pointsize size(n,level) \
		    linecolor rgb blue(n,level), \
 \
     for [n=0:level*(green_n+1)-1] \
	'three.data' \
	    using (posx($1,n,level)):(posy($4,n,level)) \
	    every ::(n/level)::(n/level) \
		with points \
		    pointtype 7 \
		    pointsize size(n,level) \
		    linecolor rgb green(n,level)

