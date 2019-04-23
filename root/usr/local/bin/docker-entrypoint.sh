#!/bin/sh
# /usr/local/bin/docker-entrypoint.sh

set -e

if [ ! $(id -u $PUSER) == $PUID ]; then
	usermod -u $PUID $PUSER
fi

if [ ! $(id -g $PUSER) == $PGID ]; then
	groupmod -g $PGID $PGROUP
fi

chown -R $PUSER:$PGROUP "$FLOOD_DIR"
chown $PUSER:$PGROUP /config/

exec su-exec $PUSER:$PGROUP "$@"
