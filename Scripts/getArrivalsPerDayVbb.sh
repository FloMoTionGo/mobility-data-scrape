#!bin/bash
#TODO declare -i mindate=$(ls JSON/*.json | xargs -n1 basename | cut -c1-6 | sort | head -n 1)
#TODO declare -i maxdate=$(ls JSON/*.json | xargs -n1 basename | cut -c1-6 | sort | tail -n 1)
#TODO num_days_back=$((maxdate - mindate))

for d in {10,11,12,13,14}
do query_day=2112$d
for h in {06,07,08,09,15,16,17,18}
do query_date=$query_day$h
curl 'https://v5.bvg.transport.rest/stops/900000160004/arrivals?when=2021-12-'$d'T'$h'%3A31%3A00%2B02%3A00&duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | jq . > JSON_source/${query_date}_vbb_arrivals.json
done;done
