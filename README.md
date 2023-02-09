# Python Template
Template for Python projects written using the Clean Architecture approach.

For more information about the template, please reach [here](https://github.com/MaycolTeles/python-project-template/blob/main/README.md)

This clean architecture template contains some extra scripts to automate the creation of `Entities` and `Use-Cases`, along with their test files.
It creates only the templates and standard code, but the implementation must be done by you.

### Creating a new entity:

You can run

```Makefile
$ make entity Car
```

and a Car entity will be created. To see exactly how the files will look like, please refer to [these docs](https://github.com/MaycolTeles/python-clean-architecture-template/blob/main/docs/scripts/create_entity.md)


### Creating a new use-case:

You can run

```Makefile
$ make use-case CreateCar
```

and a CreateCarUseCase use-case will be created. To see exactly how the files will look like, please refer to [these docs](https://github.com/MaycolTeles/python-clean-architecture-template/blob/main/docs/scripts/create_use_case.md)
