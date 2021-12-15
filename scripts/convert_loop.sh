#!bin/bash
for d in {211208..211214}
do
echo $d
service=vbb
jq -r '.[] | [ .tripId, .when, .stop.location.latitude, .stop.location.longitude ] | @csv' ./JSON_source/${d}*${service}*.json > ./CSV_per_day/${d}${service}.csv
service=TIER
jq -r '.data[] | [ .attributes.lastLocationUpdate, .attributes.vehicleType, .attributes.lat, .attributes.lng  ] | @csv' ./JSON_source/${d}*${service}*.json > ./CSV_per_day/${d}${service}.csv
done;
