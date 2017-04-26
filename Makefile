SHELL = /bin/bash

.DEFAULT_GOAL := help
# From http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Install dependencies
	mvn clean package

tests-unit: ## Run unit test
	mvn test

tests-pull-request: ## Run all tests required for pull request
	make tests-unit

tests-code-coverage: ## Run code coverage test
	mvn verify