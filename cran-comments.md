## Test environments
* local OS X install, R 3.4.3
* ubuntu 14.14 (on travis-ci), R 3.4.4
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs. 

There were 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
  Maintainer: ‘Matthew K. Lau <matthewklau@fas.harvard.edu>’

  New submission

## Downstream dependencies
There are currently no downstream dependencies. 

## Resubmission

Removed dontrun wrappers from all function examples and used
"Rclean:::" for non-exported functions.

Also, fixed examples so that arguments which previously referred to x
(i.e. not a character) now refer to "x".

Added grant funding acknowledgment to DESCRPTION along with URL and
BugFix references.
