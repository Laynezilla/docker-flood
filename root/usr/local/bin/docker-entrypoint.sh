#!/bin/sh
# /usr/local/bin/docker-entrypoint.sh

set -e

umask 0002

if [ ! $(id -u $PUSER) == $PUID ]; then
	usermod -u $PUID $PUSER
fi

if [ ! $(id -g $PUSER) == $PGID ]; then
	groupmod -g $PGID $PGROUP
fi

chown -R $PUSER:$PGROUP "$FLOOD_DIR"

if [ ! -e /v-card ]; then
	if [ -e /scripts/first-run.sh ]; then
		. /scripts/first-run.sh
	fi
	touch /v-card
fi

exec su-exec $PUSER:$PGROUP "$@"
