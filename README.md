# My-Python-Template
This is a template for python projects.
Suuporting:
    [x] Poetry: for package management.
    [x] AutoFormating Tools
        [x] Black: for code formatting.
        [x] Isort: for imports formatting.
        [x] autoflake: for unused imports and variables.
    [x] Linting Tools
        [x] Flake8: for code linting.
        [x] Pylint: for code linting.
        [x] Mypy: for type checking.
    [x] Export Requirements
        [x] cyclonedx-py: for export requirements in CycloneDX format.
    [x] Security Tools
        [x] Trivy: for scan vulnerabilities in packages.
        [x] Bandit: for security linting.
    [x] Testing Tools
        [x] Pytest: for testing.
        [x] Pytest-cov: for coverage.
    [x] Pre-Commit: for run all the tools before commit.
    [x] Makefile: for run all the tools with make commands.

Check our [Documentation](https://brunobotelhobr.github.io/My-Python-Template/)
# How to use
Install the Requirements

## Requirements
You must install manually the following tools:
Install [Make](https://www.gnu.org/software/make/)
Install [Python](https://www.python.org/downloads/)
Install [Poetry](https://python-poetry.org/docs/#installation)
Install [Trivy](https://aquasecurity.github.io/trivy/v0.40/getting-started/installation/)

Be sure you have installed all the requirements and that you on the desired python Version, you can check it with: 
    `python --version`

## Setup
Run `make install-dev` to install all the dev dependencies.
Run `make info` to check your environment.
Run `make update` to update all the dependencies.
Run `make bom` to export the requirements in CycloneDX format.
Run `make req` to export the requirements in txt format.
Run `make test-cov` to run the tests with coverage.
Run `make enable-hooks` to enable the pre-commit hooks.
Run `project-meta` to update the project metadata (name, version and license).

## Make Commands
All the commands are listed below:
`make`

    install-dev   install all the development dependencies
    install-prod  install only the production dependencies
    info          show the project information
    format        reformat code
    lint          run the code linters
    upgrade       upgrade the dependencies
    bom           generate the bill of materials
    req           export the requirements to a requirements.txt file
    test          run all the tests
    test-cov      run all the tests and show test coverage
    enable-hooks  enable the pre-commit hooks
    disable-hooks disable the pre-commit hooks
    project-meta  update the project metadata data, like version and name
    build-pypi    build the package
    pypi-token    set the pypi API token
    publish-pypi  publish the package to pypi
    clean         remove all temporary files

## Hints
- How add a Dev Package
    `poetry add --dev <package-name>`
- How add a Prod Package
    `poetry add <package-name>`
- How add a Package with extras
    `poetry add <package-name> -E <extras>`
- How remove a Package
    `poetry remove <package-name>`