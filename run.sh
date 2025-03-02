#!/bin/bash

SAMBA_USER="brett.watz"
SAMBA_PASSWORD="Obi1kenob!"

useradd -M $SAMBA_USER
echo -e "${SAMBA_PASSWORD}\n${SAMBA_PASSWORD}" | smbpasswd -sa "$SAMBA_USER"

# Start Avahi daemon
avahi-daemon --daemonize --no-drop-root

# Start Samba daemon
smbd --foreground --no-process-group
