# Getting started

- Access the container shell
```bash
    docker-compose up -d
    docker exec -it kafka_broker_01 bash
```

- Run scripts inside of kafka broker to create topics

```bash
    chmod +x /usr/src/scripts/create_topics.sh
    sh ./create_topics.sh
```

- Bring down the container setup
```bash
    docker-compose down
```

## Example

```bash
    # create topic
    kafka-topics --create --topic order-received --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
   
    # verify topic exists
    kafka-topics --describe --topic order-received --bootstrap-server localhost:9092
   
    # update retention policy to 3 days
    kafka-configs --bootstrap-server localhost:9092 --alter --entity-type topics --entity-name order-received --add-config 'retention.ms=259200000'
```

- publishing to a topic

```bash
    # in the kafka contianer
    kafka-console-consumer --topic order-to-ship --from-beginning --bootstrap-server localhost:9092
    > {"id": "abc","name": "shipping confirmation","timestamp": "2021-11-25 00:01:59", "body": {"user_id": "123abc", "order_id": "lol098", "to_ship": true}}
```

- consuming messages from a topic

```bash
    # in the kafka container
    kafka-console-consumer --topic order-to-ship --from-beginning --bootstrap-server localhost:9092
```