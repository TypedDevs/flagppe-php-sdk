run: ## Start the containers.
	U_ID=${UID} G_ID=${GID} docker-compose up -d
	$(MAKE) --no-print-directory composer install
	# $(MAKE) --no-print-directory composer env:dev
	# $(MAKE) --no-print-directory composer env:test

start: ## Start the containers and build them.
	$(MAKE) --no-print-directory build
	$(MAKE) --no-print-directory run

stop: ## Stop the containers.
	U_ID=${UID} G_ID=${GID} docker-compose stop

restart: ## Restart the containers.
	$(MAKE) --no-print-directory stop
	$(MAKE) --no-print-directory run

build: ## Rebuilds all the containers.
	test -f .env || cp -n .env.example .env
	mkdir -p docker/php/bash/
	touch docker/php/bash/.bash_history
	U_ID=${UID} G_ID=${GID} docker-compose build

down: ## Stop the containers, network and volumes.
	U_ID=${UID} G_ID=${GID} docker-compose down -v --remove-orphans

rebuild: ## Rebuild the containers.
	$(MAKE) --no-print-directory down
	$(MAKE) --no-print-directory start
