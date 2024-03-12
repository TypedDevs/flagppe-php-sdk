PRE_COMMIT_SCRIPTS_FILE=./scripts/pre-commit

pre-commit/install: ## Pre-commit install.
	@echo "Installing pre-commit hooks"
	cp $(PRE_COMMIT_SCRIPTS_FILE) ./.git/hooks/

pre-commit/run: ## Pre-commit actions.
	@echo "Running pre-commit hooks"
	$(MAKE) --no-print-directory pre-commit/composer pre-commit


pre-commit/composer: ## Use composer command without flags like --dev or others and not a tty.
	U_ID=${UID} G_ID=${GID} docker exec --user ${UID} -i ${PHP_SERVER_NAME} composer $(filter-out $@,$(MAKECMDGOALS))
