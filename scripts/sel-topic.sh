#!/bin/sh
# Convenience call to kafkacat
# Read all topics from the given environment and print them sorted lexicographically as export statements
# for environment variable CC_TOPIC
# useful in combination with kcca and kcc which use the variable
echo "List topics ..."
kctopics | awk '{print "export CC_TOPIC="$1}'
