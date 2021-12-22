#!/bin/sh
daydate=$(date -d "Yesterday" +%y%m%d)
inputFilename='CSV_per_day\'${daydate}'TIER.csv'
gridFilename='Grids\Coordinates_Lichtenberg.csv'
while read line; do
  mindist=1
  while read coord; do
      x1=$(echo $line | cut -d "," -f4)
      y1=$(echo $line | cut -d "," -f5 | rev | cut -c3- | rev)
      x2=$(echo $coord | cut -d "," -f1 )
      y2=$(echo $coord | cut -d "," -f2 | rev | cut -f1 -d " " | rev)
      diff=$(echo "sqrt(($x1-$x2)^2+($y1-$y2)^2)" | bc)
      if [[ $(bc<<<"$diff < $mindist") -eq 1 ]]; then
        echo new minimum: "$diff from $mindist"
        mindist=$diff
        xmin=$x2
        ymin=$y2
        #echo "$x2, $y2"
       elif [[ $(bc<<<"$mindist == 0") -eq 1 ]]; then
        echo -----
        break
      fi
  done<$gridFilename
echo "$line, $xmin, $ymin" >> 'Grids\'${daydate}'TIER_onGrid.csv'
done<$inputFilename
