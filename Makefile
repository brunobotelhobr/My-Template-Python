POETRY := $(shell command -v poetry 2> /dev/null)

.DEFAULT_GOAL := help
PYMODULE:=src/app

.PHONY: help
help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo ""
	@echo " install-dev   install all the development dependencies"
	@echo " install-prod  install only the production dependencies"
	@echo " info          show the project information"
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

.PHONY: install-dev
install-prod: $(INSTALL_STAMP)
	@if [ -z $(POETRY) ]; then echo "Poetry could not be found."; exit 2; fi
	$(POETRY) install --without dev --sync

.PHONY: install-dev
install-dev: $(INSTALL_STAMP)
	@if [ -z $(POETRY) ]; then echo "Poetry could not be found."; exit 2; fi
	$(POETRY) shell
	$(POETRY) install --sync
	$(POETRY) run pre-commit install

.PHONY: info
info:
	$(POETRY) env info
	$(POETRY) check
	$(POETRY) show

.PHONY: format
format: $(INSTALL_STAMP)
	$(POETRY) run isort --settings-path pyproject.toml src
	$(POETRY) run isort --settings-path pyproject.toml tests
	$(POETRY) run black --config ./pyproject.toml src
	$(POETRY) run black --config ./pyproject.toml tests
	$(POETRY) run autoflake --recursive src
	$(POETRY) run autoflake --recursive tests

.PHONY: lint
lint: 
	$(POETRY) run flake8 --config pyproject.toml src
	$(POETRY) run flake8 --config pyproject.toml tests
	$(POETRY) run mypy --config-file pyproject.toml src
	$(POETRY) run mypy --config-file pyproject.toml tests
	$(POETRY) run pylint --rcfile pyproject.toml src
	$(POETRY) run pylint --rcfile pyproject.toml tests

.PHONY: bom
bom: 
	$(POETRY) run cyclonedx-py -p --format json -F -o requirements/bom/bom.json
	$(POETRY) run cyclonedx-py -p --format xml -F -o requirements/bom/bom.xml

.PHONY: requirements
requirements: 
	$(POETRY) export --format requirements.txt > requirements/pip/requirements.txt
	echo "-r requirements.txt" > requirements/pip/requirements-dev.txt
	$(POETRY) export --with dev --format requirements.txt >> requirements/pip/requirements-dev.txt

.PHONY: 
update: $(INSTALL_STAMP)
	$(POETRY) self update 
	$(POETRY) update
	$(POETRY) export 
.PHONY: test
test:
	pytest 

.PHONY: test-cov
test-cov: 
	pytest --cov=src/app --cov-report term

.PHONY: clean 
clean:
	rm -rf .venv
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .coverage