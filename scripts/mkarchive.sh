#!/bin/bash

PKGBUILD="PKGBUILD"

PKGVER=$(grep -E '^pkgver=' "$PKGBUILD" | cut -d= -f2)

if [[ -z "$PKGVER" ]]; then
  echo "[X] Error: pkgver not found in $PKGBUILD"
  exit 1
fi

echo "[+] Package version detected: $PKGVER"

# Create tarball from src/ folder 
TARBALL="calamares-settings-eiraos-$PKGVER.tar.gz"
tar -czvf "$TARBALL" -C src .

echo "[+] Tarball created: $TARBALL"

if command -v updpkgsums &> /dev/null; then
  updpkgsums
  echo "[+] Checksums updated"
else
  echo "[!] updpkgsums not installed"
  CHECKSUM=$(shasum -a 256 "$TARBALL" | awk '{print $1}')
  sed -i '' "s|^sha256sums=.*|sha256sums=('$CHECKSUM')|" "$PKGBUILD"
  echo "[+] sha256sum updated: $CHECKSUM"
fi
