set title "using time as the x axis"

# specify how to parse time from file
set timefmt '%H:%M:%S'

# x-axis is time based
set xdata time

# put the key in the bottom left quadrant of the graph area
set key left bottom

# explicit time range (uses timefmt)
set xrange ["0:00:00":"1:30:00"]

# leave seconds out of the display of the time, name hours and minutes
# across two lines
set xtics nomirror format "%Hh\n%Mm"

# make lines the default way to graph stuff, works in 5.x but not in 4.x
# set format data lines

plot "time.data" using 1:2 with lines title "going down", \
     "time.data" using 1:3 with lines title "going up"
