#/bin/bash

# @author: 
#  orange224@gmail.com

# @purpose:
#  extract su file from segy file

# @warning:
#  check the endian of your system, at first

#> @todo
#!  2014-01-22 add 'segyclean' process in order to clean the value of 'd1' or 'f1'


op01=/opt/cwp_su_43r5/bin/segyread
op02=/opt/cwp_su_43r5/bin/surange
op03=/opt/cwp_su_43r5/bin/segyclean

# if directory name given as a script argument...
if [ -n "$1"]
then
   directory=$1
else
   directory=$PWD
fi

for file in $directory/*.segy
do 
   fn=${file%.segy}
   echo ${fn}".segy"
   $op01 tape=${fn}".segy" endian=0 hfile=${fn}".hfile" bfile=${fn}".bfile" > "tmp.su"
   $op03 < "tmp.su" > ${fn}".su"
   rm "tmp.su"
   
   $op02 < ${fn}".su" > ${fn}".range"
   cp ${fn}".range" ${fn}".info" 
   
   chmod 600 ${fn}".range"
   chmod 600 ${fn}".hfile"
   chmod 600 ${fn}".bfile"
   chmod 600 ${fn}".info"
   chmod 600 ${fn}".su"
done

exit 0
