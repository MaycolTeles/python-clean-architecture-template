# Python Template
Template for Python projects.

This template should be used like so:

1. First, click the "Use this template" button and then "Create a new repository";
2. Now, clone this repository locally in your machine;
3. Add all the libraries/packages you want in your project to `packages.txt` inside the `/scripts` folder, but <b>don't remove the ones that are already there</b>;
4. Finally, run the `start_project.sh` script located inside `/scripts` folder as well. You can run the script in Unix systems like so:

```shell
./scripts/start_project
```

Alternatively, you can run:

```shell
make start
```

and it will work the same;

5. Start coding! You now have a whole environment set with the following features:

### Makefile

A Makefile containing some useful commands, like:
* start (run the `./scripts/start_project.sh` script to start the project)
* run (run the application by executing `app/run.py` file`);
* test (run all the tests using pytest and generates a html containing the code coverage);
* lint (run flake8 and then pylint on your code);
* format (run black on your code);
* clean (run Unix commands to remove `.pyc` files, `__pycache__` folders and .coverage related files);

To run a Makefile command, you can just type `make <command>` from your root folder like so:
```shell
~/your_project_name$ make start
```

### Configuration Files

This template provides to you some right-away configurations for the `pylint`, `flake8`, `coverage` and `pre-commit´ libraries
