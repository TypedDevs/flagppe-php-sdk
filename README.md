# Flagppe PHP SDK

## Prerequisites

All project requirements like PHP are dockerized. So, you only need the following requirements to work on the project.

* Docker
* Docker Compose
* Make

## Installation

To start working with this project, you just need to execute `make build` the first time. For subsequent sessions, you
can run `make start` to begin working.

If at any time you want to rebuild the instances from scratch, you can execute `make rebuild`.

## Pre-commit

To ensure that the project's pipelines pass successfully, it's advisable to run certain commands before each commit.
You can automate this process by executing `make pre-commit/install`.

## Useful commands
Below is a list of useful commands for working with the project. You can see a complete list of these commands by typing
`make` and checking the scripts section of the `composer.json` file.

* `make shell`: Interactive shell into the PHP container.
* `make composer`: Use any composer commands like `make composer test:all` or `make composer pre-commit`.

## Versions

Below are listed some versions of the different software requirements that the project has. For more details, you can
check the `docker-compose.yml` or the `composer.json` files.

* PHP 8.3
