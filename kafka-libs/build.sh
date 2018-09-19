#docker build -t oracle-kafka-docker .
# If running behind a proxy:
docker build --build-arg https_proxy=http://<your-proxy-server>:<your-proxy-port> -t fn-kafka-docker .
