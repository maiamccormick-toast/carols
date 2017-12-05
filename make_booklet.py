#! /usr/bin/env python

import argparse

from PyPDF2 import PdfFileWriter, PdfFileReader

def argument_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'infile',
        type=str,
        help='path of pdf to booklet-ify'
    )

    return parser

if __name__ == '__main__':
    parser = argument_parser()
    args = parser.parse_args()

    output_pdf = PdfFileWriter()

    with open(args.infile, 'rb') as readfile:
        input_pdf = PdfFileReader(readfile)

        total_pages = input_pdf.getNumPages()
        i = 0 # increment from start
        j = total_pages - 1 # decrement from end

        if total_pages % 2 != 0:
            # odd number of pages, insert initial blank page (for which we need page width and height)
            page = input_pdf.getPage(0)
            width = page.mediaBox.getWidth()
            height = page.mediaBox.getHeight()
            output_pdf.addBlankPage(width, height)
            output_pdf.addPage(input_pdf.getPage(i))
            i += 1

        while True:
            output_pdf.addPage(input_pdf.getPage(j))
            if j == i:
                break
            j -= 1

            output_pdf.addPage(input_pdf.getPage(i))
            if j == i:
                break
            i += 1

        with open(r'output.pdf', "wb") as writefile:
            output_pdf.write(writefile)
            print('successfully wrote to file: output.pdf')
