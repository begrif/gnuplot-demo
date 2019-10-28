set title "graph with two lines"
plot "two.data" using 1:2 with lines, \
     "two.data" using 1:3 with lines

# can also be written as one long line, but the \
# at the end of the line can make it more readable
