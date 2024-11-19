build:
	@docker-compose build

elixir:
	@docker exec -it server bash

database:
	@docker exec -it database psql -U postgres foodplan