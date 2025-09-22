#!/usr/bin/env bash
set -e
vncserver -kill :1 || true
pkill -f novnc_proxy || true
echo "Stopped VNC & noVNC."
