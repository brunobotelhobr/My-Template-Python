# My-Python-Template



## Requirements
You must install manually the following tools:
Install [Docker](https://docs.docker.com/get-docker/)
Install [Make](https://www.gnu.org/software/make/)
Install [Python](https://www.python.org/downloads/)
Install [Poetry](https://python-poetry.org/docs/#installation)
Install [Trivy](https://aquasecurity.github.io/trivy/v0.40/getting-started/installation/)


## How to use
Be sure you have installed all the requirements and that you on the desired python Version, you can check it with: 
    `python --version`

## Customize

## Make Commands


## Hints
- How add a Dev Package
    `poetry add --dev <package-name>`
- How add a Prod Package
    `poetry add <package-name>`
- How add a Package with extras
    `poetry add <package-name> -E <extras>`
- How remove a Package
    `poetry remove <package-name>`


Refactoring Code
echo "Running black..."
echo "Running isort..."

Checking Linting
Checking Poetry...
Running flake8...
Running pylint...
Running mypy...
integrados ao toml
generencia pacotes com o poetry (como add, remover, atualizat)
gera requirements.txt
GERA BOM
temos testes

>> Container
>> Env

Especializações
CLI
APP
API
API WITH MODULES

docs
sast
sca
contaiber
build publish
install
{
    "editor.rulers": [
        88
    ],
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
    "python.linting.lintOnSave": true,
    "python.linting.flake8Enabled": true,
    "python.linting.flake8Args": [
        "--max-line-length=88",
        "--extend-ignore=E203,E501,W503",
        "--exclude=.venv"
    ],
    "python.sortImports.args": [
        "--profile=black"
    ],
    "[python]": {
        "editor.formatOnSave": true,
        "editor.codeActionsOnSave": {
            "source.organizeImports": true
        }
    }
}
