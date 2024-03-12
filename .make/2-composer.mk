prepare: ## Runs backend commands.
	$(MAKE) --no-print-directory composer-install

composer-install: ## Installs composer dependencies.
	U_ID=${UID} G_ID=${GID} docker exec --user ${UID} -it ${PHP_SERVER_NAME} composer install --no-scripts --no-interaction --optimize-autoloader

composer: ## Use composer commands without flags like --dev or others.
	U_ID=${UID} G_ID=${GID} docker exec --user ${UID} -it ${PHP_SERVER_NAME} composer $(filter-out $@,$(MAKECMDGOALS))

composer-args: ## Use composer commands with flags like --dev.
	U_ID=${UID} G_ID=${GID} docker exec --user ${UID} -it ${PHP_SERVER_NAME} composer $(ARGS)
