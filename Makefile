build:
	@docker-compose build

elixir:
	@docker run -it -v $(pwd):/app elixir:latest sh