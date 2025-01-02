#!/bin/sh

# Set your github username and repo name
repo="ggerganov/llama.cpp"

# Get latest release info
release=$(curl --silent -m 10 --connect-timeout 5 "https://api.github.com/repos/$repo/releases/latest")

# Release version
tag=$(echo "$release" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

echo $tag
sed -i "6s/pkgver=.*/pkgver=$tag/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO
