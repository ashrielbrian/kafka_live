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