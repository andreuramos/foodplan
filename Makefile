build:
	@docker-compose build

elixir:
	@docker run --rm -it -v $(pwd):/app -w /app elixir:latest sh