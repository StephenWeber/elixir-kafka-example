
FROM elixir:1.13 as build
ENV MIX_HOME=/opt/mix
RUN mix local.hex --force
RUN mix local.rebar --force

COPY . .

# RUN export MIX_ENV=prod && \
#     mix deps.get, deps.compile && \
#     mix release