set title "basic log scale graph"

# y axis is logscale base 2
set logscale y 2

plot "log.data" using 1:2
