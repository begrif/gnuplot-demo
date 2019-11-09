# tested with gnuplot 4.2
# using the ylabel instead of a title in preparation for a rotation
set ylabel "sideways bars, in pairs"

# roughly based on
# https://gnuplot-tricks.blogspot.com/2009/10/turning-of-histogram.html

# set up some colors for our paired columns
set style line 1 lc rgb "green"
set style line 2 lc rgb "blue"

# set up box style, here with border because blue/green is hard
# on the colorblind
set style fill solid border -1

# in the data file each pair is at (even_integer, even_integer + 0.5),
# so width of 0.5 will have the bars touch, and at the odd integers we
# have a space between pairs
set boxwidth 0.5

# make sure to have x axis with some space to either side of the bars
# the interaction between this data set and the range is much different
# in gnuplot 4.2 vs 5.0
set xrange [ -1.5 : 5 ]

# anchor the bars to 0; this data is capped at 35, leave some headroom
set yrange [    0 : 40 ]

# Here we get tricky. Gnuplot doesn't like doing sideways barcharts, but
# we can make it so the chart is fully ready to rotate 90 degress in
# post-processing.
# 
# x tics will be labeled in the data
set noxlabel
# rotate them, and hide the tic mark ("scale 0")
set xtic rotate by 90 scale 0

# no "top" tics
set noytics

# instead "bottom" tics, rotated
set y2tics rotate by 90

# here we set up the style to be a type of bar chart with clustered
# data and a gap between sets
set style data histogram
set style histogram cluster gap 1

# The "every" keyword sets up a loop for which points in a data set to use:
#  every {pt_increment}:{bk_increment}:{start_pt}:{start_bk}:{end_pt}:{end_bk}
# data starts at point 0, block 0; different points are on different lines,
# different blocks are separated by blank lines. 
#
# The first plot uses every second point, starting at 0, the second uses
# every second point, starting at 1, the third labels our x axis (left axis
# after expected post rotate). There's some chicanery going on there to
# put the labels in the right place. Column 1 ("$1") in the data file minus
# 1/3rd of the line number ("$0") is used for x, a constant zero ("(0)")
# is used for y, and column 3 is used for xtics. This is drawn as a line,
# which will be invisible as it sits on the box of the graph.
plot "bar2.data" every 2   \
	using 2 \
	linestyle 2 \
	notitle, \
     "bar2.data" every 2::1 \
	using 2 \
	linestyle 1 \
	notitle, \
     "bar2.data" every 2 \
       using ($1 - $0*0.33):(0):xticlabel(3) \
       with line \
       notitle

