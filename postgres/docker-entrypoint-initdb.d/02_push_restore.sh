#!/bin/bash

set -e

TOKEN="$PGDATA/WALGPUSH"

if [ ! -f "$TOKEN" ]; then
  set-walg-env wal-g backup-push "$PGDATA" >/dev/null
  touch "$TOKEN"
  echo "sucessfully pushed base backup"
fi
