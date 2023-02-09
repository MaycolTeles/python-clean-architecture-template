start:
	./scripts/start_project.sh

format:
	black app/

lint:
	python3.10 -m flake8 app/ --config=.flake8
	python3.10 -m pylint app/ --rcfile=.pylintrc

tests: lint
	python3.10 -m pytest -vv --cov=. --cov-report=html --cov-config=.coveragerc

run:
	python3.10 app/run.py

## remove build artifacts
clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

## remove Python file artifacts
clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

## remove test and coverage artifacts
clean-test:
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/

## remove all build, test, coverage and Python artifacts
clean: clean-build clean-pyc clean-test
