#!/bin/sh
declare -i mindate=$(ls JSON/*.json | xargs -n1 basename | cut -c1-6 | sort | head -n 1)
declare -i maxdate=$(ls JSON/*.json | xargs -n1 basename | cut -c1-6 | sort | tail -n 1)
num_days_back=$((maxdate - mindate))
#for i in $(seq 1 ${num_days_back}); do echo $i, $(date -d "Today - $i days" +%y%m%d); done;
for i in $(seq ${num_days_back} -1 1)
do d=$(date -d "Today - $i days" +%y%m%d)
echo $d
service=vbb
echo ID, created_at, vehicle, latitude, longitude > CSV/${d}${service}.csv
jq -r '.[] | [ .tripId, .when, .line.name, .stop.location.latitude, .stop.location.longitude ] | @csv' JSON/${d}*${service}*.json >> CSV/${d}${service}.csv
service=TIER
echo ID, created_at, vehicle, latitude, longitude > CSV/${d}${service}.csv
jq -r '.data[] | [ .id, .attributes.lastLocationUpdate, .attributes.vehicleType, .attributes.lat, .attributes.lng  ] | @csv' JSON/${d}*${service}*.json >> CSV/${d}${service}.csv
done;
