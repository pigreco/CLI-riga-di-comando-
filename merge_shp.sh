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
-------
# divide i gpkg in shapefile
#!/bin/bash
for i in *.gpkg;
do
ogr2ogr -f 'ESRI Shapefile' output  "$i"
done;
------
# fonde gli shp in uno solo merged.shp
#shell OSGeo4W
for %f in (*.shp) 
do (
if not exist merged.shp 
(ogr2ogr -f “esri shapefile” merged.shp %f) 
else 
(ogr2ogr -f “esri shapefile” -update -append merged.shp %f -nln Merged )
)
------
#☺ fonde gli shp in un solo merged.shp
mapshaper -i *.shp encoding=latin1 combine-files -merge-layers -o merged.shp
------
# divide shapefile 
time mapshaper comuni.shp -split pk_uid -o format=shapefile
https://www.varunpant.com/posts/merge-multiple-shapefiles-using-ogr2ogr-in-windows-linux-or-osx
