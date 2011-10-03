originalResourceDirectory="English.lproj"

echo $originalResourceDirectory
for localizedDirectory in *.lproj; do
  if [ $localizedDirectory != $originalResourceDirectory ]; then
    echo "processing ${localizedDirectory}"
    for xibFile in "${originalResourceDirectory}/"*.xib; do
      xibBaseName=$(basename "${xibFile}")
      if [ -f "${localizedDirectory}/${xibBaseName}.strings" ]; then
        ibtool --strings-file "${localizedDirectory}/${xibBaseName}.strings" --write "${localizedDirectory}/${xibBaseName}" "$xibFile"
      else
        echo "missing: ${localizedDirectory}/${xibBaseName}.strings"
      fi
    done
  fi
done

for localizedDirectory in "Resources-iPad/"*.lproj; do
  if [ $localizedDirectory != "Resources-iPad/"$originalResourceDirectory ]; then
    echo "processing iPad/ ${localizedDirectory}"
    for xibFile in "Resources-iPad/${originalResourceDirectory}/"*.xib; do
      xibBaseName=$(basename "${xibFile}")
      if [ -f "${localizedDirectory}/${xibBaseName}.strings" ]; then
        ibtool --strings-file "${localizedDirectory}/${xibBaseName}.strings" --write "${localizedDirectory}/${xibBaseName}" "$xibFile"
      else
        echo "missing: ${localizedDirectory}/${xibBaseName}.strings"
      fi
    done
  fi
done

exit 0