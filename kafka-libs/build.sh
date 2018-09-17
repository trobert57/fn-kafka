#docker build -t oracle-kafka-docker .
# If running behind a proxy:
docker build --build-arg https_proxy=http://emea-proxy.uk.oracle.com:80 -t oracle-kafka-docker .
