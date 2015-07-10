#!/bin/bash
# Given a directory, extract all as HTML, then extract the links.
# Usage: extract-all-hrefs.sh icml2015/ output-file.csv (or whatever directory)

if [ "a$2" == "a" ]; then
  echo "Two arguments required: icml2015/ output-file.csv"
  exit 1;
fi

rm -f $2;
mkdir tmp;

for i in $1/*.pdf ; do
  echo $i;
  b=`basename $i`;
  pdftohtml -stdout "$i" > "tmp/${b/.pdf/.html}";

  ./extract-hrefs.sh "tmp/${b/.pdf/.html}" >> $2;
done
