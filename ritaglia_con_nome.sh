#!/bin/bash

set -x

# crea due cartelle
mkdir -p ./out
mkdir -p ./output

# converti lo shapefile reticolo in CSV con il solo attributo nome
ogr2ogr -f CSV reticolo.csv reticolo.shp -sql "SELECT DISTINCT nome FROM reticolo"
# crea un file reticolo2 togliendo intestazione
cat reticolo.csv | tail -n+2 > ./reticolo2.csv
# cicla per splittare lo shapefile utilizzando il campo nome
while read p; do
	ogr2ogr -f "ESRI Shapefile" -where "nome ='$p'" ./out/$p.shp reticolo.shp;
done < ./reticolo2.csv;
# cicla per ritagliare il raster e assegnare nomefile uguale all'attributo nome
for i in ./out/*.shp; do
  filename=$(basename "$i")
  filename="${filename%.*}"
# ritaglia il raster
  gdalwarp -of GTiff -cutline ./out/"$filename".shp -crop_to_cutline -co COMPRESS=LZW ./vrt_2.vrt ./output/"$filename".tif
done;

# cancello cartella e file inutili
rmdir ./out
rm ./reticolo2.csv
