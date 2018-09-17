# Use Kafka running on host
#fn update app fn-kafka-app --config KAFKA_BROKERS=kafkahost:9092 --config TOPIC_NAME=fntopic
# Use Kafka running in Docker container.
# Look for advertised hosts output for IP address
#fn update app fn-kafka-app --config KAFKA_BROKERS=172.17.0.2:9092 --config TOPIC_NAME=fntopic
#fn update app fn-kafka-app --config KAFKA_BROKERS=172.17.0.3:9092 --config TOPIC_NAME=fntopic
# Use Kafka running on Oracle Event Hub
#fn update app fn-kafka-app --config KAFKA_BROKERS=<oehcs ip>:6667 --config TOPIC_NAME=oehcTopic
# Use Kafka running on Oracle Event Hub from FN Cloud Service
fn update app fn-kafka-app --annotation oracle.com/oci/subnetIds='["ocid1.subnet.oc1.iad.<oci-id>"]' --config KAFKA_BROKERS=<oehcs ip>:6667 --config TOPIC_NAME=oehcTopic 
fn ls config a fn-kafka-app
