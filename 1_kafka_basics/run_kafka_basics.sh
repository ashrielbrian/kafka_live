#!/bin/sh
# spins up a single broker, single partition kafka broker with zookeeper
docker-compose up -d
docker exec -it kafka_broker_01 bash

kafka-topics --create --topic order-received --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
kafka-topics --describe --topic order-received --bootstrap-server localhost:9092
# update retention policy to 3 days
kafka-configs --bootstrap-server localhost:9092 --alter --entity-type topics --entity-name order-received --add-config 'retention.ms=259200000'

