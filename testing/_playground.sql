/*
 * SQLite CREATE TABLE
 * Released under the Creative Commons License.
 */

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
