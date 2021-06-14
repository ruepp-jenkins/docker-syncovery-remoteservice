#!/bin/bash

# initialize trap to forceful stop the bot
trap terminator SIGHUP SIGINT SIGQUIT SIGTERM
function terminator() {
  echo
  echo "Stopping Syncovery RemoteService $child..."
  kill -TERM "$child" 2>/dev/null
  stop
  echo "Exiting."
}

function stop() {
  /syncovery/SyncoveryRS stop
}

function start() {
  echo "OS Date: $(date)"
  touch /logs/RemoteService.log

  echo "Starting Syncovery RemoteService"
  /syncovery/SyncoveryRS start >> /logs/RemoteService.log &
}

start
tail -f /logs/RemoteService.log &

child=$!
wait "$child"