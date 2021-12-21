#!/bin/sh
db_path='../DB/mobility.sqlite'
created_at=$(date -d "yesterday" +%y%m%d)

declare -i mindate=$(ls ../CSV_per_day/*.csv | xargs -n1 basename | cut -c1-6 | sort | head -n1)
declare -i maxdate=$(ls ../CSV_per_day/*.csv | xargs -n1 basename | cut -c1-6 | sort | tail -n1)
num_days_back=$((maxdate - mindate))

sqlite3 ${db_path} < generate_DB.sqlite

for i in $(seq 1 ${num_days_back})
do d=$(date -d "Today - $i days" +%y%m%d)
echo 'importing data from '$d
sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import '../CSV_per_day/${d}vbb.csv' vbb"
sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import '../CSV_per_day/${d}TIER.csv' TIER"
done;
