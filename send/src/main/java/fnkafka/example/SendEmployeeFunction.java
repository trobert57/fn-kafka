package fnkafka.example;

import java.util.Properties;
import java.util.concurrent.ExecutionException;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.apache.kafka.common.serialization.LongSerializer;
import org.apache.kafka.common.serialization.StringSerializer;

public class SendEmployeeFunction {

    private Producer<Long, String> producer = null;
    private Integer msgCount = 10;
    private String topicName = "";

    public SendEmployeeFunction() {
        try {
            producer = createProducer();
        } catch (Throwable e) {
            System.err.println("Unable to connect to Kafka - " + e.getMessage());
            e.printStackTrace();
        }
    }

    public Producer<Long, String> createProducer() {
        String kafkaBrokers = System.getenv().getOrDefault("KAFKA_BROKERS", "localhost:9092");
        String clientId="client1";
        topicName=System.getenv().getOrDefault("TOPIC_NAME", "fntopic");
        String groupId="consumerGroup1";
        Integer maxNoMsgCount=100;
        String offsetResetLatest="latest";
        String offsetResetEarlier="earliest";
        Integer maxPollRecord=1;

        System.err.println("Connecting to Kafka ...");
        System.err.println("Brokers " + kafkaBrokers);
        System.err.println("Topic " + topicName);

        Properties props = new Properties();

        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, kafkaBrokers);
        props.put(ProducerConfig.CLIENT_ID_CONFIG, clientId);
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, LongSerializer.class.getName());
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        System.err.println("Creating KafkaProducer");
        Producer<Long, String> producer = new KafkaProducer<>(props);
        System.err.println("Created KafkaProducer");
        return new KafkaProducer<>(props);
    }


    public String handle(SendEmployeeInfo empInfo) {
        return create(empInfo);
    }

    private String create(SendEmployeeInfo empInfo) {
      String status = "Failed to send message " + empInfo;
      try {
        if (producer == null) {
            return "Producer is null. " + status;
        }

        System.err.println("Sending employee info to Kafka " + empInfo);
        String employee = empInfo.getEmp_email() + " " + empInfo.getEmp_name() + " " + empInfo.getEmp_dept();

//        for (int index = 0; index < msgCount; index++) {
//            st.setString(1, empInfo.getEmp_email());
//            st.setString(2, empInfo.getEmp_name());
//            st.setString(3, empInfo.getEmp_dept());

        ProducerRecord<Long, String> record = new ProducerRecord<Long, String>(topicName, employee);
        try {
            RecordMetadata metadata = producer.send(record).get();
            System.out.println("Record sent with key to partition " + metadata.partition()
                       + " with offset " + metadata.offset());
        } catch (ExecutionException e) {
            System.out.println("Error in sending record");
            System.out.println(e);
        } catch (InterruptedException e) {
            System.out.println("Error in sending record");
            System.out.println(e);
        }
//        }


        status = "Created employee " + empInfo;

      } catch (Exception se) {
            System.err.println("Unable to send data to Kafka due to - " + se.getMessage());
      }

      return status;
    }

}
