#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
else
  apt update
  apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  chmod a+r /etc/apt/sources.list.d/docker.list
  apt update && apt install -y docker-ce docker-ce-cli containerd.io
  systemctl enable docker --now
  usermod -aG docker $USER
  newgrp docker
  echo "Finished Docker Installation!"
fi
