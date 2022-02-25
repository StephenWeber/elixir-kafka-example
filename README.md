# Elixir Kafka Example

This is a toy program that runs two Elixir services: a Kakfa producer and a Kafka consumer, connected through the same topic.

## Running the example

This example uses Docker Compose toolchain.

`docker-compose up` should build the local images, pull down public images, and start the systems.

You should see the producer put messages on the topic, and the consumer take messages off the topic.

