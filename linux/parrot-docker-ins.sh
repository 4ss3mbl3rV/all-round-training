#!/bin/bash

# Docker Installation Script for Debian (Bookworm)

set -e # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions for displaying messages
info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    error "This script must be run as root"
    echo "Please run: sudo $0"
    exit 1
fi

echo "=========================================="
echo "   Docker Installation Script"
echo "=========================================="
echo

# Remove existing Docker repository if it exists
info "Removing old Docker repository (if exists)..."
rm -f /etc/apt/sources.list.d/docker.list

# Update package list
info "Updating package list..."
apt update -qq

# Create keyrings directory
info "Setting up keyrings directory..."
install -m 0755 -d /etc/apt/keyrings

# Download Docker GPG key
info "Downloading Docker GPG key..."
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
info "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian bookworm stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list with new repository
info "Updating package list with Docker repository..."
apt update -qq

# Install Docker packages
info "Installing Docker packages..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo
echo "=========================================="
info "Docker installation completed successfully!"
echo "=========================================="
echo
info "Run 'docker --version' to verify the installation"
