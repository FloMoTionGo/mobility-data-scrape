#!/bin/sh
output_path='../DB/vbb.db'
echo "
CREATE TABLE vbb(
   id varchar(255),
   arrival varchar(255),
   latitude varchar(255),
   longitude varchar(255)
   );

.mode csv
.import ../CSV_per_day/211208vbb.csv vbb
.import ../CSV_per_day/211209vbb.csv vbb
.import ../CSV_per_day/211210vbb.csv vbb
.import ../CSV_per_day/211211vbb.csv vbb
.import ../CSV_per_day/211212vbb.csv vbb
.import ../CSV_per_day/211213vbb.csv vbb
.import ../CSV_per_day/211214vbb.csv vbb
.import ../CSV_per_day/211215vbb.csv vbb
.import ../CSV_per_day/211216vbb.csv vbb

.mode column
.output $output_path
.header on
SELECT id,
        SUBSTR(id,3,5) as trainID,
        arrival,
        latitude,
        longitude
FROM vbb;

--.output stdout.sql
--.dump
--.exit
" | sqlite3
