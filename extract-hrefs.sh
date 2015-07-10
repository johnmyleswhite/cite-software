#!/bin/bash
# Hacktastic piece of crap script to pull out hrefs from files.
# Usage:
#   extract-hrefs.sh input_file.html
# Output to stdout.

if [ "a$1" == "a" ]; then
  echo "Argument required: input file"
  exit 1;
fi

# Get the easy stuff that's contained in <a href="...">.
cat $1 | grep -a '<A href=\"' | sed -E 's/.*<A href=\"([^"]*)\".*/\1 /g' | grep -a -v `basename $1` | sed 's/^[ \t]*//' | sed 's/[ \t]*$//' | sed 's/[ \t]*/\n/' | grep -a -v '^[ \t]*$' | sed 's/^/'`basename $1`', /';
