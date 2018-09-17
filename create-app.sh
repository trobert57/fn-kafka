# Use this file to configure the fn application to connect to the appropriate kafka cluster
# The first example uses an Oracle Cloud Serverless instance of fn 
#fn create app fn-kafka-app --annotation oracle.com/oci/subnetIds='["ocid1.subnet.oc1.iad.<oci-id>"]' --config KAFKA_BROKERS=<oehcs ip>:6667 --config TOPIC_NAME=oehcstopic fn-kafka-app
# The second example uses a local fn server an connects to a kafka single-node "cluster" running within a docker container (172.17.0.2)
fn create app fn-kafka-app --config KAFKA_BROKERS=172.17.0.2:9092 --config TOPIC_NAME=fntopic fn-kafka-app
