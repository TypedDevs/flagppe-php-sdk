#!/bin/bash
-include .env
OS = $(shell uname)
UID = $(shell id -u)
GID = $(shell id -g)
NAMESERVER_IP = $(shell ip address | grep docker0)

ifeq ($(OS),Darwin)
	NAMESERVER_IP = host.docker.internal
else ifeq ($(NAMESERVER_IP),)
	NAMESERVER_IP = $(shell grep nameserver /etc/resolv.conf  | cut -d ' ' -f2)
else
	NAMESERVER_IP = 172.17.0.1 # replace this IP with your "docker0" one (run "ip a" in your terminal to check it)
endif

ifeq ($(OS),Windows_NT)
	# Windows requires the .exe extension, otherwise the entry is ignored
	# @see https://stackoverflow.com/a/60318554/413531
    SHELL := bash.exe
    # make sure that MinGW / MSYSY does not automatically convert paths starting with /
    # @see https://stackoverflow.com/a/48348531
    export MSYS_NO_PATHCONV=1
else
    SHELL := bash
endif

MAKEFLAGS += --no-builtin-rules

help: ## Show this help message.
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

-include .make/*.mk

shell: ## Interactive shell into the PHP container.
	U_ID=${UID} docker exec -it --user ${UID} ${PHP_SERVER_NAME} bash

%:
	@:
