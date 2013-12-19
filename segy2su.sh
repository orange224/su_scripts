#/bin/bash

# @author: 
#  orange224@gmail.com

# @purpose:
#  extract su file from segy file

# @warning:
#  check the endian of your system, at first

operation1=/opt/cwp_su_43r5/bin/segyread
operation2=/opt/cwp_su_43r5/bin/surange

# if directory name given as a script argument...
if [-n "$1"]
then
   directory=$1
else
   directory=$PWD
fi

for file in $directory/*.segy
do 
   fn=${file%.segy}
   echo ${fn}".segy"
   $operation1 tape=${fn}".segy" endian=0 hfile=${fn}".hfile" bfile=${fn}".bfile" > ${fn}".su"
   $operation2 < ${fn}".su" > ${fn}".range"
   echo " "

   chmod 600 ${fn}".range"
   chmod 600 ${fn}".hfile"
   chmod 600 ${fn}".bfile"
   chmod 600 ${fn}".su"
done


exit 0
