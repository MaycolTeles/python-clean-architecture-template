#!/bin/bash

# Define the class and module names and the path to src/ and tests/
CLASS_NAME=$1
MODULE_NAME=$2
SRC_PATH=$3
TEST_PATH=$4


# Check if the use case name is passed, otherwise print an error message
if [ -z "$CLASS_NAME" ]; then
    echo "Error: Class name must be provided."
    return 1
fi


# Check if the module name is passed, otherwise print an error message
if [ -z "$MODULE_NAME" ]; then
    echo "Error: Module name must be provided."
    return 1
fi


# Check if the src path is passed, otherwise print an error message
if [ -z "$SRC_PATH" ]; then
    echo "Error: src/ path must be provided."
    return 1
fi


# Check if the test path passed, otherwise print an error message
if [ -z "$TEST_PATH" ]; then
    echo "Error: tests/ path name must be provided."
    return 1
fi

# Declaring the file name
INIT_FILE=__init__.py


# Create the __init__.py file in src folder
echo "\"\"\"
__init__ file to export the classes below.
\"\"\"

__all__ = [\"$CLASS_NAME\"]


from .$MODULE_NAME import $CLASS_NAME" > "$SRC_PATH/$INIT_FILE"


# Create the __init__.py file in tests folder
echo "\"\"\"
__init__ file to export the classes below.
\"\"\"

__all__ = []" > "$TEST_PATH/$INIT_FILE"


# Print a success message
echo "__init__.py file created successfully."
