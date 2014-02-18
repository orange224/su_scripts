#/bin/bash

# -depth : This option specifies the image resolution to store while encoding a raster image 
#         or the canvas resolution while rendering (reading) vector formats such as Postscript,
#         PDF, WMF, and SVG into a raster image.
#          The default resolution is 72 dots per inch, which is equivalent to one point per pixel 
#         (Macintosh and Postscript standard). Computer screens are normally 72 or 96 dots per inch, 
#         while printers typically support 150, 300, 600, or 1200 dots per inch

op01=/usr/bin/convert

# if directory name given as a script argument...
if [ -n "$1" ]
then
   directory=$1
else
   directory=$PWD
fi

for file in $directory/*.eps
do 
   fn=${file%.eps}
   $op01 -verbose -quality 100 -density 300 -colorspace rgb -resize 100% ${fn}".eps" ${fn}".png"
   chmod 600 ${fn}".eps"
   chmod 600 ${fn}".png"
   echo " "
done

exit 0


