POETRY := $(shell command -v poetry 2> /dev/null)

.DEFAULT_GOAL := help
PYMODULE:=src/app

.PHONY: help
help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo ""
	@echo " install-dev   install all the development dependencies"
	@echo " install-prod  install only the production dependencies"
	@echo " format        reformat code"
	@echo " lint          run the code linters"
	@echo " update        update the dependencies"
	@echo " bom           generate the bill of materials"
	@echo " req           export the requirements to a requirements.txt file"
	@echo " test          run all the tests"
	@echo " test-cov      run all the tests and show test coverage"
	@echo " clean         remove all temporary files"
	@echo ""
	@echo "Check the Makefile to know exactly what each target is doing."

.PHONY: install
install: 
	@if [ -z $(POETRY) ]; then echo "Poetry could not be found."; exit 2; fi
	$(POETRY) install --sync

.PHONY: format
format: $(INSTALL_STAMP)
	$(POETRY) run isort --settings-path pyproject.toml src
	$(POETRY) run isort --settings-path pyproject.toml tests
	$(POETRY) run black --config ./pyproject.toml src
	$(POETRY) run black --config ./pyproject.toml tests
	$(POETRY) run autoflake --recursive src
	$(POETRY) run autoflake --recursive tests

.PHONY: lint
lint: $(INSTALL_STAMP)
	$(POETRY) run flake8 --config pyproject.toml src
	$(POETRY) run flake8 --config pyproject.toml tests
	$(POETRY) run mypy --config-file pyproject.toml src
	$(POETRY) run mypy --config-file pyproject.toml tests
	$(POETRY) run pylint --rcfile pyproject.toml src
	$(POETRY) run pylint --rcfile pyproject.toml tests

.PHONY: bom
bom: $(INSTALL_STAMP)
	$(POETRY) run cyclonedx-py -p --format json -F -o requirements/bom/bom.json
	$(POETRY) run cyclonedx-py -p --format xml -F -o requirements/bom/bom.xml

.PHONY: requirements
requirements: $(INSTALL_STAMP)
	$(POETRY) export --format requirements.txt > requirements/pip/requirements.txt
	echo "-r requirements.txt" > requirements/pip/requirements-dev.txt
	$(POETRY) export --with dev --format requirements.txt >> requirements/pip/requirements-dev.txt

.PHONY: update
update: $(INSTALL_STAMP)
	$(POETRY) self update 
	$(POETRY) update
	$(POETRY) export 
.PHONY: test
test: $(INSTALL_STAMP)
	pytest 

.PHONY: test-cov
test-cov: $(INSTALL_STAMP)
	pytest --cov=src/app --cov-report term

clean:
	rm -rf .venv
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .coverage