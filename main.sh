#!/bin/sh
echo Gleich geht\'s los! - Almost ready to go! - Mindjárt kezdődik!
# setup
echo --- Create Folder Structure ---
bash Scripts/setupFolderStructure.sh
# scrape APIs
echo --- Call APIs ---
bash Scripts/scrapingTierVbb.sh
# convert from scraped JSON to CSV
echo --- Convert JSON ---
bash Scripts/convertToCsvTierVbb.sh
# create Grid for VBB POI
echo --- Create Grid ---
bash Scripts/calculateGridVbb.sh
# add Grid to TIER*.CSV
echo --- Add Grid Coordinates ---
bash Scripts/addGridCoordinatesTier.sh
# import TIER VBB into sqlite3 DB
echo --- Import CSV ---
bash Scripts/importTierVbb.sh
# transform data in DB
echo --- Transform SQLite ---
bash Scripts/transformTierVbb.sh
# load data to dashboard
echo --- Load Database ---
bash Scripts/loadTierVbb.sh
