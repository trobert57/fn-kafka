# fn-kafka
Demo function to send data from fn to kafka (=> send).  
Sending data from kafka to fn (=> get) is not yet implemented.  
The directory "kafka-libs" contains a Dockerfile to build a docker image with the required kafka client libraries.   
  
1. To build, first clone this project to your environment.  
2. Create the required docker image:  
   cd kafka-libs  
   If running behind a proxy, edit settings.xml with your proxy configuration  
   Edit build.sh and adjust values for http_proxy  
   Run ./build.sh to create the required docker image  
3. Run create-app.sh.  
   This will create a fn application either locally or on the fn cloud service. The config variables KAFKA_BROKERS and TOPIC_NAME can be adjusted later on (updateConfig.sh).  
4. Create the function within that application:  
  cd into the "send" subdirectory and call ./deploy.sh. 
5. Now modify "updateConfig.sh" so that KAFKA_BROKERS points to the kafka brokers of your cluster and TOPIC_NAME is the name of the topic you want to send your data to. If you leave the kafka default of auto create topics, then the topic will be created automatically, if not already available.   
6. Attach a kafka-console-consumer to your kafka cluster, listening on the topic name you are sending your data to.  
7. The script testfn.sh shows how to send data to the function (either using fn init or curl). That data should then show up on the output of the kafka-console-consumer.  
