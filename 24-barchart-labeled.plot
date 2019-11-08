set title "bar chart plot, bars labeled"

# at boxwidth 1, boxes touch each other
# at boxwidth 0.5, boxes are as wide as the space between them
set boxwidth 0.5

# default is a non-filed bar (just an outline of a box)
set style fill solid

# define a style to be used later ("linestyle 1")
set style line 1 linecolor rgb "blue"

# make the y axis start at 0, but go as high as needed
set yrange [0:*]

# so we can read close together labels on x axis
set xtics rotate 90

# x axis in 1, y in 2, labels for x in 3, using defined style without title,
# and plot x in 1, y in 2 (but with 1 added to y), label in 2 as labels
plot 'bar.data' using 1:2:xtic(3) with boxes linestyle 1 notitle, \
     'bar.data' using 1:($2 + 1):2 with labels notitle
