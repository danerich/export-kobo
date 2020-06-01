#!/bin/bash

cd /Users/danerich/Dropbox/Documents/Books/Kobo\ Backup/

STAMP=$(date +%Y_%m_%d )
OUTPUT="../Annotations/Kobo/"

mkdir -p "${OUTPUT}/${STAMP}"

FILE=$(ls -t1 |  head -n 1)
echo "Found: ${FILE}"
echo "Exporting Annotations..."

unzip -q ${FILE} -d temp

python3 ../Scripts/export-kobo/export-kobo.py temp/KoboReader.sqlite --csv --output ${OUTPUT}/${STAMP}/Annotations.csv

python3 ../Scripts/export-kobo/export-kobo.py temp/KoboReader.sqlite --output ${OUTPUT}/${STAMP}/Annotations.txt

rm -rf temp
echo "Done!"

