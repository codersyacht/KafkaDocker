#!/bin/sh
/home/admin/App/Kafka/bin/zookeeper-server-start.sh /home/admin/App/Kafka/config/zookeeper.properties > /home/admin/App/zookeeper.log & disown
sleep 10
/home/admin/App/Kafka/bin/kafka-server-start.sh /home/admin/App/Kafka/config/server.properties > /home/admin/App/server.log & disown
sleep 10
/home/admin/App/Kafka/bin/kafka-topics.sh --create --topic sampletopic --bootstrap-server localhost:9092 > /home/admin/App/createsampletopic.log & disown
sleep 10
tail -f /home/admin/App/server.log