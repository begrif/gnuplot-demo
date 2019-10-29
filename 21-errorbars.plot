set title "data with error bars"

# x in 1, y in 2, error size in 3
plot "errors.data" using 1:2:3 with errorbars
