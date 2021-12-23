#!/bin/sh
ListOfDates=$(ls CSV/*TIER*.csv | xargs -n1 basename | cut -c1-6 | sort)
for daydate in ${ListOfDates}
do
  inputFilename='CSV/'${daydate}'TIER.csv'
  outputFilename='Grids/'${daydate}'TIER_onGrid.csv'
  gridFilename='Grids/coordinatesLichtenberg.csv'
  if ! [[ -f $outputFilename ]]; then
  echo Working on $outputFilename
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
  echo "$line, $xmin, $ymin" >> $outputFilename
  done<$inputFilename
  else
    echo Skipping $outputFilename
  fi
done
