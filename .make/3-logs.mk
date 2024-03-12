logs: ## Tails all logs.
	U_ID=${UID} G_ID=${GID} docker-compose logs -f --tail="all" ${PHP_SERVER_NAME}
