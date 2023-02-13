#!/bin/bash

# Define the name of the use case.
USE_CASE_NAME=$1
# UPPER_CASE=$2


# Check if the use case name is passed, otherwise print an error message
if [ -z "$USE_CASE_NAME" ]; then
    echo "Error: Use Case name must be provided."
    echo "To use this script, you have to pass the use case name."
    echo "For more help, please refer to the documentation under the docs/ folder."
    exit 1
fi


# Convert USE_CASE_NAME to snake_case to use in the module and to its plural version to be the package
MODULE_NAME=$(echo "$USE_CASE_NAME" | sed 's/\([A-Z]\)/_\L\1/g' | sed 's/^_//')
PACKAGE_NAME=${MODULE_NAME}s


# Define the use case and test directory names
USE_CASE_DIR=app/src/domain/use_cases/$PACKAGE_NAME
TEST_DIR=app/tests/domain/use_cases/$PACKAGE_NAME


# Create the use case and test directories, or print an error message if unsuccessful
mkdir -p $USE_CASE_DIR || { echo "Error while creating the dir $USE_CASE_DIR"; exit 1; }
mkdir -p $TEST_DIR || { echo "Error while creating the dir $TEST_DIR"; exit 1; }


# Create the use case module file
USE_CASE_MODULE=$USE_CASE_DIR/${MODULE_NAME}.py
echo "\"\"\"
Module containing the \"$USE_CASE_NAME\" Use Case.
\"\"\"


class $USE_CASE_NAME():
    \"\"\"
    Class to represent a $USE_CASE_NAME Use Case.
    \"\"\"

    def __init__(self) -> None:
        \"\"\"
        Constructor to initialize the class.
        \"\"\"
        pass

    def execute(self) -> None:
        \"\"\"
        Method to execute the use case.

        This method implements the command design pattern.
        \"\"\"
        pass" > $USE_CASE_MODULE


# Create the use case test file in the test/use_cases directory
TEST_MODULE=$TEST_DIR/test_${MODULE_NAME}.py
echo "\"\"\"
Module containing the Test$USE_CASE_NAME TestCase.
\"\"\"

from unittest import TestCase

from src.domain.entities.$PACKAGE_NAME import $USE_CASE_NAME


class Test$USE_CASE_NAME(TestCase):
    \"\"\"
    Class containing all unit tests to assert
    the expected behaviours for the $ENTITY_NAME Use Case.
    \"\"\"

    def test_should_create_new_instance_of_$MODULE_NAME(self) -> None:
        \"\"\"
        Method to assert that a new $MODULE_NAME instance
        was successfully created along with the needed parameters.
        \"\"\"
        $MODULE_NAME = $USE_CASE_NAME()

        self.assertIsInstance($MODULE_NAME, $USE_CASE_NAME)" > $TEST_MODULE


# Trying to create the __init__.py file in the src and tests directory
bash ./scripts/create_init_files.sh "$USE_CASE_NAME" "$MODULE_NAME" "$USE_CASE_DIR" "$TEST_DIR"


# Error while creating the __init__.py files
if [ $? -ne 0 ]; then
    echo "Error: Could not create __init__.py files."
    exit 1
fi


# Prints a success message since entity was created
echo "New use case \"$USE_CASE_NAME\" created successfully."