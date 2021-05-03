#!/bin/bash
docker run -d --add-host host.docker.internal:host-gateway --restart always -p 8086:8086 -v influxdb:/var/lib/influxdb --name influxdb influxdb:1.7
docker run -d --add-host host.docker.internal:host-gateway --restart always -p 27017:27017 -v mongodata:/data/db --name mongo mongo
docker run -d --restart always -p 3008:3008 --add-host host.docker.internal:host-gateway -v /dev:/dev --privileged --add-host host.docker.internal:host-gateway  --name LidarAPI yudhabhakti/lidarapi
docker run -d --restart always -p 8080:8080 --add-host host.docker.internal:host-gateway --name RTSP-Stream yudhabhakti/rtsp-stream-arm
docker run -d --restart always -p 80:80 --add-host host.docker.internal:host-gateway --name Dashboard yudhabhakti/dashboard
docker run -d --restart always -p 3009:3000 --name RTSP-Stream-WS yudhabhakti/rtsp-stream-ws
docker run -d --restart always -p 9100:9100 --add-host host.docker.internal:host-gateway --hostname cikatama --name node-exporter prom/node-exporter
docker run -d --restart always -p 9090:9090 -v /etc/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml --add-host host.docker.internal:host-gateway --name prometehus prom/prometheus
