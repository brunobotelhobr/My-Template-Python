#/bin/bash

#Update dependencies
poetry self update 
poetry update
poetry export 

#Export requirements
poetry export --format requirements.txt > requirements/requirements.txt
echo "-r requirements.txt" > requirements/requirements-dev.txt
poetry export --with dev --format requirements.txt >> requirements/requirements-dev.txt

#Generate BOM
export FETCH_LICENSE=true
cdxgen -f bom -o requirements/bom/bom.xml