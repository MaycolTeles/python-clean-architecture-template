To create a new entity class called "Car", for example, you can run:

```shell
./scripts/create_entity car
```

or using the Makefile:

```Makefile
make entity car
```

and the following files will be generated:

`app/src/domain/entites/cars/__init__.py`

> This file should look like so:

```python
"""
__init__ file to export the classes below.
"""

__all__ = ["Car"]


from .car import Car
```

`app/src/domain/entites/cars/car.py`

> This file should look like so:

```python
"""
Module containing the Car Entity.
"""

class Car():
    """
    Class to represent a Car Entity.
    """

    def __init__(self) -> None:
        """
        Constructor to initialize the class.
        """
        pass
```

`app/tests/domain/entities/cars/__init__.py`

> This file should be empty.

`app/tests/domain/entities/cars/test_car.py`

> This file should look like so:


```python
"""
Module containing the TestCar TestCase.
"""

from unittest import TestCase

from src.domain.entities.cars import Car

class TestCar(TestCase):
    """
    Class containing all unit tests to assert the expected behaviours from the Car Entity.
    """
    
    def test_should_create_new_car(self) -> None:
    """
    Method to assert that a car was successfully created along with the needed parameters.
    """
    car = Car()

    self.assertIsInstance(car, Car)
```


if you want the entity to be all in uppercase, you can pass the `-U` flag. Here's a simple example:

```shell
./scripts/create_entity ID -U
```

or using the Makefile:

```Makefile
make entity ID -U
```

and the files will be created according to the former example, but now the id.py file will be like so:

`app/src/domain/entities/ids/id.py`

```python
"""
Module containing the ID Entity.
"""

class ID():
    """
    Class to represent an ID Entity.
    """

    def __init__(self) -> None:
        """
        Constructor to initialize the class.
        """
        pass
```
