#!/bin/sh
set -eu

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
  echo "Usage: ./progress.sh <module_number> <status> <exercises_passed> [notes]" >&2
  exit 2
fi

module=$1
status=$2
passed=$3
notes=${4:-}
timestamp=$(date -u '+%Y-%m-%d %H:%M:%S UTC')
printf '| %s | %s | %s | %s | %s |\n' "$timestamp" "$module" "$status" "$passed" "$notes" >> progress.md

completed=$(awk -F '|' 'tolower($4) ~ /^[[:space:]]*complete(d)?[[:space:]]*$/ { n++ } END { print n+0 }' progress.md)
total_passed=$(awk -F '|' 'NR > 9 && $5 ~ /^[[:space:]]*[0-9]+[[:space:]]*$/ { sum += $5 } END { print sum+0 }' progress.md)
today=$(date -u '+%Y-%m-%d')
streak=$(awk -F '|' -v today="$today" '$2 ~ today { found=1 } END { print found ? 1 : 0 }' progress.md)
tmp=$(mktemp "${TMPDIR:-/tmp}/x86-progress.XXXXXX")
awk -v summary="| $completed | $total_passed | $streak day(s) |" 'NR == 5 { print summary; next } { print }' progress.md > "$tmp"
mv "$tmp" progress.md
echo "Progress recorded in progress.md"
