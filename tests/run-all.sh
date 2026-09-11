#!/bin/sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
failed=0
for test_script in "$root"/src/*/test.sh; do
  printf '%s\n' "==> ${test_script#"$root"/}"
  if ! "$test_script" solution; then
    failed=1
  fi
done
exit "$failed"
