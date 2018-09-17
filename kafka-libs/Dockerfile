FROM fnproject/fn-java-fdk-build:jdk9-1.0.63
COPY kafka-clients-2.0.0.jar .
COPY settings.xml .
#deploy it to /function/repo. This location is referenced in <repository> in the pom.xml
RUN mkdir /root/.m2 && \
    if [ "$https_proxy" != "" ]; then mv settings.xml /root/.m2; fi 
RUN mvn deploy:deploy-file -Durl=file:///function/repo -Dfile=kafka-clients-2.0.0.jar -DgroupId=com.kafka -DartifactId=client -Dversion=2.0.0 -Dpackaging=jar
