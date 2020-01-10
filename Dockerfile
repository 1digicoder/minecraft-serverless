FROM openjdk:8-jre-alpine

LABEL maintainer digicoder@gmail.com

RUN addgroup minecraft \
  && adduser -Ss /bin/sh -G minecraft -h /opt/minecraft minecraft \
  && mkdir /opt/minecraft/data /opt/minecraft/config \
  && apk add screen

WORKDIR /opt/minecraft
COPY ./workspace/* ./
RUN chown -R minecraft:minecraft /opt/minecraft/data /opt/minecraft/config /opt/minecraft

COPY server.properties /tmp/server.properties

WORKDIR /opt/minecraft/data
VOLUME ["/opt/minecraft/data", "/opt/minecraft/config"]
USER minecraft
ENTRYPOINT [ "screen", "-dmS", "minecraft", "/opt/minecraft/start.sh" ]