#!/bin/bash

# initialize trap to forceful stop the bot
trap terminator SIGHUP SIGINT SIGQUIT SIGTERM
function terminator() {
  echo
  echo "Stopping SyncoveryRS $child..."
  kill -TERM "$child" 2>/dev/null
  stop
  echo "Exiting."
}

function stop() {
  kill "$child"
}

function start() {
  echo "OS Date: $(date)"
  mkdir -p ${SYNCOVERY_HOME}/.Syncovery

  echo "Starting RemoteService"
  /syncovery/SyncoveryRS >> ${SYNCOVERY_HOME}/RS.log &
}

start
tail -f ${SYNCOVERY_HOME}/RS.log &

child=$!
wait "$child"
