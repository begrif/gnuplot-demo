set title textcolor rgb "#223322" "graph with several options"

# dotted lines across graph
set grid

# put the key by the bottom margin, centered, horizontal layout,
# blue text
set key bmargin center horizontal textcolor rgb "blue"

# formating of the numbers on left
set ytics format "%03.1f"

# explicit range of numbers (don't start from zero) for x axis
set xrange [1:50]

# put the tics for x axis outside the graph
set xtics out

# label x axis
set xlabel "Kids"

# label left axis and give it a color
set ylabel textcolor rgb "#FF4422" "Noise"

# don't mirror the tics to the right side, start numbering from -10
# and go up by 20, use a color for the numbers
set ytics nomirror -10, 20 textcolor rgb "#FF4422"

# graph from -50 to 150 (but note labeling starts at -10)
set yrange [-50:150]

# second (right side) axis for y, text color (using name, probably
# same color names as in HTML), and labeled
set y2label textcolor rgb "green" "Parental patience (estimate)"

# don't mirror these tics to left side
set y2tics nomirror

# label #1 starts 50% through graph field horizonal, and 90% vertical
set label 1 at graph 0.5, 0.9 textcolor rgb "red" "Regret not graphed"

# label #2 is at 30%,40% of whole image
set label 2 at screen 0.3, 0.4 textcolor rgb "red" "Too many already"

# label #3 is at bottom axis 40, left axis 20, text centered, drawn
# on top of graph lines, point 40x20 marked, label offset slightly
set label 3 at 40,20 center front point offset 1,1 "No more!"

# all will be graphed as lines; all get a different explicit color:
# reds for left axis, green for right axis; all are against bottom
# x axis (x1), two are against left y axis (y1), and one against 
# right y axis (y1)
plot "three.data" using 1:2 \
	with lines \
	linecolor rgb "pink" \
	axis x1y1 \
	title "actual noise", \
     "three.data" using 1:3 \
     	with lines \
	linecolor rgb "red" \
	axis x1y1 \
	title "percieved noise", \
     "three.data" using 1:4 \
     	with lines \
	linecolor rgb "green" \
	axis x1y2 \
	title "going to snap"

