import os
import os.path
import re
import subprocess

from PyPDF2 import PdfFileWriter, PdfFileReader
from PyPDF2.pdf import PageObject

class LilypondException(Exception):
    pass

HEADER_REGEXP = re.compile('\\\\header\s*{\s*(.*?)}', re.DOTALL)
EQUALS_REGEXP = re.compile('\s*=\s*')

def ly_files_to_compile(ly_dir, exceptions=['header.ly']):
    """
    Return a list of .ly files from ``ly_dir`` that should be compiled into pdfs,
    i.e. all *.ly files EXCEPT FOR:
        + header.ly
        + _*.ly (i.e. files beginning with underscore) -- these are ignored

    To modify ignored filepaths, add them to ``exceptions``.
    """
    files = [
        f for f in os.listdir(ly_dir)
        if f not in exceptions
        and f.endswith('.ly')
        and not f.startswith('_')
    ]

    return [os.path.join(ly_dir, f) for f in files]


def headers_from_file(filepath: str):
    with open(filepath) as infile:
        return headers_from_ly(infile.read())


def headers_from_ly(ly_body: str):
    """Using regexp, parse thru a .ly file for the 'headers' block, and
    extract as a dict of key/value pairs."""
    match = HEADER_REGEXP.search(ly_body)
    if not match:
        raise Exception('whelp.')
    headers_str = match.group(1)
    return headers_block_to_dict(headers_str)


def headers_block_to_dict(headers_block: str):
    headers = {}
    header_lines = [line.replace('"', '').strip()
        for line in headers_block.split('\n') if line]
    for hline in header_lines:
        if not hline:
            continue

        k_v_pair = EQUALS_REGEXP.split(hline)
        if len(k_v_pair) == 2:
            headers[k_v_pair[0]] = k_v_pair[1]
        else:
            print('Error spliting header line: {}'.format(hline))

    return headers

def compile_ly(src_file: str, dest_file: str, silent=False):
    # note: dest_file should NOT have an extension (.pdf is added automatically in compilation)
    print('Compiling {} --> {}.pdf'.format(src_file, dest_file))

    res = subprocess.run(['lilypond', '-drelative-includes', '-o', dest_file, src_file],
        stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    stdout = res.stdout.decode("utf-8")
    stderr = res.stderr.decode("utf-8")

    if res.returncode == 1:
        # Something went wrong
        raise LilypondException('Failed to compile lilypond file \'{}\' with stderr:\n{}'.
            format(src_file, stderr))

    # Yay, success!
    if not silent:
        # Lilypond seems to only output to stderr, even for success...
        # We'll print stdout too just in case, though.
        print(stdout)
        print(stderr)


def make_booklet(input_file, output_file):
    """
    Given a path to a pdf (input file), interleaves the pages in the order
    needed to make a booklet, saving the result as <output_file>.pdf (You
    should then print this document with 2 pages per sheet.)
    """

    output_pdf = PdfFileWriter()

    with open(input_file, 'rb') as readfile:
        orig_pdf = PdfFileReader(readfile)

        input_pdf = PdfFileWriter()
        input_pdf.cloneDocumentFromReader(orig_pdf)

        total_pages = input_pdf.getNumPages()

        # For booklets to print correctly, number of pages should be divisible
        # by 4. If this isn't the case, add blank pages to the end until total
        # number of pages is divisible by 4.
        remainder = total_pages % 4
        if remainder != 0:
            for _ in range(4-remainder):
                input_pdf.addBlankPage()

            # reset total_pages, b/c it has changed
            total_pages = input_pdf.getNumPages()

        i = 0 # increment from start
        j = total_pages - 1 # decrement from end

        # Check that length of input doc is divisible by 4, otherwise things break.
        if total_pages % 4 != 0:
            raise Exception('At this point in code, input pdf should have a number '
                'of pages divisible by 4. Something is wrong')


        # Get dimensions from the first page (we'll need them for duplexing)
        pg = input_pdf.getPage(0)
        width, height = pg.mediaBox.getWidth(), pg.mediaBox.getHeight()

        # Given pages A, B, C, D, we want to reorder them: D, A, B, C
        for _ in range(total_pages//4):
            output_pdf.addPage(duplex_pages(input_pdf.getPage(j), input_pdf.getPage(i),
                orig_width=width, orig_height=height))
            j -= 1
            i += 1

            output_pdf.addPage(duplex_pages(input_pdf.getPage(i), input_pdf.getPage(j),
                orig_width=width, orig_height=height))
            i += 1
            j -= 1

        output_file_pdf = '{}.pdf'.format(output_file)
        with open(output_file_pdf, "wb") as outfile:
            output_pdf.write(outfile)


def duplex_pages(p1, p2, orig_width=0, orig_height=0):
    """
    Given two PageObjects representing full-size portrait pdf pages, put them
    both onto a single landscape pdf page.

    orig_width / orig_height represent the original dimensions of the input
    pdfs (which are assumed to be the same size). If not provided, they will
    be pulled from the input pdfs.
    """
    if not orig_width:
        orig_width = p1.mediaBox.getWidth()
    if not orig_height:
        orig_height = p1.mediaBox.getHeight()

    # Target is landscape (reverse original width and height)
    target = PageObject.createBlankPage(None, orig_height, orig_width)

    # Scale pages
    SCALE_FACTOR = 0.605
    p1.scaleBy(SCALE_FACTOR)
    p2.scaleBy(SCALE_FACTOR)
    new_width, new_height = SCALE_FACTOR * orig_width, SCALE_FACTOR * orig_height

    # Merge them into the target page
    target.mergeTranslatedPage(p1,
        (orig_height/2 - new_width)/2, (orig_width - new_height)/2)
    target.mergeTranslatedPage(p2,
        orig_height/2 + (orig_height/2 - new_width)/2, (orig_width - new_height)/2)

    return target

def file_modified_time(filepath):
    return os.path.getmtime(filepath)


def clean_title(title):
    """If title starts with an article ('The', 'A', 'An'), put it at the end instead."""
    try:
        first, rest = title.split(' ', 1)
    except ValueError:
        # We couldn't split the title, so just return the title itself.
        return title

    if first.lower() in ['the', 'a', 'an']:
        return '{}, {}'.format(rest, first)

    return title
