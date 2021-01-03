#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Date        : Mon Nov 30 22:00:22 CET 2020
Autor       : Leonid Burmistrov
Description : Simple reminder-training example.
'''

import os
from setuptools import setup, find_packages

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(
    name="pkgttest",
    version="xx.xx.xx",
    description="Simple reminder-training example : package pip install",
    author="Leonid Burmistrov",
    packages=find_packages(exclude=['data','example-project']),
    long_description=read('README.md'),
)
