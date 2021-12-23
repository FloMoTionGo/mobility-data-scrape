#!/bin/sh
echo Gleich geht\'s los! - Almost ready to go! - Mindjárt kezdődik!
# setup
echo --- Create Folder Structure ---
bash Scripts/Setup.sh > Logs/LogSetup.txt
# scrape APIs
echo --- Call APIs ---
bash Scripts/TIERVBB_Scraping.sh > Logs/LogScrape.txt
# convert from scraped JSON to csv
echo --- Convert JSON ---
bash Scripts/TIERVBB_ConvertToCSV.sh > Logs/LogConvert.txt
# create Grid for VBB POI
echo --- Create Grid ---
bash Scripts/VBB_CalculateGrid.sh > Logs/LogCreateGrid.txt
# add Grid to TIER*.CSV
echo --- Add Grid Coordinates ---
bash Scripts/TIER_AddGridCoordinates.sh > Logs/LogAddCoordinatesGrid.txt
# import TIER VBB into sqlite3 DB
echo --- Import CSV ---
bash Scripts/TIERVBB_import.sh > Logs/LogImportCSV.txt
# transform data in DB
echo --- Transform SQLite ---
bash Scripts/TIERVBB_Transform.sh > Logs/LogTransformSQLite.txt
