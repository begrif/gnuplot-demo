set title "using dates as the x axis"

# specify how to parse time from file
set timefmt '%Y-%m-%d'

# x-axis is time based (dates are time)
set xdata time

# use American style dates for label, rotated so they don't overlap
set xtics format '%m/%d/%Y' rotate by 90

# don't bother labeling lines ("unset key" is the old way to do this)
set nokey

plot "date.data" using 1:2 with lines, \
     "date.data" using 1:3 with lines, \
     "date.data" using 1:4 with lines
