Here's the problem with existing books of Christmas carols:

- They don't have all the carols I like.
- They take up space with carols I don't like.
- They pick bad arrangements.
- They pick bad lyrics.
- It's expensive to buy enough copies to have a good caroling party.

This is a book of my favorite four-part Christmas carols, using Ben Kuhn's [`carols` project](https://github.com/benkuhn/carols) as a jumping-off point. If you see stuff you like, or gaps that demand to be filled, feel free to fork this repo, make PRs, etc.!

## Project structure

Each carol lives in its own Lilypond file inside the `carols` subdirectory. The final book is a LaTeX file (so that it can have a nice title page, index, etc.), `book.tex`.

The book can be compiled in two modes: "handout" (meant to be printed one- or two-sided and stapled in the upper-left corner), and "booklet" (two pages per side of a sheet of paper; meant to be printed double-sided and folded down the middle).

## Compiling

The `build.py` script should take care of compiling any files that have changed and rebuilding the book. It needs to be run in the project root and takes one argument, `handout` or `booklet`, according to which output you want. By default, it dumps the final product in `./book.pdf`, though this (and many other settings) can be configured via the command line (run `build.py -h` for more info).

## Dependencies

You should have Lilypond and a LaTeX distribution installed, as well as the Python dependencies (`pip install -r requirements.txt`).
