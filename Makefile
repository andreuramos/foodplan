build:
	@docker-compose build

server:
	@docker exec -it server bash

elixir:
	@docker exec -it server iex -S mix

database:
	@docker exec -it database psql -U postgres foodplan