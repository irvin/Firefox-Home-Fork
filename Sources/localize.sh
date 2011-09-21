#!/bin/sh

# ./localize.sh Localize zh_TW zh_Hant

FILENAME=$1
SRC_LOCALE=$2
DST_LOCALE=$3

echo "Localizing ${FILENAME}.strings"
echo " src: .../${SRC_LOCALE}/LC_MESSAGES/${FILENAME}.strings.po"
echo " dst: ${DST_LOCALE}.lproj/${FILENAME}.strings)"

#curl \
#	--silent \
#	-o "/tmp/${FILENAME}.strings.po" \
#	 "https://localize.mozilla.org/export/fxhome/${SRC_LOCALE}/LC_MESSAGES/${FILENAME}.strings.po"

wget \
        --no-check-certificate \
		-O "/tmp/${FILENAME}.strings.po" \
		https://localize.mozilla.org/${SRC_LOCALE}/fxhome/LC_MESSAGES/${FILENAME}.strings.po/download/ \
		|| exit 1

if [ ! -d "${DST_LOCALE}.lproj" ]; then
    mkdir "${DST_LOCALE}.lproj" \
	|| exit 1
fi

po2prop \
	-t "English.lproj/${FILENAME}.strings" \
	"/tmp/${FILENAME}.strings.po" \
	"${DST_LOCALE}.lproj/${FILENAME}.strings"

