## Script Usage

To create a new use-case class called "CreateCar", for example, you can run:

```shell
./scripts/create_use_case CreateCar
```

or using the Makefile:

```Makefile
make entity CreateCar
```

and the following files will be generated:

`app/src/domain/use_cases/create_cars/__init__.py`

> This file should look like so:

```python
"""
__init__ file to export the classes below.
"""

__all__ = ["CreateCarUseCase"]


from .create_car import CreateCarUseCase
```

`app/src/domain/use_cases/create_cars/create_car.py`

> This file should look like so:

```python
"""
Module containing the CreateCarUseCase Use Case.
"""

class CreateCarUseCase():
    """
    Class containing all the logic to create a car.
    """

    def __init__(self) -> None:
        """
        Constructor to initialize the class.
        """
        pass
        
    def execute(self) -> None:
      """
      Method to execute the use case.
      
      This method follows the command design pattern, meaning that all the logic to execute the whole use-case is whitin this method.
      """
```

`app/tests/domain/use_cases/create_cars/__init__.py`

> This file should be empty.

`app/tests/domain/use_cases/create_cars/test_create_car.py`

> This file should look like so:


```python
"""
Module containing the TestCreateCarUseCase TestCase.
"""

from unittest import TestCase

from src.domain.use_cases.create_car import CreateCarUseCase

class TestCreateCarUseCase(TestCase):
    """
    Class containing all unit tests to assert the expected behaviours from the CreateCarUseCase Use Case.
    """

    def test_should_call_execute(self) -> None:
      """
      Method to assert that the use-case is working properly by calling their "execute(...)" method.
      """
      create_car = CreateCarUseCase()

      self.assertIsInstance(create_car, CreateCarUseCase)
```
