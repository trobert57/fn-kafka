# fn-kafka
Demo function to send data from fn to kafka (=> send).  
Sending data from kafka to fn (=> get) is not yet implemented.  
The directory "kafka-libs" contains a Dockerfile to build a docker image with a single kafka node.   
This docker image is not really required for the demo. If you do have an existing kafka cluster running (like Oracle Event Hub),
you can simply update the KAFKA_BROKERS config variable (see updateConfig.sh) to point to your existing kafka brokers.  
  
To build, first clone this project to your environment. Then run create-app.sh. This will create a fn application either locally or on the fn cloud service. The config variables KAFKA_BROKERS and TOPIC_NAME can be adjusted later on (updateConfig.sh).  
The next step is to create the function within that application:  
  cd into the "send" subdirectory and call "fn deploy --app fn-kafka-app --local". 
Now modify "updateConfig.sh" so that KAFKA_BROKERS points to the kafka brokers of your cluster and TOPIC_NAME is the name of the topic you want to send your data to. If you leave the kafka default of auto create topics than the topic will be created automatically, if not already available.   
Attach a kafka-console-consumer to your kafka cluster, listening on the topic name you are sending your data to.  
The script testfn.sh shows how to send data to the function (either using fn init or curl). That data should then show up on the output of the kafka-console-consumer.
