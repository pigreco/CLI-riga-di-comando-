#!/bin/bash
set -x

for i in *.shp; 
do 
  ogr2ogr -f 'GPKG' -append pacchetto.gpkg  "$i"; 
done
