#fn use ctx workshop
#fn create app fn-kafka-app --annotation oracle.com/oci/subnetIds='["ocid1.subnet.oc1.iad.aaaaaaaaxrpre3meci53mgajfa6q45jvq2ffkeq763sq7qyhjlppnwrujcqa"]' --config KAFKA_BROKERS=localhost:9092O --config TOPIC_NAME=fntopic fn-kafka-app
fn create app fn-kafka-app --config KAFKA_BROKERS=172.17.0.2:9092 --config TOPIC_NAME=fntopic fn-kafka-app
