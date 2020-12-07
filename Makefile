.PHONY: help

help: ## help
	@echo "Makefile for managing development environment:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

requirements:  ## make requirements file
	pip-compile --output-file=requirements.txt requirements.in

install:  ## install requirements file
	pip install -r requirements.txt

test:  ## test
	pytest

test-cov:  ## run coverage with pytest
	pytest --cov app
