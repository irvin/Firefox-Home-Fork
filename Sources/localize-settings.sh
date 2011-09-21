#!/bin/sh

localize() {
	SRC_LOCALE=$1
	DST_LOCALE=$2

	echo "Localizing Settings.strings (${SRC_LOCALE} -> ${DST_LOCALE})"
	echo "    src: .../${SRC_LOCALE}/LC_MESSAGES/Settings.strings.po"
	echo "    dst: ${DST_LOCALE}.lproj/Root.strings)"

#	curl \
#		--silent \
#		-o "/tmp/Root.strings.po" \
#		 "https://localize.mozilla.org/export/fxhome/${SRC_LOCALE}/LC_MESSAGES/Settings.strings.po" \
#		|| exit 1

    wget \
        --no-check-certificate \
		-O "/tmp/Root.strings.po" \
		https://localize.mozilla.org/${SRC_LOCALE}/fxhome/LC_MESSAGES/Settings.strings.po/download/ \
		|| exit 1

	if [ ! -d "Settings.bundle/${DST_LOCALE}.lproj" ]; then
		mkdir "Settings.bundle/${DST_LOCALE}.lproj" \
			|| exit 1
	fi

	po2prop \
		-t "Settings.bundle/English.lproj/Root.strings" \
		"/tmp/Root.strings.po" \
		"Settings.bundle/${DST_LOCALE}.lproj/Root.strings" \
		|| exit 1
}

localize ca ca
localize cs cs
localize de de
localize es es
localize fr fr
localize id id
localize it it
localize ja ja
localize ko ko
localize nl nl
localize pl pl
localize pt_BR pt
localize pt pt-PT
localize ru ru
localize th th
localize tr tr
localize zh_CN zh-Hans
localize zh_TW zh-Hant

