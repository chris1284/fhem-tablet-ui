#!/bin/bash   
rm controls_fhemtabletui.txt
#prevent overwrite of personal index.html
touch -t 201502222337 ./www/tablet/index.html
find ./www/tablet -type d \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' f; 
  do
   out="DIR $f"
   echo ${out//.\//} >> controls_fhemtabletui.txt
done
find ./www -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' f; 
  do
   out="UPD "$(stat -f "%Sm" -t "%Y-%m-%d_%T" $f)" "$(du $f)
   echo ${out//.\//} >> controls_fhemtabletui.txt
done




