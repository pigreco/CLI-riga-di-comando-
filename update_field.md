## Aggiorna i valori di un campo

Data una cartella con enne shapefile, aggiornare un valore del campo

OSGeoShell
```
for %f in (*.shp) do (ogrinfo -dialect SQLite -sql "UPDATE %~nf SET DEN_CM='TOTO' WHERE DEN_CM='-'" %f)
```

<https://gis.stackexchange.com/questions/22175/adding-field-with-filename-when-merging-shapefiles-with-ogr2ogr/335941>