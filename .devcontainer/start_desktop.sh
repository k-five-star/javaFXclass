#!/usr/bin/env bash
set -e

export DISPLAY=:1
export VNC_PORT=5901
export NOVNC_PORT=6080

# 기존 프로세스 정리
if pgrep -x Xtigervnc >/dev/null 2>&1; then
  echo "Stopping existing VNC server..."
  pkill -x Xtigervnc || true
fi
if pgrep -f novnc_proxy >/dev/null 2>&1; then
  echo "Stopping existing noVNC..."
  pkill -f novnc_proxy || true
fi

# VNC 서버 시작 (무비번, 로컬 접속)
vncserver -kill :1 >/dev/null 2>&1 || true
vncserver :1 -geometry 1280x800 -localhost yes

# noVNC로 6080 포트 개방 (Codespaces가 프록시로 외부에 안전하게 노출)
# novnc_proxy 스크립트 위치는 배포판별로 다를 수 있으나, deb 패키지의 기본 경로는 아래.
NOVNC_UTIL="/usr/share/novnc/utils/novnc_proxy"
if [ ! -f "$NOVNC_UTIL" ]; then
  NOVNC_UTIL="/usr/share/novnc/utils/launch.sh"
fi

# 백그라운드로 구동
$NOVNC_UTIL --vnc localhost:${VNC_PORT} --listen ${NOVNC_PORT} >/tmp/novnc.log 2>&1 &

echo "noVNC is running on port ${NOVNC_PORT}. In Codespaces, check the 'Ports' tab → Open in Browser."
