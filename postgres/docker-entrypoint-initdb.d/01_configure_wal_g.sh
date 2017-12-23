#!/bin/bash

if grep -q 'wal-g' $PGDATA/postgresql.conf; then
  echo "wal-g already configured"
  exit
fi

cat <<EOF >> $PGDATA/postgresql.conf
wal_level = archive
archive_mode = on
archive_command = 'set-walg-env wal-g wal-push %p'
archive_timeout = 60
wal_keep_segments = 32
EOF
