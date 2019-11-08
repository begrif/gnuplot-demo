set title "bar chart plot"

# at boxwidth 1, boxes touch each other
# at boxwidth 0.5, boxes are as wide as the space between them
set boxwidth 0.25

# default is a non-filed bar (just an outline of a box)
set style fill solid

# make the y axis start at 0, but go as high as needed
set yrange [0:*]

# so we can read close together labels on x axis
set xtics rotate 90

# x axis in 1, y in 2, labels for x in 3
plot 'bar.data' using 1:2:xtic(3) with boxes notitle
