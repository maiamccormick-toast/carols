#! /usr/bin/env python

import argparse
import os.path
# import os

import pylatex
from pylatex import Command, Package, UnsafeCommand
from pylatex.utils import NoEscape

import utils

# .ly "header" keys
TITLE = 'title'
TOC_AS = 'toc_as'
INDEX_AS = 'index_as'

def argument_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--booklet',
        action='store_true',
        help='generate an additional pdf of carols with pages interleaved '
        'for booklet printing (print double-sided with 2 sheets per page, '
        'fold, staple down the middle)',
    )

    parser.add_argument(
        '--ly_dir',
        type=str,
        default='./carols',
        help='directory containing .ly files of carols',
    )

    parser.add_argument(
        '--build_dir',
        type=str,
        default='./build',
        help='directory to build carol pdfs into'
    )

    parser.add_argument(
        '--output_file',
        type=str,
        default='carols',
        help='name of the file to write output to (<output_file>.pdf)'
    )

    parser.add_argument(
        '--force_build',
        action='store_true',
        help='build all .ly files, even if a current .pdf file exists'
    )

    parser.add_argument(
        '--silent',
        action='store_true',
        help='supress lilypond and LaTeX output'
    )

    return parser


def validate_dirs(user_args):
    ly_dir = user_args.ly_dir
    build_dir = user_args.build_dir

    if not os.path.isdir(ly_dir):
        print('Could not find specified "ly_dir": "{}". Creating...'.
            format(ly_dir))
        os.mkdir(ly_dir)

    if not os.path.isdir(build_dir):
        print('Could not find specified "build_dir": "{}". Creating...'.
            format(build_dir))
        os.mkdir(build_dir)

    return ly_dir, build_dir


class CarolInfo():

    """Store info related to a single carol."""

    @classmethod
    def from_ly(cls, ly_filepath: str, pdf_dir: str):
        # TODO: this function is pretty expensive, could we cache this info?
        headers = utils.headers_from_file(ly_filepath)

        toc_entry = headers.get(TITLE)
        if headers.get(TOC_AS):
            # If file has a 'toc_as' header, use that as toc_entry instead
            toc_entry = headers[TOC_AS]

        index_as = headers.get(INDEX_AS)

        filename_base = os.path.splitext(os.path.basename(ly_filepath))[0]
        pdf_base = os.path.join(pdf_dir, filename_base)

        return cls(ly_filepath, pdf_base, toc_entry, index_as)

    def __init__(self, ly_filepath: str, pdf_base: str,
                 toc_entry: str=None, index_as: str=None):
        self.ly_filepath = ly_filepath
        self.pdf_base = pdf_base # pdf path without file extension
        self.pdf_filepath = '{}.pdf'.format(pdf_base)

        if toc_entry:
            self.toc_entry = utils.clean_title(toc_entry)
        else:
            # If we didn't get an explicit ToC entry, just use the name of the pdf :-/
            self.toc_entry = self.pdf_filepath

        self.index_as = index_as

    def build_if_needed(self, force_build=False, silent=False):
        # target pdf already exists
        if os.path.isfile(self.pdf_filepath):
            # lilypond file hasn't been modified since target pdf was last
            # touched, so the pdf is current
            if utils.file_modified_time(self.pdf_filepath) > utils.file_modified_time(self.ly_filepath):
                if not force_build:
                    print('"{}" up to date, no compilation necessary.'.format(self.pdf_filepath))
                    return

        # If we make it down here, either we're in force_build mode or pdf isn't
        # current: compile the ly file into the target pdf
        utils.compile_ly(self.ly_filepath, self.pdf_base, silent=silent)


