set title "graph with three lines"
plot "three.data" using 1:2 with lines, \
     "three.data" using 1:3 with lines, \
     "three.data" using 1:4 with lines

# again, can also be written as one long line, but the \
# at the end of the line can make it more readable

