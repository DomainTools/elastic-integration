#!make

.PHONY : help
help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST)

.PHONY : env
env: ## Create .env file from .env.template
	@if [ ! -f .env ]; then cp .env.example .env; echo '.env did not exist, created it from .env.example, please review and then re-run install'; exit; fi

.PHONY : install
install : env ## setup docker containers
	@docker-compose up -f docker-compose.customer.yml -d
