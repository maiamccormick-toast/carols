#! /usr/bin/env python

"""
    Command line util that, given a path to a pdf (input file), interleaves the
    pages in the order needed to make a booklet, saving the result as
    <output_file>.pdf. (You should then print this document with 2 pages per sheet.)
"""

import argparse

from utils import make_booklet

def argument_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'input_file',
        type=str,
        help='path of pdf to booklet-ify'
    )

    parser.add_argument(
        '--output_file',
        type=str,
        default='booklet',
        help='name of the file to write output to (<output_file>.pdf)'
    )

    return parser

if __name__ == '__main__':
    parser = argument_parser()
    args = parser.parse_args()

    make_booklet(args.input_file, args.output_file)

    print('Successfully wrote to file: {}.pdf'.format(args.output_file))