class Document(pylatex.Document):

    """Subclass PyLaTeX Document to add our own methods.

    HACK: class must be called ``Document`` for pylatex to correctly insert
    ``begin{document}`` and ``end{document}`` tags in the .tex file.

    """

    def __init__(self, src_dir: str, dest_dir: str, *args, **kwargs):
        """
        Args:
            src_dir (str): path to source directory (where .ly files live)
            dest_dir (str): path to destination directory (where we build .pdf's to)
            mode (str): mode to build the book in -- currently either 'handout'
                or 'booklet' (see argparser for details)
        """

        self.src_dir = src_dir
        self.dest_dir = dest_dir

        super().__init__(documentclass='memoir',
            document_options=['twoside', '10pt', 'openany', 'letterpaper'],
            *args, **kwargs)

    @classmethod
    def make_carol_book(cls, src_dir: str, dest_dir: str, force_build=False, silent=False):
        doc = cls(src_dir, dest_dir)

        doc.set_up()
        doc.populate(force_build=force_build, silent=silent)
        doc.end_matter()

        return doc

    def set_up(self):
        """Add packages, set preliminary settings for this doc."""
        # Add packages
        self.preamble.append(NoEscape(r'\usepackage[noprint,1to1]{booklet}'))
        self.preamble.append(Package('titlesec'))
        self.preamble.append(Package('pdfpages'))
        self.preamble.append(Package('makeidx'))
        self.preamble.append(Package('hyperref'))
        self.preamble.append(Package('graphicx'))

        self.preamble.append(NoEscape(r'\graphicspath{ {resources/} }'))

        self.preamble.append(NoEscape(r'\makeindex'))

        self.preamble.append(NoEscape(r'\source{\magstep0}{5.5in}{8.5in}'))
        self.preamble.append(NoEscape(r'\target{\magstep0}{11in}{8.5in}'))
        self.preamble.append(NoEscape(r'\setpdftargetpages'))

        self.preamble.append(NoEscape(r'\setulmarginsandblock{1.65cm}{1.65cm}{*}'))
        self.preamble.append(NoEscape(r'\setlrmarginsandblock{1cm}{1cm}{*}'))
        self.preamble.append(NoEscape(r'\checkandfixthelayout'))

        self.preamble.append(NoEscape(r'\makeindex'))

        ### Custom commands

        # Use sections so that we can easily generate a TOC... but make them
        # invisible to keep things pretty.
        invis_section = UnsafeCommand('newcommand', '\invisiblesection', options=1,
                                      extra_arguments=r'\refstepcounter{section}'
                                                      r'\sectionmark{#1}'
                                                      r'\addcontentsline{toc}{section}{#1}'
                                     )
        self.append(invis_section)

        add_song = UnsafeCommand('newcommand', '\song', options=2,
                                 extra_arguments=r'\index{#1}'
                                                 r'\invisiblesection{#1}'
                                                 r'\includepdf[pagecommand=\thispagestyle{plain}]{#2}'
                                     )
        self.append(add_song)

        # Ignore chapter numbering in order for section numbering to be reasonable
        self.preamble.append(NoEscape(r'\renewcommand{\thesection}{\arabic{section}}'))

        # Title Info
        self.preamble.append(Command('title', 'Christmas Carols'))
        self.preamble.append(Command('author', 'compiled by Maia McCormick'))
        self.preamble.append(Command('date', NoEscape(r'\today')))

        # Ignore page numbers until we get to the actual body
        self.append(NoEscape(r'\pagenumbering{gobble}'))

        # Silly cover image (will be in 'resources/coverImg.xxx')
        coverImg = r"""
            \begin{figure}[h]
            \vspace{3.0cm}
            \includegraphics[width=\textwidth]{coverImg}
            \centering
            \end{figure}
        """

        self.append(NoEscape(r'\maketitle'))
        self.append(NoEscape(coverImg))
        self.append(NoEscape(r'\clearpage'))
        self.append(NoEscape(r'\tableofcontents'))
        self.append(NoEscape(r'\clearpage'))

        # Okay, show page numbers again
        self.append(NoEscape(r'\pagenumbering{arabic}'))

    def populate(self, force_build=False, silent=False):
        ly_files = utils.ly_files_to_compile(self.src_dir)

        carols = []
        for f in ly_files:
            carols.append(CarolInfo.from_ly(f, self.dest_dir))

        fmtstr = '\\song{{{}}}{{{}}}' # ...I'm sorry.

        # TODO: sort by toc_entry (note that we need to ignore things that
        # start w/ punct. e.g. "'twas")
        carols.sort(key=lambda c: c.toc_entry)

        for c in carols:
            c.build_if_needed(force_build=force_build, silent=silent)

            # For now, add the song to the doc with a single ToC entry; if
            # there's a index_as, we'll index by that as well.
            if c.index_as:
                self.append(NoEscape('\\index{{{}}}'.format(c.index_as)))
            self.append(NoEscape(fmtstr.format(c.toc_entry, c.pdf_filepath)))

    def end_matter(self):
        self.append(NoEscape(r'\clearpage'))
        self.append(NoEscape(r'\printindex'))


if __name__ == '__main__':
    parser = argument_parser()
    args = parser.parse_args()
    ly_dir, build_dir = validate_dirs(args)

    carol_book = Document.make_carol_book(ly_dir, build_dir,
        force_build=args.force_build, silent=args.silent)

    # NOTE: by default, pyLaTeX will compile the doc multiple times if needed to
    # make sure index/ToC are up to date.
    print('Compiling carols into LaTeX doc...')
    carol_book.generate_pdf(args.output_file, clean=False, clean_tex=False, silent=args.silent)

    output_file = '{}.pdf'.format(args.output_file)
    print('Carol book successfully written to {}'.format(output_file))

    if args.booklet:
        # Additionally, output a second copy of the pdf with pages interleaved
        # for booklet printing
        print('Now, booklet-ify-ing...')
        booklet_outfile_base = '{}-booklet'.format(args.output_file)
        utils.make_booklet(output_file, booklet_outfile_base)
        print('Booklet version successfully written to {}.pdf'.format(booklet_outfile_base))



