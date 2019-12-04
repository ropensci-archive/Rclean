## Test environments
* local OS X install, R 3.6.1
* ubuntu 16.04 (on travis-ci), R unstable r77518
* ubuntu 16.04 (on travis-ci), R 3.6.1
* ubuntu 16.04 (on travis-ci), R 3.5.3
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Comments

* This release fixes a previous violation of CRAN policy for writing
  to the user file system by using the clipr package. This is in
  keep.R, which is for the explicitly stated use of writing objects to
  disk or to the clipboard.
