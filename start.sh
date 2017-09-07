#!/bin/bash

postfix -c /etc/postfix start

sleep 5

while true; do
  nc -z localhost 465
  ret=$?
  if [ $ret -eq 0 ]; then
    sleep 30
  else
    exit 100
  fi
done

