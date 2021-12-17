output_path='./DB/test.db'
echo "
CREATE TABLE vbb(
   id varchar(255),
   arrival varchar(255),
   latitude varchar(255),
   longitude varchar(255)
   );
" | sqlite3 $output_path
