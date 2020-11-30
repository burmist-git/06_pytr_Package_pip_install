#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Date        : Sun Nov 29 23:44:46 CET 2020
Autor       : Leonid Burmistrov
Description : Simple reminder-training example.
'''

import os
import sys
#
import module01

def main():
    os.system('echo "\n 1) Info : --> test of the module01"')
    print(sys.modules['module01'])
    print(sys.modules['module01'].__file__)
    module01.main()    

if __name__ == "__main__":
    main()
