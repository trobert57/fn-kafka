FROM fnproject/fn-java-fdk-build:jdk9-1.0.63
RUN mkdir /root/.m2
COPY kafka-clients-2.0.0.jar .
COPY settings.xml /root/.m2/
#deploy it to /function/repo. This location is referenced in <repository> in the pom.xml
RUN mvn deploy:deploy-file -Durl=file:///function/repo -Dfile=kafka-clients-2.0.0.jar -DgroupId=com.kafka -DartifactId=client -Dversion=2.0.0 -Dpackaging=jar
