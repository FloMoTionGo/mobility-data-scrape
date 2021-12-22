#!/bin/sh
db_path='DB/mobility.sqlite'
created_at=$(date -d "yesterday" +%y%m%d)
importPast=0

sqlite3 ${db_path} < scripts/generate_DB.sqlite

if [[ ${importPast} -eq 1 ]]; then
  declare -i mindate=$(ls CSV_per_day/*.csv | xargs -n1 basename | cut -c1-6 | sort | head -n1)
  declare -i maxdate=$(ls CSV_per_day/*.csv | xargs -n1 basename | cut -c1-6 | sort | tail -n1)
  num_days_back=$((maxdate - mindate))
  for i in $(seq 1 ${num_days_back})
  do
    echo 'importing data from '$d
    d=$(date -d "Today - $i days" +%y%m%d)
    sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import 'CSV_per_day/${d}vbb.csv' vbb"
    sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import 'CSV_per_day/${d}TIER.csv' TIER"
  done;
else
  sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import 'CSV_per_day/${created_at}vbb.csv' vbb"
  sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import 'CSV_per_day/${created_at}TIER.csv' TIER"
fi
