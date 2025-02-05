# Create .env file if it does not exist
$(shell ./setup_env.sh 1>&2)

include .env
export

APP=app
COMPOSE=docker compose

default: up

mkdata:
	@mkdir -p data

deps: mkdata

clean:
	@sudo rm -r data/

up: deps
	@$(COMPOSE) up -d

pullup: deps
	@$(COMPOSE) up -d --pull always

recreate: deps
	@$(COMPOSE) up -d --force-recreate

restart: deps
	@$(COMPOSE) restart $(APP)

down: deps
	@$(COMPOSE) down

config:
	@$(COMPOSE) config

ps:
	@$(COMPOSE) ps

stats:
	@$(COMPOSE) stats

logs:
	@$(COMPOSE) logs -f --tail=100 $(APP)

attach:
	@${COMPOSE} exec $(APP) bash

attach-root:
	@${COMPOSE} exec --user root $(APP) bash
