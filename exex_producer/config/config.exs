import Config

config :kaffe,
producer: [
  endpoints: [kafka: 9092],
  topics: ["price", "spread"],
]
