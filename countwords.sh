# this script requires a detex installation

EXCLUDE_ENVIRONMENTS="array,eqnarray,equation,figure,mathmatica,picture,table,verbatim,"

# comma seperated list of additional, non-standard environments to exclude
EXCLUDE_ADDITIONAL_ENVIRONMENTS=""

detex -e $EXCLUDE_ENVIRONMENTS$EXCLUDE_ADDITIONAL_ENVIRONMENTS thesis_main.tex  > thesis_main.txt

# Removes everything before Einleitung and after Anhang
BEGINNING="INTRODUCTION"
ENDING="nottype"
while read p; do
  # end txt when end was found
  echo "$p" | grep $ENDING && break
  if [ "$FOUNDBEGIN" == "y" ]
      then
          echo "$p" >>wordcounts.txt
  fi
  # start txt when beginning was found
  echo "$p" | grep $BEGINNING >/dev/null && FOUNDBEGIN="y"
done <thesis_main.txt

echo "Anzahl der Wörter vom Kapitel Einleitung bis Anhang:"
#wc -w wordcounts.txt # zeilen, wörter, zeichen
#rm wordcounts.txt 2> /dev/null
#rm thesis_main.txt 2> /dev/null