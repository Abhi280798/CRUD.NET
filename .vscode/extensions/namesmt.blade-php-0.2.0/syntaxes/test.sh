#!/bin/bash
temp=$(mktemp)
for file_to_dedupe in $(echo *.json|sort)
do
   for file_to_strip in *.json
   do
      [ "$file_to_dedupe" == "$file_to_strip" ] && continue
      grep -w -Ff ${file_to_dedupe} -v ${file_to_strip} > ${temp}
      mv ${temp} ${file_to_strip}
   done
done
