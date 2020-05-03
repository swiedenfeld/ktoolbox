#!/bin/sh
# Convenience call to kafkacat with AVRO/Schema Registry support
# Before use, export environment variables;
# append further arguments to kafkacat at the end
kafkacat -b $CC_BOOTSTRAP_SERVERS \
	      -X sasl.username=$CC_APIKEY \
        -X sasl.password=$CC_SECRET \
        -X sasl.mechanisms=PLAIN \
        -X security.protocol=SASL_SSL \
        -C \
        -t $CC_TOPIC \
        -s avro \
        -r $CC_SCHEMA_REGISTRY_URL \
        $@
