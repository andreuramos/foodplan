FROM elixir:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix archive.install hex phx_new --force
RUN mix do compile

CMD ["iex"]