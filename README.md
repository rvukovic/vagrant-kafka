Vagrant Apache Kafka
====================

These scripts will quickly allow you to setup a single node [Kafka](http://kafka.apache.org) server using Vagrant. To get started simply:

```
$ git clone https://github.com/rvukovic/vagrant-kafka
$ cd vagrant-kafka
$ vagrant up
```

The Kafka server will be listening on `192.168.33.10` port `9092`.

https://kafka.apache.org/documentation

Test Kafka
====================
$ vagrant ssh
$ cd kafka_2.11-0.10.0.1

creating test topic
$ bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test


listing if the topic exist
$ bin/kafka-topics.sh --list --zookeeper localhost:2181

create some message - using the IP is important. puting localhost like in other examples will not work
$ bin/kafka-console-producer.sh --broker-list 192.168.33.10:9092 --topic test

check if we got something
$ bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning