#!/usr/bin/env python
# -*- coding: utf-8 -*-
import ast

class stringToDict(object):
    # check if object exists in json
    def stringToDict(self, mystring):
        my_dict = ast.literal_eval(mystring)