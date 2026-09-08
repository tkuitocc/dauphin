#!/bin/sh

set -eu

: "${AES256KEY:?Set AES256KEY in the Xcode Cloud workflow environment}"
: "${AES256IV:?Set AES256IV in the Xcode Cloud workflow environment}"

script_directory="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
template_path="${script_directory}/../dauphin/api.example.plist"
output_path="${script_directory}/../dauphin/api.plist"
temporary_path="$(mktemp "${output_path}.XXXXXX")"

cleanup() {
    rm -f "$temporary_path"
}
trap cleanup EXIT HUP INT TERM

cp "$template_path" "$temporary_path"
/usr/bin/plutil -replace AES.KEY -string "$AES256KEY" "$temporary_path"
/usr/bin/plutil -replace AES.IV -string "$AES256IV" "$temporary_path"
/usr/bin/plutil -lint "$temporary_path"
mv "$temporary_path" "$output_path"
trap - EXIT HUP INT TERM

echo "Generated dauphin/api.plist for the Xcode Cloud build."
