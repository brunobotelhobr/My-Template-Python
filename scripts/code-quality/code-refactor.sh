#/bin/bash

echo "Refactoring Code..."

echo "Running black..."
python -m black --config ./pyproject.toml src
python -m black --config ./pyproject.toml tests

echo "Running isort..."
python -m isort --settings-path pyproject.toml src
python -m isort --settings-path pyproject.toml tests

echo "Running autoflake..."
python -m autoflake --recursive src
python -m autoflake --recursive tests