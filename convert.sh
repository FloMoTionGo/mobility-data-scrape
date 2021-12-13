touch  CSV_per_day/_.csv

query_date=$(bash date -d "Today -5 days" +"%y%m%d")

service=vbb
jq '.[] | [ .tripId, .when, .stop.location.latitude, .stop.location.longitude ] | @csv' JSON_source/$query_date*$service*.json  >> CSV_per_day/$query_date$service.csv

service=TIER
jq '.data[] | [ .attributes.lastLocationUpdate, .attributes.vehicleType, .attributes.lat, .attributes.lng  ] | @csv' JSON_source/$query_date*$service*.json  >> CSV_per_day/$query_date$service.csv

rm CSV_per_day/_*.csv
