#!bin/bash
declare -i mindate=$(ls ../JSON_source/*.json | xargs -n1 basename | cut -c1-6 | sort | head -n 1)
declare -i maxdate=$(ls ../JSON_source/*.json | xargs -n1 basename | cut -c1-6 | sort | tail -n 1)
num_days_back=$((maxdate - mindate))
#for i in $(seq 1 ${num_days_back}); do echo $i, $(date -d "Today - $i days" +%y%m%d); done;
for i in $(seq 1 ${num_days_back})
do d=$(date -d "Today - $i days" +%y%m%d)
echo $d
service=vbb
jq -r '.[] | [ .tripId, .when, .line.name, .stop.location.latitude, .stop.location.longitude ] | @csv' ../JSON_source/${d}*${service}*.json > ../CSV_per_day/${d}${service}.csv
service=TIER
jq -r '.data[] | [ .id, .attributes.lastLocationUpdate, .attributes.vehicleType, .attributes.lat, .attributes.lng  ] | @csv' ../JSON_source/${d}*${service}*.json > ../CSV_per_day/${d}${service}.csv
done;
