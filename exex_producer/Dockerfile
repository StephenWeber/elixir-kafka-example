# build stage
FROM elixir:1.13 as build
ENV MIX_HOME=/opt/mix
RUN mix local.hex --force
RUN mix local.rebar --force

COPY . .

RUN export MIX_ENV=prod && \
    mix deps.get && \
    mix release

# Package release for prod use
FROM elixir:1.13

WORKDIR "/app"

# Only copy the final release from the build stage
COPY --from=build /_build/prod/rel/exex_producer ./

ENTRYPOINT ["/app/bin/exex_producer"]
CMD ["start"]