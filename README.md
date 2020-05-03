# ktoolbox

This project is my toolbox for development with Apache Confluent/Kafka.

## Customized kafkacat image
The image is built upon kafkacat:1.5.0 image by author Magnus Edenhill. Please see [kafkacat DockerHub](https://hub.docker.com/layers/edenhill/kafkacat/1.5.0/images/sha256-05daf8af237495df2bc726427e421d101072cf2d2306fb2379243acbffe40823?context=explore)
and the [kafkacat project page](https://github.com/edenhill/kafkacat) for further documentation of kafkacat.


Some of its flags and switches relate to connection/environment and I do not want to type it over and over again each time I run a container. Thus, I add some shell scripts for the boilerplate and convenience. 

### Build
Build the image:

``docker build . -t swiedenfeld/kafkacat``
  
### Environment
The provided shell scripts know some environment variables. Thus, I recommend to create an env-file for each environment.
Copy the ``.env-template``, and fill in credentials and host names of the environment.

### Run
Run a container:

``docker run -it --env-file=.. swiedenfeld/kafkacat``

In the container you may want to do any of the following:

#### Select a topic

``sel-topic`` reads available topics from the environment and prints export statements for environment variable
``$CC_TOPIC``. Just copy and execute a line. Repeat this each time you need to change the topic.

#### Consume

After you have selected a topic:

``kcca`` consumes with AVRO. Example:
``kcca -o beginning``

or 

``kcc`` consumes without AVRO. Example:
``kcc -o beginning``

Please see kafkacat documentation for usage.

#### jq

I put ``jq`` into the image as well:

Example:
``kcca -Jeq -o beginning | jq -s``

Enjoy.
