#!/bin/bash
#$0=loop.sh $1=c2smalaga.sumo.cfg $2=malaga-alameda/ $3=tl-logic.add.xml $4=output-tripinfos.xml $5./ $6=200 $7=250

sumo -c $2$1 -a $2$3 
awk -f $5$"processOutTLS.awk" $2$3 > GvR.txt
gvr=$(cat GvR.txt)
awk -f $5$"processOutSUMO.awk" $2$4  numVehTotal=$6 netdir=$5 greenVsred=$gvr sim_time=$7 > res.txt
#awk -f $5$"processOutSUMO.awk" $2$4  numVehTotal=$6 netdir=$5 greenVsred=$gvr sim_time=$7


#a="twoIntersections.500.sumo.cfg"
#b="tl2/2-intersections/2/"
#c="tlLogic.add.xml"
#d="output-tripinfos.xml"
#e="./"
#f=500
#g=1600

##sumo-gui -c $2$1 -a $2$3 
#sumo -c $b$a -a $b$c 
#awk -f $e$"processOutTLS.awk" $b$c > GvR.txt
#gvr=$(cat GvR.txt)
#awk -f $e$"processOutSUMO.awk" $b$d  numVehTotal=$f netdir=$e greenVsred=$gvr sim_time=$g > res.txt


