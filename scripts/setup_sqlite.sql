/*
 * SQLite CREATE TABLE
 * Released under the Creative Commons License.
 */

CREATE TABLE vbb(
   id varchar(255),
   arrival varchar(255),
   latitude varchar(255),
   longitude varchar(255)
   );


.mode column
--.output vbb.db
CREATE TABLE daily AS
SELECT
  strftime('%Y%m%d', arrival) as Date_in_ymd
, count(substr(id, 3,5)) AS Count_per_day
from vbb
group by date_ymd;

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
.exit
