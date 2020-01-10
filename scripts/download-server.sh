#!/bin/bash

MANIFEST_URL=https://launchermeta.mojang.com/mc/game/version_manifest.json

if [ -z "${MINECRAFT_VERSION}" ]; then
    echo "Missing Variable, fetching latest..."
    MINECRAFT_VERSION=$(curl -s ${MANIFEST_URL} | jq -r '.latest.release' )
fi

echo "Checking [${MANIFEST_URL}] for version [${MINECRAFT_VERSION}]..."

MINECRAFT_VERSION_MANIFEST_URL=$(curl -s ${MANIFEST_URL} | jq -r ".versions[] | select(.id==\"${MINECRAFT_VERSION}\").url")

echo "Checking ${MINECRAFT_VERSION_MANIFEST_URL} for download url..."
MC_SERVER_URL=$(curl -s ${MINECRAFT_VERSION_MANIFEST_URL} | jq -r '.downloads.server.url')

echo "Downloading server from [${MC_SERVER_URL}]..."
wget -O ./workspace/${MINECRAFT_FILENAME} ${MC_SERVER_URL}