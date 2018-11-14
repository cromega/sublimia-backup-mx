#!/bin/bash -e

tail_logs() {
  tail -f /var/log/maillog
}

rsyslogd
postfix -c /etc/postfix start

sleep 3
tail_logs &

while true; do
  nc -z localhost 25
  ret=$?
  if [ $ret -eq 0 ]; then
    sleep 30
  else
    exit 100
  fi
done

