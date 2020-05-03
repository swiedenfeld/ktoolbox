#!/bin/sh
# Convenience call to kafkacat
# Read all topics from the given environment and print them sorted lexicographically
kafkacat -b $CC_BOOTSTRAP_SERVERS \
	      -X sasl.username=$CC_APIKEY \
        -X sasl.password=$CC_SECRET \
        -X sasl.mechanisms=PLAIN \
        -X security.protocol=SASL_SSL \
        -L | grep "topic.*with" | awk '{print $2;}' | sed s/\"//g | sort
