FROM edenhill/kafkacat:1.5.0@sha256:05daf8af237495df2bc726427e421d101072cf2d2306fb2379243acbffe40823

COPY scripts/* /home/kafkacat/bin/

RUN addgroup -S kafkacat && adduser -S appuser -G kafkacat; \
    apk add jq ; \
    chmod +x /home/kafkacat/bin/*.sh; \
    ln -s /home/kafkacat/bin/kcca.sh /usr/local/bin/kcca; \
    ln -s /home/kafkacat/bin/kcc.sh /usr/local/bin/kcc; \
    ln -s /home/kafkacat/bin/sel-topic.sh /usr/local/bin/sel-topic; \
    ln -s /home/kafkacat/bin/kctopics.sh /usr/local/bin/kctopics;

USER kafkacat

ENTRYPOINT ["/bin/sh"]
