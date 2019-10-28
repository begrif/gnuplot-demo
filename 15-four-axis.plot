set title "graph with four axes"

# mark all the tics on one side only, automatic spacing
set xtics nomirror autofreq
set x2tics nomirror autofreq
set ytics nomirror autofreq
set y2tics nomirror autofreq

# line key outside graph
set key outside

# lines titled showing axis in use
plot "four.data" using 1:2 with lines axis x1y1 title "bottom, left", \
     "four.data" using 1:3 with lines axis x1y2 title "bottom, right", \
     "four.data" using 1:4 with lines axis x2y1 title "top, left", \
     "four.data" using 1:5 with lines axis x2y2 title "top, right"

