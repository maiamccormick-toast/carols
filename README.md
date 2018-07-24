Here's the problem with existing books of Christmas carols:

- They don't have all the carols I like.
- They take up space with carols I don't like.
- They pick bad arrangements.
- They pick bad lyrics.
- It's expensive to buy enough copies to have a good caroling party.

This is a book of my favorite four-part Christmas carols, using Ben Kuhn's [`carols` project](https://github.com/benkuhn/carols) as a jumping-off point. If you see stuff you like, or gaps that demand to be filled, feel free to fork this repo, make PRs, etc.!

## Project structure

Each carol lives in its own Lilypond file inside the `carols` subdirectory. The build script (`build.py`) builds each of this Lilypond files into a pdf in the `build` subdirectory. The final product is a pdf generated via LaTeX (by default, `carols.pdf`).

## Compiling

The `build.py` script takes care of compiling any Lilypond files that have changed and (re)building the book. By default, it dumps the final product in `./carols.pdf`, though this (and many other settings) can be configured via the command line (run `build.py -h` for more info).

## Dependencies

You should have [Lilypond](http://lilypond.org/download.html) and [LaTeX](https://www.latex-project.org/get/) installed (and command-line invocations `lilypond` and `pdflatex`), as well as Python 3 and the Python dependencies (`pip install -r requirements.txt`).

### Booklet Mode

If you run the build script with flag `--booklet`, in addition to the normal output, it will generate a version of your carol packet with the pages duplexed and interleaved for booklet printing:

![Booklet page layout](/resources/booklet-pages.png?raw=true "Booklet page layout")

Print your booklet file double-sided ("flip on short edge") and you can fold it in half, staple if (if you want, I don't care), and have a nice little booklet of carols.

## Lilypond Metadata

In order to generate a table of contents and an index, the build script parses through each Lilypond file to grab some metadata from the `\header` block. By default, a carol is entered in the table of contents as it's `title` (with any leading articles moved to the back). If for some reason you want to override this behavior, put the desired title in the header matter as `toc_as`.

By default, carols also get an index entry under their ToC title. You can add an additional index entry (e.g. a common alternate name) with the `index_as` header param. For instance, the `\header` block for the Coventry Carol might look like this:

```
\header {
  title = "The Coventry Carol"
  index_as = "Lully, Lullay"
  poet = "Robert Croo, 1534"
  composer = "16th Centry English Carol"
  arranger = "arr. Martin Fallas Shaw (1875-1958)"
}
```
