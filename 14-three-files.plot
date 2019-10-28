set title "graph with three files, in three styles"

# "using 1:2" the first column of one.data is x, the second column is y
# "using 1:3" the first column of two.data is x, the third column is y
# "using 1:4" the first column of three.data is x, the fourth column is y
plot "one.data" using 1:2 with lines, \
     "two.data" using 1:3 with points, \
     "three.data" using 1:4 with linespoints

