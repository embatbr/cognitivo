"""
"""


import csv
import os
import sys


PROJECT_ROOT_PATH = os.environ.get('PROJECT_ROOT_PATH')


if __name__ == '__main__':
    filename = sys.argv[1]
    fields = sys.argv[2].split(' ')

    csvfile = open('%s/files/%s.csv' % (PROJECT_ROOT_PATH, filename))
    reader = csv.DictReader(csvfile)

    csvfile = open('%s/files/%s_aug.csv' % (PROJECT_ROOT_PATH, filename), 'w')
    writer = csv.DictWriter(csvfile, fieldnames=reader.fieldnames)

    f = lambda x: {'Yes': 't', 'No': 'f', 'NA': 'NA'}[x]

    for row in reader:
        for field in fields:
            row[field] = f(row[field])

        writer.writerow(row)
