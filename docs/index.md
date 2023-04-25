# Welcome to Project Documentation

![Project Logo](assets/logo.png){: width=160 .center}

This is a template repository for Python projects. 
It uses Poetry for dependency management and includes pre-configured tools such as Black, Flake8, mypy, Pylint, pytest, and others, for formatting, linting, testing, and documentation management. 
The project also includes security tools like Trivy and Bandit. 
The pyproject.toml file contains various configurations like project metadata, dependencies, build system, and commands for release and documentation management.

To have more details, check the [Documentation](https://brunobotelhobr.github.io/My-Template-Python/)

## Features
- Project Management
    - ✅ [Poetry](https://python-poetry.org/docs/)
    - ✅ Script to manage project metadata (Name, Version, Description, etc)
    - ✅ Script to Upgrade all dependencies
    - ✅ Script to clean all temporary files
- Code Formatting
    - ✅ [Black](https://github.com/psf/black)
    - ✅ [isort](https://pycqa.github.io/isort/)
    - ✅ [autoflake](https://github.com/myint/autoflake)  
- Code Linting
    - ✅ [Pylint](https://www.pylint.org/)
    - ✅ [Flake8](https://flake8.pycqa.org/en/latest/)
    - ✅ [Mypy](https://mypy.readthedocs.io/en/stable/)
- Testing
    - ✅ [Pytest](https://docs.pytest.org/en/stable/)
    - ✅ [Coverage](https://coverage.readthedocs.io/en/coverage-5.5/)
    - ✅ Default tests structure folder for unit and functional tests
- Security
    - ✅ [Trivy](https://aquasecurity.github.io/trivy/v0.40/getting-started/installation/)
    - ✅ [Bandit](https://pypi.org/project/bandit/)
    - ✅ [Horusec](https://horusec.io/docs/quick-start/installation/)
- Autoamtion commands
    - ✅ [Taskipy](https://github.com/taskipy/taskipy)
- PyPI
    - ✅ Scripts to build and publish to PyPI
- Docker
    - ✅ Scripts to build and publish to Docker Hub
- Documentation
    - ✅ [MkDocs](https://www.mkdocs.org/)
    - ✅ [MkDocs Material Theme](https://squidfunk.github.io/mkdocs-material/)
    - ✅ [MkDocs Versioning] with mike](https://github.com/jimporter/mike)
    - ✅ Scripts to generate SBOM (Software Bill of Materials)
    - ✅ Scripts to generate requirements.txt

## Tasks
This project uses [Taskipy](https://github.com/taskipy/taskipy) to automate common development tasks.
All tasks are defined in the `pypoject.toml` file.
Almost all tools used in this project uses `pyproject.toml` to 

List of preset tasks:
````
task --list
pre-commit     Run all pre-commit tasks
pre-release    Run all pre-release tasks
-----------    ----------------------------------------
info           Show project info
meta           Update project properties
upgrade        Upgrade all dependencies
sec            Run all security checks
format         Run all formaters
lint           Run all linters
bom            Generate BOM
req            Generate requirements.txt
test           Run all tests
pypi-build     Build package for PyPI
pypi-auth      Authenticate to PyPI
pypi-pub       Publish package to PyPI
docker-list    List docker images
docker-build   Build docker image
docker-auth    Authenticate to Docker Hub
docker-pub     Publish docker image to Docker Hub
docs           Run docs server
docs-list      List docs versions
docs-build     Add a new version to docs
docs-delete    Delete a version of the docs
docs-latest    Set the latest Version.
docs-purge     Purge all versions of the docs.
docs-pub       Publish documentation to the doc branch on GitHub.
clear          Clean all generated files
````

## Project Structure
````text
.
├── Dockerfile
├── README.md
├── docs
│   ├── assets
│   │   └── logo.png
│   ├── code.md
│   ├── css
│   │   └── extra.css
│   ├── faq.md
│   ├── how-to-guides.md
│   ├── index.md
│   ├── install.md
│   ├── manual.md
│   └── overwrites
│       └── main.html
├── meta
│   ├── bom
│   │   ├── bom.json
│   │   └── bom.xml
│   └── requirements
│       ├── requirements-dev.txt
│       └── requirements.txt
├── mkdocs.yml
├── poetry.lock
├── pyproject.toml
├── scripts
│   ├── update-doc.sh
│   └── update-project-properties.py
├── src
│   └── app
│       ├── __init__.py
│       ├── calc.py
│       └── main.py
└── tests
    ├── __init__.py
    ├── funcional
    │   └── __init__.py
    ├── integral
    │   └── __init__.py
    └── unity
        ├── __init__.py
        ├── __pycache__
        │   ├── calc_test.cpython-311-pytest-7.3.1.pyc
        │   └── main_test.cpython-311-pytest-7.3.1.pyc
        ├── calc_test.py
        └── main_test.py
````

## Call for Contributors
We invite you to contribute to this repository and help us make it even better. 
Whether it's bug fixes, new features, or documentation improvements, we welcome all contributions. 
Please read our documentation for guidelines on how to contribute. 
Happy coding!

Start by the [Install](install.md) page, than go to the [How to Contribut](how-to-guides.md) to learn how to contribute to this project.
