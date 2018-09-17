# fn-kafka
Demo function to send data from fn to kafka (=> send).
Sending data from kafka to fn (=> get) is not yet implemented
The directory "kafka-libs" contains a Dockerfile to build a docker image with a single kafka node. 
This docker image is not really required for the demo. If you do have an existing kafka cluster running (like Oracle Event Hub),
you can simply update the KAFKA_BROKERS config variable (see updateConfig.sh) to point to your existing kafka brokers.
