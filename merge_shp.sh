#!/bin/bash
consolidated_file="./consolidated.shp"
for i in $(find . -name '*.shp'); do
    if [ ! -f "$consolidated_file" ]; then
        # first file - create the consolidated output file
        ogr2ogr -f "ESRI Shapefile" $consolidated_file $i
    else
        # update the output file with new file content
        ogr2ogr -f "ESRI Shapefile" -update -append $consolidated_file $i
    fi
done
