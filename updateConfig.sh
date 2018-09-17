# Use Kafka running on host
#fn update app fn-kafka-app --config KAFKA_BROKERS=kafkahost:9092 --config TOPIC_NAME=fntopic
# Use Kafka running in Docker container.
# Look for advertised hosts output for IP address
#fn update app fn-kafka-app --config KAFKA_BROKERS=172.17.0.2:9092 --config TOPIC_NAME=fntopic
#fn update app fn-kafka-app --config KAFKA_BROKERS=172.17.0.3:9092 --config TOPIC_NAME=fntopic
#fn update app fn-kafka-app --config KAFKA_BROKERS=172.17.0.2:9092 --config TOPIC_NAME=fntopic -syslog-url tcp://logs7.papertrailapp.com:36791
# Use Kafka running on Oracle Event Hub
#fn update app fn-kafka-app --config KAFKA_BROKERS=129.146.80.113:6667 --config TOPIC_NAME=oehcTopic
# Use Kafka running on Oracle Event Hub from FN Cloud Service
fn update app fn-kafka-app --annotation oracle.com/oci/subnetIds='["ocid1.subnet.oc1.iad.aaaaaaaaxrpre3meci53mgajfa6q45jvq2ffkeq763sq7qyhjlppnwrujcqa"]' --config KAFKA_BROKERS=129.146.80.113:6667 --config TOPIC_NAME=oehcTopic --syslog-url tcp://logs7.papertrailapp.com:36791
fn ls config a fn-kafka-app
