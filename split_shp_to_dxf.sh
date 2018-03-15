#!/bin/bash
set -x
#creo cartella di output
mkdir ./nomecartelladxf
mkdir ./nomecartellashp

#trasformo in csv lo shapefile
ogr2ogr -f CSV sicilia.csv sicilia.shp;

# estraggo la colonna che mi serve e rimuovo l'intestazione
csvsql --query "select SIGLA from sicilia" sicilia.csv | tail -n +2 >./sigla.csv;

# ciclo per splittare lo shapefile
while read p; do
	ogr2ogr -f "ESRI Shapefile" -where "SIGLA ='$p'" ./nomecartellashp/$p.shp sicilia.shp;
done <./sigla.csv;

#ciclo per convertire da shp in dxf
for i in ./nomecartellashp/*.shp; 
do 
  #crei una variabile che usi per estrarre nome e estensione
  filename=$(basename "$i")
  #estrai estensione
  extension="${filename##*.}"
  #estrai nome file
  filename="${filename%.*}"
  ogr2ogr -f DXF ./nomecartelladxf/"$filename".dxf ./"$i"; 
done
