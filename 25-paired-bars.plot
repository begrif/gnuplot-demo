set title "bars, in pairs"

# set up some colors for our paired columns
set style line 1 lc rgb "red"
set style line 2 lc rgb "blue"

# set up box style
set style fill solid

# in the data file each pair is at (even_integer, even_integer + 0.5),
# so width of 0.5 will have the bars touch, and at the odd integers we
# have a space between pairs
set boxwidth 0.5

# what tics to draw and what labels to put on them (this is not as
# flexible as labels in the data, but might be easier)
# labels are positioned half-way between each pair
set xtics ("explicit" 0.25, "tic" 2.25, "labels" 4.25)

# make sure to have x axis with some space to either side of the bars
set xrange [ -0.5 : 5 ]

# anchor the bars to 0; this data is capped at 35, leave some headroom
set yrange [    0 : 40 ]

# The "every" keyword sets up a loop for which points in a data set to use:
#  every {pt_increment}:{bk_increment}:{start_pt}:{start_bk}:{end_pt}:{end_bk}
# data starts at point 0, block 0; different points are on different lines,
# different blocks are separated by blank lines. 
#
# The first plot uses every second point, starting at 0, the second uses
# every second point, starting at 1.
plot "bar2.data" every 2   \
	using 1:2 \
	with boxes \
	linestyle 2 \
	title "before", \
     "bar2.data" every 2::1 \
	using 1:2 \
	with boxes \
	linestyle 1 \
	title "after"
