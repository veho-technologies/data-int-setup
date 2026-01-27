.PHONY: help install check-deps init clean seed run test docker

help:
	@echo "dbt Interview Project - Makefile"
	@echo ""
	@echo "Available commands:"
	@echo "  make install    - Check if required dependencies are installed"
	@echo "  make check-deps - Check if required dependencies are installed"
	@echo "  make init       - Full bootstrap: create venv, install deps, seed database"
	@echo "  make docker     - Build and start Docker container with interactive shell"
	@echo "  make clean      - Clean SQLite directory and reset database (runs seed)"
	@echo "  make seed       - Run dbt seed to load data"
	@echo "  make run        - Run dbt models"
	@echo "  make test       - Run dbt tests"
	@echo "  make help       - Show this help message"

check-deps:
	@echo "Checking dependencies..."
	@command -v sqlite3 >/dev/null 2>&1 || { echo "sqlite3 not found. Install with: brew install sqlite3 (macOS) or apt-get install sqlite3 (Linux)"; exit 1; }
	@command -v uv >/dev/null 2>&1 || { echo "uv not found. Install with: curl -LsSf https://astral.sh/uv/install.sh | sh"; exit 1; }
	@echo "✓ All dependencies found"

install: check-deps
	@echo "Dependencies are installed."
	@echo "Run 'make init' to bootstrap the project"

init: check-deps
	@bin/start.sh --init
	@if [ ! -f /.dockerenv ] && [ -z "$$DOCKER_CONTAINER" ]; then \
		echo ""; \
		echo "Setup complete! Activate the virtual environment to use dbt:"; \
		echo "  source .venv/bin/activate"; \
	fi

clean:
	@if [ -f .venv/bin/activate ] && [ -z "$$VIRTUAL_ENV" ]; then . .venv/bin/activate; fi; \
	bin/start.sh

seed:
	@if [ -f .venv/bin/activate ] && [ -z "$$VIRTUAL_ENV" ]; then . .venv/bin/activate; fi; \
	dbt seed

run:
	@if [ -f .venv/bin/activate ] && [ -z "$$VIRTUAL_ENV" ]; then . .venv/bin/activate; fi; \
	dbt run

test:
	@if [ -f .venv/bin/activate ] && [ -z "$$VIRTUAL_ENV" ]; then . .venv/bin/activate; fi; \
	dbt test

docker:
	@docker-compose build dbt
	@docker-compose run --rm dbt
