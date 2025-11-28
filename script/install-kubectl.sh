#!/bin/bash

# Exit on error
set -e

# Error trap
trap 'echo "[ERROR] kubectl installation failed (line $LINENO)" >&2; exit 1' ERR

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64)
        KUBECTL_ARCH="amd64"
        ;;
    aarch64|arm64)
        KUBECTL_ARCH="arm64"
        ;;
    *)
        echo "[ERROR] Unsupported architecture: $ARCH" >&2
        exit 1
        ;;
esac

# Get latest stable version
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt 2>/dev/null || echo "[ERROR] Failed to fetch version info")

# Download kubectl
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${KUBECTL_ARCH}/kubectl" 2>/dev/null

# Set execute permission
chmod +x ./kubectl

# Move to /usr/bin
sudo mv ./kubectl /usr/bin/

# Create symbolic link (k -> kubectl)
sudo ln -sf /usr/bin/kubectl /usr/local/bin/k

# Verify installation
k version --client
