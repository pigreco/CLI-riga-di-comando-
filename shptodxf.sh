#!/bin/bash
set -x
#creo una cartella di output
mkdir ./nomecartella
for i in *.shp; 
do 
  #crei una variabile che usi per estrarre nome e estensione
  filename=$(basename "$i")
  #estrai estensione
  extension="${filename##*.}"
  #estrai nome file
  filename="${filename%.*}"
  ogr2ogr -f DXF ./nomecartella/"$filename".dxf ./"$i"; 
done
