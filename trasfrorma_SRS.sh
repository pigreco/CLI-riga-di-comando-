#!/bin/bash
set -x

#creo una cartella di output
mkdir ./nomecartella

for i in *.shp; 
do 
  ogr2ogr -t_srs EPSG:32632 ./nomecartella/"$i" ./"$i"; 
done
