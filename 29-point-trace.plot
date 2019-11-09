set title "graph with points traced"

# give us a bit of margin at either end
set xrange [ 0 : 51 ]

# using the log data because the to-left traces on this graph look
# very messy when the line has too much up-down variation.
# first plot lines and points as two operations, to get fine control
# over the points; next draw lines ("impulses") to x axis in red,
# every 5th point starting at 4 (which is a from 0 count, and matches
# line the data for 5 in the log.data file); then draw lines
# ("xerrorline") to y axis, using 0 to x value as the error range
# in green, these are every 10th point starting at our data for 10.
# implules are designed for this, xerrorline is not and isn't perfect.
plot "log.data" using 1:2 \
	with line \
	linecolor rgb "blue" \
	notitle, \
     "" using 1:2 \
	with points pointtype 7 pointsize 0.7 \
	linecolor rgb "blue" \
	notitle, \
     "" using 1:2 every 5::4 \
	with impulse linetype 0 \
	linecolor rgb "red" \
	notitle, \
     "" using 1:2:(0):1 every 10::9 \
	with xerrorline linetype 0 pointsize 0\
	linecolor rgb "green" \
	notitle

