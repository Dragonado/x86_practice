#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

target=${1:-starter}
case "$target" in starter|solution) ;; *) echo "target must be starter or solution" >&2; exit 2;; esac
make -C "$script_dir" "$target" >/dev/null
actual=$("$script_dir/$target")
expected="mode: x86-64"
if [ "$actual" != "$expected" ]; then
  echo "FAIL: 16-x86-64" >&2
  echo "expected: $expected" >&2
  echo "actual:   $actual" >&2
  exit 1
fi
echo "PASS: 16-x86-64 ($target)"
