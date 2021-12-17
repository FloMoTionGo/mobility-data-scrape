output_path='./DB/test.db'
echo "
CREATE TABLE vbb(
   id varchar(255),
   arrival varchar(255),
   latitude varchar(255),
   longitude varchar(255)
   );
.mode csv
.import ./CSV_per_day/211208vbb.csv vbb
.import ./CSV_per_day/211209vbb.csv vbb
.import ./CSV_per_day/211210vbb.csv vbb
.import ./CSV_per_day/211211vbb.csv vbb
.import ./CSV_per_day/211212vbb.csv vbb
.import ./CSV_per_day/211213vbb.csv vbb
.import ./CSV_per_day/211214vbb.csv vbb
.import ./CSV_per_day/211215vbb.csv vbb
.import ./CSV_per_day/211216vbb.csv vbb
" | sqlite3 $output_path
