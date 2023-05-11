#Gnuplot template for the projection functions

#Prepare the axes
set xrange [1:10000]
set xlabel "Number of Processes"
set logscale x
set yrange [0:105]
set ylabel "Efficiency"
set ytics ( 0, "10%%" 10, "20%%" 20, "30%%" 30, "40%%" 40, "50%%" 50, "60%%" 60, "70%%" 70, "80%%" 80, "90%%" 90, "100%%" 100 )
set grid ytics

set style line 1 lt 7 dt 2 lw 1.5 lc rgb "#0E3D59"
set style line 2 lt 7 dt 2 lw 1.5 lc rgb "#88A61B"
set style line 3 lt 7 dt 2 lw 1.5 lc rgb "#F29F05"
set style line 4 lt 7 dt 2 lw 1.5 lc rgb "#F25C05"
set style line 5 lt 7 dt 2 lw 1.5 lc rgb "#D92525"

set key left bottom Left reverse

para( x ) = load( x ) * comm( x ) / 100
load( x ) = ( x > 12.0 ) ? 96.29430445507096 / ( 0.9987318128673276 + ( 1 - 0.9987318128673276 ) * x ) : 1/0
comm( x ) = ( x > 12.0 ) ? 82.69158199591404 / ( 0.9680170607592201 + ( 1 - 0.9680170607592201 ) * x ) : 1/0
comp( x ) = ( x > 12.0 ) ? 1198.8009564530225 / ( 2.3747997984839047e-19 + ( 1 - 2.3747997984839047e-19 ) * x ) : 1/0
glob( x ) = para( x ) * comp( x ) / 100

plot para(x) title "Parallel Efficiency" ls 1,\
     load(x) title "Load Balance" ls 2,\
     comm(x) title "Communication Efficiency" ls 3,\
     comp(x) title "Computation Scalability" ls 4,\
     glob(x) title "Global Efficiency" ls 5,\
     '-' with points notitle ls 1,\
     '-' with points notitle ls 2,\
     '-' with points notitle ls 3,\
     '-' with points notitle ls 4,\
     '-' with points notitle ls 5

12.0 58.06661927754777 
24.0 50.67084072446019 
48.0 26.218972569274314 
e
12.0 94.96191618286231 
24.0 94.73323816508523 
48.0 90.46483879601195 
e
12.0 61.147269991616916 
24.0 53.48792219702185 
48.0 28.982500735335588 
e
12.0 100.0 
24.0 33.543303752926604 
48.0 17.820373892120006 
e
12.0 58.06661927754777 
24.0 16.99667401836732 
48.0 4.672318942517066 
e

pause -1
