#!/bin/sh
# Rename the fictional hotel everywhere in index.html.
# Usage: ./rename.sh "Halloway House"
set -e
NEW="$1"
if [ -z "$NEW" ]; then echo "usage: $0 \"New Hotel Name\""; exit 1; fi
cd "$(dirname "$0")"
CURRENT=$(sed -n 's/.*<meta property="og:site_name" content="\([^"]*\)".*/\1/p' index.html)
sed -i '' "s/$CURRENT/$NEW/g" index.html
echo "Renamed \"$CURRENT\" -> \"$NEW\" in index.html ($(grep -c "$NEW" index.html) lines touched)."
