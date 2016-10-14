KAFKA_VER=0.9.0.1
SCALA_VER=2.10
PKG_VER=${SCALA_VER}-${KAFKA_VER}
PKG_NAME=kafka_${PKG_VER}

sudo yum update -y # && sudo reboot
sudo yum install java-1.8.0-openjdk.x86_64 -y

#https://www.vultr.com/docs/how-to-install-apache-kafka-on-centos-7
echo "Downloading Kafka - ${PKG_NAME}, please wait..."
wget -q http://apache.hippo.nl/kafka/${KAFKA_VER}/${PKG_NAME}.tgz

echo "Download complete, finishing install"
tar -zxvf ${PKG_NAME}.tgz

cd ${PKG_NAME}

echo "host.name=kafka.dev" >> config/server.properties

bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/kafka-server-start.sh config/server.properties &



echo "Installation complete!"
