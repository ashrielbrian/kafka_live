#!/bin/sh
# execution script to create topics;
# execute within the kafka container

BOOTSTRAP_SERVER=localhost:9092

declare -a topics
topics=(
    "order-received"
    "order-confirmed"
    "order-to-ship"
    "email-notification"
    "error-event"
)

for t in ${topics[@]}; do
    kafka-topics --create --topic $t --bootstrap-server $BOOTSTRAP_SERVER --partitions 1 --replication-factor 1
    kafka-topics --describe --topic $t --bootstrap-server $BOOTSTRAP_SERVER
    kafka-configs --bootstrap-server $BOOTSTRAP_SERVER --alter --entity-type topics --entity-name $t --add-config 'retention.ms=259200000'
done