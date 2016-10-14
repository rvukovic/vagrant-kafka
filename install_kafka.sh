sudo yum update -y # && sudo reboot
sudo yum install java-1.8.0-openjdk.x86_64 -y

#https://www.vultr.com/docs/how-to-install-apache-kafka-on-centos-7
echo "Downloading Kafka, please wait..."
wget -q http://apache.hippo.nl/kafka/0.10.0.1/kafka_2.11-0.10.0.1.tgz

echo "Download complete, finishing install"
tar -zxvf kafka_2.11-0.10.0.1.tgz

cd kafka_2.11-0.10.0.1/
echo "host.name=192.168.33.10" >> config/server.properties

bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/kafka-server-start.sh config/server.properties &

echo "Installation complete!"
