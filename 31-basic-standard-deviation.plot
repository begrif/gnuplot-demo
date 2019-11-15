set title "standard deviation and outliers plotted"
# inspired by
# https://gnuplot-tricks.blogspot.com/2009/11/some-basic-statistics-with-gnuplot.html

# First a discard plot to just get some parameters from the data. 
# In my test environment, this will be saved using the basename of the
# plotfile, but we really don't want to save it at all.
plot "errors.data" using 1:2

# copy some gnuplot automatically set variables for use in the real plot.
# Use "show variables all" to see the *currently defined* automatic variables.
min_y = GPVAL_DATA_Y_MIN
max_y = GPVAL_DATA_Y_MAX
min_x = GPVAL_DATA_X_MIN
max_x = GPVAL_DATA_X_MAX

# Some more discard plots, for capturing side-effect variables. Both of
# these are discarding most of the points, one saving only those at the
# minimum y and the other saving only those at the maximum, then capturing
# a point position we will use for a label.
plot 'errors.data' using ($2 == min_y ? $2 : 1/0):1
min_x_pos = GPVAL_DATA_Y_MIN
plot 'errors.data' using ($2 == max_y ? $2 : 1/0):1
max_x_pos = GPVAL_DATA_Y_MAX

# copy the filename from the first plot to the real plot
set output GPVAL_OUTPUT

# start using our copied variables to set a range with some margins
set yrange [ min_y - 10 : max_y + 10 ]
set xrange [ min_x -  6 : max_x +  6 ]

# super simple function: for any x, return the contents of a variable
# (variable evaluated at plot time, not function definition time)
f(x) = mean_y

# the fit directive works something like plot, but sends output to a
# file or variable (here a variable)
fit f(x) 'errors.data' u 1:2 via mean_y

# fit sets some variables, the ones used now are FIT_WSSR (weighted sum of
# squared residuals) and FIT_NDF (number of degrees of freedom); those 
# combine to make a standard deviation
stddev_y = sqrt(FIT_WSSR / (FIT_NDF + 1))

# Adding two arrows at positions that depend on the observed min/max
# Diagonal arrows, because we can.
set arrow 1 from min_x_pos - 5, min_y - 4 to min_x_pos - 0.5, min_y - 0.5 linewidth 0.5
set arrow 2 from max_x_pos - 5, max_y + 4 to max_x_pos - 0.5, max_y + 0.5 linewidth 0.5

# Label those arrows
set label 1 sprintf("Minimum\n%d,%d" ,min_x_pos,min_y) at min_x_pos - 5, min_y - 5 center
# Offset this one slightly more to give room for two line label
set label 2 sprintf("Maximum\n%d,%d", max_x_pos, max_y) at max_x_pos - 5, max_y + 7 center

# the first two plots are above / below standard deviation shaded areas,
# then the mean line, and finally the points
plot mean_y - stddev_y with filledcurves y1=mean_y \
	 linetype 1 linecolor rgb "#cceecc" title "standard deviation", \
     mean_y + stddev_y with filledcurves y1=mean_y \
	 linetype 1 linecolor rgb "#cceecc" notitle, \
     mean_y with lines \
	 linetype 1 linecolor rgb "#00dd00" title "mean", \
     'errors.data' using 1:2 with points \
     		pointtype 3 pointsize 1 title "samples"

