#!/bin/sh
db_path='DB/mobility.sqlite'
#sqlite3 ${db_path} < calculation.sqlite

#Lichtenberg Grid
maxLat=52.511934
minLat=52.505382
maxLon=13.500017
minLon=13.491832
#create grid
steps=5
incLat=$(bc <<< "scale=6; ($maxLat-$minLat) / $steps")
incLon=$(bc <<< "scale=6; ($maxLon-$minLon) / $steps")
fname="Grids/Coordinates_Lichtenberg.csv"
#echo Latitude, Longitude > $fname
for i in $(seq 1 ${steps})
do for j in $(seq 1 ${steps})
do echo $(bc <<< "scale=6;$minLat + $incLat * $i"), $(bc <<< "scale=4;$minLon + $incLon * $j") >> $fname
done;done;
