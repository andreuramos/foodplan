FROM elixir:latest

RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client git && \
    apt-get clean

ADD . /app

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new 1.7.14

# Install node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash - && nvm install 22

WORKDIR /app

RUN mix deps.get
RUN npm install --prefix ./assets

EXPOSE 4000

CMD ["/app/entrypoint.sh"]