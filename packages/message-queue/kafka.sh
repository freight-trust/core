# Set Kafka lugin
if [[ ! -z "${PPLUS_KAFKA_ENABLED}" ]]; then
    cmd="${cmd} \
--plugin-kafka-enabled \
--plugin-kafka-stream=${PPLUS_KAFKA_STREAM} \
--plugin-kafka-url=${PPLUS_KAFKA_URL} \
--plugin-kafka-producer-property=bootstrap.servers=${PPLUS_KAFKA_URL} \
--plugin-kafka-producer-property=ssl.endpoint.identification.algorithm=https \
--plugin-kafka-producer-property=sasl.mechanism=PLAIN \
--plugin-kafka-producer-property=request.timeout.ms=20000 \
--plugin-kafka-producer-property=retry.backoff.ms=500 \
--plugin-kafka-producer-property=\"sasl.jaas.config=org.apache.kafka.utils.security.plain.PlainLoginModule required username=${PPLUS_KAFKA_USERNAME} password=${PPLUS_KAFKA_PASSWORD};\" \
--plugin-kafka-producer-property=security.protocol=SASL_SSL
"
fi