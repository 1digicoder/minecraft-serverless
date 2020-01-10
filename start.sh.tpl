#!/bin/sh

if [ ! -e eula.txt ]; then
  if [ "$EULA" != "true" ]; then
    echo ""
    echo "Please accept the Minecraft EULA at"
    echo "  https://account.mojang.com/documents/minecraft_eula"
    echo "by adding the following immediately after 'docker run':"
    echo "  -e EULA=TRUE"
    echo ""
    exit 1
  fi
  echo "# $(date)" > eula.txt
  echo "eula=true" >> eula.txt
fi

java -Xms${MEMORY} -Xmx${MEMORY} -jar ../minecraft_server.__VERSION__.jar 
