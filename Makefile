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
	@echo " upgrade       upgrade the dependencies"
	@echo " bom           generate the bill of materials"
	@echo " req           export the requirements to a requirements.txt file"
	@echo " test          run all the tests"
	@echo " test-cov      run all the tests and show test coverage"
	@echo " enable-hooks  enable the pre-commit hooks"
	@echo " disable-hooks disable the pre-commit hooks"
	@echo " project-meta  update the project metadata data, like version and name"
	@echo " build-pypi    build the package"
	@echo " pypi-token    set the pypi API token"
	@echo " publish-pypi  publish the package to pypi"
	@echo " docs-server   start the documentation server"
	@echo " docs-pub      publish the documentation to github pages"
	@echo " clean         remove all temporary files"
	@echo ""
	@echo "Check the Makefile to know exactly what each target is doing."

.PHONY: install-dev
install-prod: $(INSTALL_STAMP)
	@if [ -z $(POETRY) ]; then echo "Poetry could not be found."; exit 2; fi
	$(POETRY) install --without dev

.PHONY: install-dev
install-dev: $(INSTALL_STAMP)
	@if [ -z $(POETRY) ]; then echo "Poetry could not be found."; exit 2; fi
	$(POETRY) shell
	$(POETRY) install
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
	$(POETRY) run cyclonedx-py -p --format json -F -o meta/bom/bom.json
	$(POETRY) run cyclonedx-py -p --format xml -F -o meta/bom/bom.xml

.PHONY: req
req: 
	$(POETRY) export --format requirements.txt > meta/requirements/requirements.txt
	echo "-r requirements.txt" > meta/requirements/requirements-dev.txt
	$(POETRY) export --with dev --format requirements.txt >> meta/requirements/requirements-dev.txt

.PHONY: upgrade
upgrade: $(INSTALL_STAMP)
	$(POETRY) self update 
	$(POETRY) update
	$(POETRY) export 

.PHONY: test
test:
	$(POETRY) run pytest 

.PHONY: test-cov
test-cov: 
	$(POETRY) run pytest --cov=src/app --cov-report term

.PHONY: enable-hooks
enable-hooks: 
	$(POETRY) run pre-commit install

.PHONY: disable-hooks
disable-hooks: 
	$(POETRY) run pre-commit uninstall

.PHONY: project-meta 
project-meta:
	python scripts/update-project-properties.py 

.PHONY: build-pypi
build-pypi: 
	$(POETRY) build

.PHONY: pypi-token
pypi-token: 
	echo "Type PyPI API token:"
	read -s PYPI_TOKEN
	$(POETRY) config pypi-token.pypi $(PYPI_TOKEN)
	unset PYPI_TOKEN

.PHONY: publish-pypi
publish-pypi: 
	$(POETRY) publish

.PHONY: docs-server
docs-server: 
	$(POETRY) run mike serve

.PHONY: docs-pub
docs-pub: 
	$(POETRY) run mkdocs gh-deploy --dirty -b docs
.PHONY: clean 
clean:
	rm -rf .venv
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .coverage
	rm -rf dist
	find . -type d -name __pycache__ -exec rm -r {} +

