Vagrant Apache Kafka
====================

These scripts will quickly allow you to setup a single node [Kafka](http://kafka.apache.org) server using Vagrant. 

* CentOS 7.2
* Kafka 0.10.0.1
* java-1.8.0-openjdk.x86_64

To get started simply:
```
$ git clone https://github.com/rvukovic/vagrant-kafka
$ cd vagrant-kafka
$ vagrant plugin install vagrant-hostsupdater
$ vagrant up
```

The Kafka server will be listening on `192.168.33.10` port `9092`.

https://kafka.apache.org/documentation containes more documentation

Test Kafka
====================
Connect ot vagrant machine
```
$ vagrant ssh
$ cd kafka_2.11-0.10.0.1
```
Creating **test** topic
```
$ bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```

List if the **test** topic exist
```
$ bin/kafka-topics.sh --list --zookeeper localhost:2181
```
The following two commands can be started in separate console windows and then you can send messages from one windows to another. 
Create some message. Puting **localhost** like in other examples will not work
```
$ bin/kafka-console-producer.sh --broker-list kafka.dev:9092 --topic test
```
Check if we got something. 
```
$ bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
```

Testing from the host machine
====================
```
$ telnet 192.168.33.10 9092
Trying 192.168.33.10...
Connected to 192.168.33.10.
Escape character is '^]'.
```


Python setup
====================
```
$ curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
$ sudo python get-pip.py


$ sudo pip install kafka-python
```