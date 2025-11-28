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
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl
