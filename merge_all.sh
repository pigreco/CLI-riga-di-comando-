## fondere tutti i file .tif presenti in una cartella

## sotto GNU/Linux
gdal_merge.py -ot Float32 -of GTiff -o OUTPUT.tif --optfile *.tif

## OSGe4W shell - nel file .txt elenco file da mergiare
gdal_merge.py -ot Float32 -of GTiff -o OUTPUT.tif --optfile mergeInputFiles.txt
