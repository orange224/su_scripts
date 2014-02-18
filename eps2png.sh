#/bin/bash

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
   $op01 -verbose -quality 100 -density 300 -resize 100% ${fn}".eps" ${fn}".png"
   chmod 600 ${fn}".eps"
   chmod 600 ${fn}".png"
   echo " "
done

exit 0
