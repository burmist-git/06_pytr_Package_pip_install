## 06_pytr_Package_pip_install

## File description
===================

    ├── data                     < data folder
    ├── LICENSE                  < LICENSE (GNU)
    ├── Makefile                 < make file for file managing/cleaning
    ├── pkgttest                 < test package
    │   ├── ect                  < config folder
    │   │   └── config.json      < config file
    │   ├── __init__.py          < package file
    │   ├── module01.py          < test module of the package
    │   ├── module02_class.py    < test class module of the package
    │   └── runTest.py           < modules test script
    │── test.py                  < package test script
    ├── pkgttest.yml             < pkgttest yml file
    ├── README.md                < this file
    └── setup.py                 < file for pip install

## commands

pip install -e .
pip uninstall pkgttest
