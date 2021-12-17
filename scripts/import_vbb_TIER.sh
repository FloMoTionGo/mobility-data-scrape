#!/bin/sh
db_path='../DB/vbb.sqlite'
created_at=$(date -d "yesterday" +%y%m%d)

sqlite3 ${db_path} < ../scripts/generate_DB.sqlite #> $@
sqlite3 ${db_path} -cmd ".header on" ".mode csv" ".import ../CSV_per_day/${created_at}vbb.csv vbb" > $db_path
# ".output $io_path " ".mode column" "SELECT * FROM vbb"
