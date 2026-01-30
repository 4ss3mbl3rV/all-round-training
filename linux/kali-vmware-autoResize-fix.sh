#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
else
  bash -c 'echo "# tmp-debian-bookworm" > /etc/apt/sources.list.d/tmp-debian-bookworm.list \
  && echo "deb http://deb.debian.org/debian bookworm main contrib non-free" >> /etc/apt/sources.list.d/tmp-debian-bookworm.list' \
  && apt update \
  && apt install -y xserver-xorg-video-vmware \
  && rm /etc/apt/sources.list.d/tmp-debian-bookworm.list \
  && apt update
fi
