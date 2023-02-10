#!/bin/bash

# Define the name of the entity and the uppercase flag (so entites won't have capitalized letters splitted).
# For example: "CertidaoDeNascimento" will be "certidao_de_nascimentos" and "CPF" would be "c_p_fs". Instead,
# if we run "CPF -u" (or "CPF -U") we will get "cpfs"
ENTITY_NAME=$1
UPPER_CASE=$2


# Check if the entity name is passed, otherwise print an error message
if [ -z "$ENTITY_NAME" ]; then
    echo "Error: Entity name must be provided."
    echo "To use this script, you have to pass the entity name and can pass an uppercase flag."
    echo "For more help, please refer to the documentation under the docs/ folder."
    exit 1
fi


# Convert ENTITY_NAME to snake_case to use in the module and to its plural version to be the package
# If the flag (-u/-U) was passed, we need to keep the entity name and capitalization when creating the folder/module
# If flag wasn't passed, we must convert to snake case on every capital letter in the entity's name.
if [ "$UPPER_CASE" == "-U" ]; then
    MODULE_NAME=$(echo "$ENTITY_NAME" | awk '{print tolower($0)}' | sed 's/\(^[A-Z]\)/\L\1/g' | sed 's/\([A-Z]\)/_\L\1/g')
    PACKAGE_NAME=${MODULE_NAME}s
else
    MODULE_NAME=$(echo "$ENTITY_NAME" | sed 's/\([A-Z]\)/_\L\1/g' | sed 's/^_//')
    PACKAGE_NAME=${MODULE_NAME}s
fi


# Define the entity and test directory names
ENTITY_DIR=app/src/domain/entities/$PACKAGE_NAME
TEST_DIR=app/tests/domain/entities/$PACKAGE_NAME


# Create the entity and test directories, or print an error message if unsuccessful
mkdir -p $ENTITY_DIR || { echo "Error while creating the dir $ENTITY_DIR"; exit 1; }
mkdir -p $TEST_DIR || { echo "Error while creating the dir $TEST_DIR"; exit 1; }


# Create the entity module file
ENTITY_MODULE=$ENTITY_DIR/${MODULE_NAME}.py
echo "\"\"\"
Module containing the \"$ENTITY_NAME\" Entity.
\"\"\"


class $ENTITY_NAME():
    \"\"\"
    Class to represent a $ENTITY_NAME Entity.
    \"\"\"

    def __init__(self) -> None:
        \"\"\"
        Constructor to initialize the class.
        \"\"\"
        pass" > $ENTITY_MODULE


# Create the entity test file in the test/entity directory
TEST_MODULE=$TEST_DIR/test_${MODULE_NAME}.py
echo "\"\"\"
Module containing the Test$ENTITY_NAME TestCase.
\"\"\"

from unittest import TestCase

from src.domain.entities.$PACKAGE_NAME import $ENTITY_NAME


class Test$ENTITY_NAME(TestCase):
    \"\"\"
    Class containing all unit tests to assert
    the expected behaviours for the $ENTITY_NAME Entity.
    \"\"\"

    def test_should_create_new_instance_of_$MODULE_NAME(self) -> None:
        \"\"\"
        Method to assert that a new $MODULE_NAME instance
        was successfully created along with the needed parameters.
        \"\"\"
        $MODULE_NAME = $ENTITY_NAME()

        self.assertIsInstance($MODULE_NAME, $ENTITY_NAME)" > $TEST_MODULE


# Trying to create the __init__.py file in the src and tests directory
bash ./scripts/create_init_files.sh "$ENTITY_NAME" "$MODULE_NAME" "$ENTITY_DIR" "$TEST_DIR"


# Error while creating the __init__.py files
if [ $? -ne 0 ]; then
    echo "Error: Could not create __init__.py files."
    exit 1
fi


# Prints a success message since entity was created
echo "New entity \"$ENTITY_NAME\" created successfully."