import Config

config :kaffe, consumer: [
  endpoints: [kafka: 9092],
  topics: ["price"],     # the topic(s) that will be consumed
  consumer_group: "price-consumer-group",   # the consumer group for tracking offsets in Kafka
  message_handler: ExexPriceConsumer,           # the module that will process messages
]
