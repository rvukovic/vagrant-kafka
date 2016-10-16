#!/usr/bin/env python3
import json, codecs
from kafka import KafkaConsumer, KafkaProducer

producer = KafkaProducer(bootstrap_servers='kafka.dev:9092')

with codecs.open('clicks_data.txt','rU','utf-8') as f:
    for line in f:
        jsdata=json.loads(line)
        jd = json.dumps(jsdata).encode('utf-8') #valid json?
        
        producer = KafkaProducer(bootstrap_servers='kafka.dev:9092')
        producer.send('clicks', jd)
        #print(jd)
    
# bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic clicks --from-beginning
