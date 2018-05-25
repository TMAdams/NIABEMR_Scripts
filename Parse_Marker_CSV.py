#/usr/bin/python

'''
Script written for Charlotte to parse a csv of marker information
to a format for MQM
'''

# -----------------------------------------------------
# Step 1
# Load modules and parse arguments
# -----------------------------------------------------

import argparse

ap = argparse.ArgumentParser()
ap.add_argument('--input', required=True, type=str, help='Input csv for \
                parsing')
ap.add_argument('--output', required=True, type=str, help='Filename to output \
                parsed file to')
conf = ap.argparse()

# -----------------------------------------------------
# Step 2
# Perform parsing and write out file
# -----------------------------------------------------
