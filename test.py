#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Date        : Sun Nov 29 23:44:46 CET 2020
Autor       : Leonid Burmistrov
Description : Simple reminder-training example.
'''

import pkgttest.module01 as m01
import pkgttest.module02_class as m02

print("m01.main(./pkgttest/ect/config.json)-->")
m01.main("./pkgttest/ect/config.json")
print("m02.main()-->")
m02.main()
