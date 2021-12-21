#!/bin/sh
db_path='../DB/mobility.sqlite'
created_at=$(date -d "yesterday" +%y%m%d)
min_date=211208
max_date=211220
sqlite3 ${db_path} < generate_DB.sqlite
for i in $(seq ${min_date} ${max_date})
do echo $i
sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import '../CSV_per_day/${i}vbb.csv' vbb"
sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import '../CSV_per_day/${i}TIER.csv' TIER"
done;
