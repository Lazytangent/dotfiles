#!/usr/bin/env bash

declare -A directions=(
  [west]=1 [east]=1 [north]=1 [south]=1
)

if which yabai >/dev/null; then
  if [[ -n "${directions[$1]}" ]]; then
    yabai -m window --focus "$1" || yabai -m display --focus "$1"
  fi
fi
