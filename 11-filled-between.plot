set title "filled between two plot lines, stroked"

# The strokes are implemented as regraphing the top and bottom, so
# it is three graphs overall: fill, top line, bottom line.

# "linetype -1" is apparently undocumented, but it has the effect
# (here) of using the color black for the line. We turn off title/key
# for the strokes.
plot "between.data" using 1:2:3 with filledcurve title "Mouth-curve", \
     "between.data" using 1:2 with lines linewidth 2 linetype -1 notitle, \
     "between.data" using 1:3 with lines linewidth 2 linetype -1 notitle
