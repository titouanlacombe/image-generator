COMPOSE=docker compose

default: up

deps:
	@mkdir -p data

build:
	@$(COMPOSE) build

up: deps
	@$(COMPOSE) up -d

rebuild: deps
	@$(COMPOSE) up -d --build

pullup: deps
	@$(COMPOSE) up -d --pull always

recreate: deps
	@$(COMPOSE) up -d --force-recreate

down:
	@$(COMPOSE) down

restart:
	@$(COMPOSE) restart

stats:
	@$(COMPOSE) stats

logs:
	@$(COMPOSE) logs -f --tail=100

attach:
	@${COMPOSE} exec app bash
