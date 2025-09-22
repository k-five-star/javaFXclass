#!/usr/bin/env bash
set -e

# 기본 패키지 업데이트
sudo apt-get update -y

# JavaFX 런타임이 필요로 하는 라이브러리들
sudo apt-get install -y \
  libgl1 \
  libgtk-3-0 \
  libxext6 \
  libxi6 \
  libxtst6 \
  xauth

# 경량 데스크톱 & VNC/noVNC
sudo apt-get install -y \
  xfce4 xfce4-terminal \
  tigervnc-standalone-server \
  novnc websockify

# VNC 초기 설정(비밀번호 없이 로컬만, noVNC 프록시 이용)
mkdir -p /home/vscode/.vnc
# Xfce 세션 설정
echo "startxfce4" > /home/vscode/.vnc/xstartup
chmod +x /home/vscode/.vnc/xstartup
chown -R vscode:vscode /home/vscode/.vnc

# 편의 스크립트 권한
chmod +x .devcontainer/start_desktop.sh
chmod +x .devcontainer/stop_desktop.sh
