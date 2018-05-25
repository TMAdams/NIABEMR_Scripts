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
import csv

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

with open(conf.input) as f:
    with open(conf.output, 'w') as o:
        reader = csv.reader(f)
        next(reader, None)
        lines = list(reader)
        for line in lines:
            top_line_1 = line[0]
            top_line_2 = line[2:4]
            bottom_line = line[6:]
            top_2_string = "\t".join(top_line_2)
            top = "\t".join([top_line_1, top_2_string])
            bottom = "\t".join(bottom_line)
            o.write(top)
            o.write("\n")
            o.write(bottom)
            o.write("\n")
