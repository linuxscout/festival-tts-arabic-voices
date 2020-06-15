#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  utf2tim.py
#   Convert a utf-8 file into a tim bukwalter 

import sys
import os
import argparse
import  bw

def grabargs():
    parser = argparse.ArgumentParser(description='Convert unicode arabic into tim bukwalter')
    
    parser.add_argument("-f", dest="filename", required=False,
    help="input file to convert", metavar="FILE")
    
    parser.add_argument("-v", dest="version", nargs='?',
    help="Release version", metavar="Version")

    parser.add_argument("text", help="add text", metavar="TEXT")    

    args = parser.parse_args()
    return args                                                   

  
def main():
    args= grabargs()
    filename = args.filename
    version = args.version
    text = args.text
    if filename:
        try:
            myfile = open(filename, encoding='utf8')
        except:
            print(" Can't Open the given File ", filename)
            sys.exit()
        text = u"".join(myfile.readlines())
    else:

        if not text:
            text=u"""السلام عليكم، صباح الخير
كيف حالك يا صديقي"""
    tim = bw.arabicToBuckwalter(text)
    print(tim)
    
if __name__ == "__main__":
  main()
