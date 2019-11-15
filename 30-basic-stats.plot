set title "range and mean shading based on data"
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

# put some labels on the graph, near the features described
# gprintf() is like sprintf() but uses gnuplot formating settings,
# in particular here we get good defaults for integer / floating point
# display with %g
set label 1 gprintf("Minimum = %g", min_y) at min_x - 4,  min_y - 2
set label 2 gprintf("Maximum = %g", max_y) at min_x - 4,  max_y + 2
set label 3 gprintf("Mean = %g",   mean_y) at min_x - 4, mean_y + 2 front

# first two plots are shaded areas visually demarking the range (plus a
# a bit) of the y values; then a simple line for the mean; finally the
# actual points
plot min_y - 1 with filledcurves y1=mean_y \
		linetype 1 linecolor rgb "#bbbbdd" title "below mean", \
     max_y + 1 with filledcurves y1=mean_y \
     		linetype 1 linecolor rgb "#bbddbb" title "above mean", \
     mean_y with lines \
     		linetype 1 linecolor rgb "black" title "mean", \
     'errors.data' using 1:2 with points \
     		pointtype 7 linetype 1 pointsize 1 title "samples"

