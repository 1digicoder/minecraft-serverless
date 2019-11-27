#!/bin/bash

MANIFEST_URL=https://launchermeta.mojang.com/mc/game/version_manifest.json

if [ -z "${MC_VERSION}" ]; then
    MC_DL_VERSION=$(curl -s ${MANIFEST_URL} | jq -r '.latest.release' )
fi

echo "Checking [${MANIFEST_URL}] for version [${MC_DL_VERSION}]..."

MC_VERSION_MANIFEST_URL=$(curl -s ${MANIFEST_URL} | jq -r ".versions[] | select(.id==\"${MC_DL_VERSION}\").url")

echo "Checking ${MC_VERSION_MANIFEST_URL} for download url..."
MC_SERVER_URL=$(curl -s ${MC_VERSION_MANIFEST_URL} | jq -r '.downloads.server.url')

echo "Downloading server from [${MC_SERVER_URL}]..."
wget -O minecraft_${MC_DL_VERSION}_server.jar ${MC_SERVER_URL}