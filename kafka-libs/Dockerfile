FROM fnproject/fn-java-fdk-build:jdk9-1.0.63
#temporary workaround to copy the oracle driver JAR
COPY kafka-clients-2.0.0.jar .
#deploy it to /function/repo. This location is referenced in <repository> in the pom.xml
RUN mvn deploy:deploy-file -Durl=file:///function/repo -Dfile=kafka-clients-2.0.0.jar -DgroupId=com.kafka -DartifactId=client -Dversion=2.0.0 -Dpackaging=jar
