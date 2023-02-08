#!/bin/bash

# This script creatings a whole new project by:
# 1º - Creating a virtualenv
# 2º - Installing all packages listed in "packages.txt"
# 3º - Saving them (along with their version) in the requirements.txt
# 4º - Setting up the packages


# 1̣º - CREATING THE VENV
# Create the virtual environment
python3 -m virtualenv venv

# Activate the virtual environment
source venv/bin/activate


# 2º - INSTALLING THE LISTED PACKAGES
# Install the packages from "packages.txt" file
pip install -r scripts/packages.txt


# 3º - SAVING THE PACKAGES
# Saving the installed packages (from "packages.txt") and versions to requirements.txt
pip freeze > requirements.txt


# 4º - SETTING UP THE PACKAGES

# # 4.1º - pre-commit
# Installing pre-commit
pre-commit install
