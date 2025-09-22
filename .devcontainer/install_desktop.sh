#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive

# 빠른 미러/갱신
sudo apt-get -yq update

# JavaFX가 필요로 할 수 있는 기본 GUI 라이브러리
sudo apt-get -yq install \
  libgl1 libgtk-3-0 libxext6 libxi6 libxtst6 xauth dbus-x11

# 최소 데스크톱(풀 XFCE 대신 경량 구성)
sudo apt-get -yq install \
  xfce4-panel xfce4-session xfce4-terminal xfdesktop4 thunar

# VNC/noVNC
sudo apt-get -yq install tigervnc-standalone-server novnc websockify

# VNC 초기 설정
mkdir -p /home/vscode/.vnc
echo "startxfce4" > /home/vscode/.vnc/xstartup
chmod +x /home/vscode/.vnc/xstartup
chown -R vscode:vscode /home/vscode/.vnc

# 정리
sudo apt-get -yq clean
