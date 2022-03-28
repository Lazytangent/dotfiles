#!/usr/bin/env bash

declare -A directions=(
  [west]=1 [east]=1 [north]=1 [south]=1
)

if which yabai >/dev/null; then
  if [[ -n "${directions[$1]}" ]]; then
    yabai -m window --swap "$1" || yabai -m window --display "$1"
  fi
fi
