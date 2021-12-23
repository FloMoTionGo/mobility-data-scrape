#!/bin/sh
db_path='DB/mobility.sqlite'
created_at=$(date -d "yesterday" +%y%m%d)
importPast=1

sqlite3 ${db_path} < Scripts/TIERVBB_CreateTables.sqlite

if [[ ${importPast} -eq 1 ]]; then
  ListOfDates=$(ls CSV/*TIER*.csv | xargs -n1 basename | cut -c1-6 | sort)
  for daydate in $ListOfDates
  do
    echo 'importing data from '$daydate
    sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import 'CSV/${daydate}vbb.csv' VBB" ".import 'Grids/${daydate}TIER_onGrid.csv' TIER"
  done;
else
  echo 'importing data from '${created_at}
  sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import 'CSV/${created_at}vbb.csv' VBB" ".import 'Grids/${created_at}TIER_onGrid.csv' TIER"
fi
