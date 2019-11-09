set title "log scale vs non-log graph"

# the graph goes left bottom corner to right top corner, move the key
set key right bottom

set xlabel "Days"

# y axis is logscale base 10
set logscale y 10

# label it
set ylabel "Signups (log)"

# don't copy tics to other side
set ytics nomirror

# second axis without logscale for comparison; you can see the generator
# I'm calling "hockey" doesn't start off flat enough for traditional
# hockey stick shape
set y2tics nomirror autofreq

# label it
set y2label "Signups (linear)"

plot "log.data" using 1:2 title "log scale", \
     "log.data" using 1:2 title "linear" axis x1y2
