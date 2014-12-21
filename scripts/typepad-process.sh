#!/bin/bash

URL="$1"
SLUG="$2"

HERE="$( cd "$(dirname "$0")"; pwd )"

if [ $# -ne 2 ]; then
	echo "$0 URL SLUG"
	exit 1
fi

wget "$URL" -O "$SLUG.html"
"$HERE/typepad-to-markdown.js" --file $SLUG.html > "$HERE/../content/$SLUG.md"
rm -f "$SLUG.html"

