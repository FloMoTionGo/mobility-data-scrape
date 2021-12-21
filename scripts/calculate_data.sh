#!/bin/sh
db_path='../DB/mobility.sqlite'
sqlite3 ${db_path} < calculation.sqlite
