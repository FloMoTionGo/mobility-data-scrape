#!/bin/sh
echo Gleich geht\'s los! - Almost ready to go! - Mindjárt kezdődik!
# setup
echo --- Create Folder Structure ---
bash Scripts/setupFolderStructure.sh > Logs/logSetup.txt
# scrape APIs
echo --- Call APIs ---
bash Scripts/scrapingTierVbb.sh > Logs/logScrape.txt
# convert from scraped JSON to CSV
echo --- Convert JSON ---
bash Scripts/convertToCsvTierVbb.sh > Logs/logConvert.txt
# create Grid for VBB POI
echo --- Create Grid ---
bash Scripts/calculateGridVbb.sh > Logs/logCreateGrid.txt
# add Grid to TIER*.CSV
echo --- Add Grid Coordinates ---
bash Scripts/addGridCoordinatesTier.sh > Logs/logAddCoordinatesGrid.txt
# import TIER VBB into sqlite3 DB
echo --- Import CSV ---
bash Scripts/importTierVbb.sh > Logs/logImportCSV.txt
# transform data in DB
echo --- Transform SQLite ---
bash Scripts/transformTierVbb.sh > Logs/logTransformSQLite.txt
# load data to dashboard
echo --- Load Database ---
bash Scripts/loadTierVbb.sh > Logs/logTransformSQLite.txt
