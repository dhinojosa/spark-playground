#!/bin/sh

mc alias set minio http://$MINIO_SERVER_HOST:9000 $MINIO_SERVER_ACCESS_KEY $MINIO_SERVER_SECRET_KEY

mc mb minio/heart
mc mb minio/cities
mc mb minio/iris
mc mb minio/kafka-checkpoint
mc mb minio/kafka-output
mc mb minio/stocks
mc mb minio/iot-telemetry-data

sleep 3

mc cp ./data/heart.csv minio/heart/heart.csv
mc cp ./data/iris.csv minio/iris/iris.csv
mc cp ./data/cities.csv minio/cities/cities.csv
mc cp ./data/stocks.csv minio/stocks/stocks.csv
mc cp ./data/iot-telemetry-data.csv minio/iot-telemetry-data/iot-telemetry-data.csv