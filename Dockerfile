FROM openjdk:8u212-jre-alpine

LABEL maintainer digicoder@gmail.com

RUN addgroup -g 1000 minecraft \
  && adduser -Ss /bin/sh -u 1000 -G minecraft -h /opt/minecraft minecraft \
  && mkdir /opt/minecraft/data /opt/minecraft/config

ENV MEMORY "1G"

WORKDIR /opt/minecraft
COPY workspace/* ./
RUN chown -R minecraft:minecraft /opt/minecraft/data /opt/minecraft/config /opt/minecraft

COPY server.properties /tmp/server.properties

WORKDIR /opt/minecraft/data
VOLUME ["/opt/minecraft/data", "/opt/minecraft/config"]
USER minecraft
ENTRYPOINT [ "/opt/minecraft/start.sh" ]