build:
	@docker-compose build

up:
	@sudo service postgresql stop
	@docker-compose up -d

# enter the server container to execute bash commands
server:
	@docker exec -it server bash

# enter the elixir console
elixir: 
	@docker exec -it server iex -S mix

# access database
database: 
	@docker exec -it database psql -U postgres foodplan