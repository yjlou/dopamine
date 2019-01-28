#!/bin/bash

pass() {
  local msg="$1"

  echo -e "\033[0m[\033[37;42m PASS \e[0m] ${msg}"
}

warn() {
  local msg="$1"

  echo -e "\033[0m[\033[30;43m WARN \e[0m] ${msg}"
}

fail() {
  local msg="$1"

  echo -e "\033[0m[\033[37;41m FAIL \e[0m] ${msg}"
}

msgs=(  \
  "Perfect storm on the sun."  \
  'Make America Great Again!'  \
  'Google.com is still alive.'  \
  'You have got an email.'  \
  'Your friend sent a message to you.'  \
  'Power grid is still online.'  \
  'Whatever good point.'  \
)

while true; do
  num=${#msgs[@]}
  index=$((RANDOM % ${num}))

  random=$((RANDOM % 100))
  msg="${msgs[${index}]}"
  if [ "${random}" -lt 88 ]; then
    pass "${msg}"
  elif [ "${random}" -lt 98 ]; then
    warn "${msg}"
  else
    fail "${msg}"
  fi

  sleep 0.1
done
