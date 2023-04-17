#/bin/bash

echo "Checking Linting..."
echo "Checking Poetry..."
poetry check

echo "Running flake8..."
flake8 --config pyproject.toml src
flake8 --config pyproject.toml tests

echo "Running mypy..."
mypy --config-file pyproject.toml src
mypy --config-file pyproject.toml tests

echo "Running pylint..."
pylint --rcfile pyproject.toml src
pylint --rcfile pyproject.toml tests
