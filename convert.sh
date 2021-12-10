touch  CSV_per_day/_.csv

query_date=$(date +"%y%m")
service=vbb

jq .[]."tripId" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
jq .[]."when" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
jq .[]."line"."id" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
jq .[]."line"."mode" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, CSV_per_day/_$query_date$service.csv > CSV_per_day/$query_date$service.csv

service=TIER

jq .data[]."id" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
jq .data[]."attributes"."lastLocationUpdate" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
jq .data[]."attributes"."vehicleType" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
jq .data[]."attributes"."lat" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
jq .data[]."attributes"."lng" JSON_source/$query_date*$service*.json | awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, >> CSV_per_day/_$query_date$service.csv
awk '{for(i=1;i<=NF;i++)a[i][NR]=$i}END{for(i in a)for(j in a[i])printf"%s"(j==NR?"\n":FS),a[i][j]}' FS=, CSV_per_day/_$query_date$service.csv > CSV_per_day/$query_date$service.csv

rm CSV_per_day/_*.csv
