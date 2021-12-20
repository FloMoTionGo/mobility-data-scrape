#!/bin/sh
db_path='../DB/mobility.sqlite'
created_at=$(date -d "yesterday" +%y%m%d)

sqlite3 ${db_path} < ../scripts/generate_DB.sqlite
sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import ../CSV_per_day/${created_at}vbb.csv vbb"
sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import ../CSV_per_day/${created_at}TIER.csv TIER"
