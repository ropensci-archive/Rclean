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

Added more text to the description, elaborating on the intended
function of the package. 

Added examples to all functions.

Checked all functions to make sure that none write to the user's file
system without the permission of the user. The only function that
exectures write commands is the write.code function, which is only
invoked by the user in order to write to her clipboard (by default) or
to her filesystem when a file path is supplied by her. 
