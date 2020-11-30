#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Date        : Sun Nov 29 23:44:46 CET 2020
Autor       : Leonid Burmistrov
Description : Simple reminder-training example
"""

import json
import os.path

def get_config_json(filename="./ect/config.json"):
    """
    Example to read json config file    
    """
    config = json.load(open(filename))
    return config

def print_config(config):
    """
    Print config
    """
    print(type(config))
    print(config.keys())
    print(config["par1"])
    print(config["par2"])
    print(config["par3"])
    
def main(filename="./ect/config.json"):
    """
    Definition of the main function (use for testing only)
    """
    config = get_config_json(filename=filename)
    print_config(config)
    
if __name__ == "__main__":
    """
    Run as main script (use for testing only)
    """
    filename="./ect/config.json"
    main(filename)
