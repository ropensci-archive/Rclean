<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- # ijtiff  <img src="man/figures/logo.png" height="140" align="right"> -->
<!-- Code status -->
[![Stable: Build
Status](https://travis-ci.org/ProvTools/Rclean.svg?branch=master)](https://travis-ci.org/ProvTools/Rclean)
[![Dev: Build
Status](https://travis-ci.org/ProvTools/Rclean.svg?branch=tests)](https://travis-ci.org/ProvTools/Rclean)
[![Coverage
status](https://codecov.io/gh/provtools/Rclean/branch/tests/graph/badge.svg)](https://codecov.io/github/provtools/Rclean?branch=tests)

<!-- R status -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/Rclean)](https://cran.r-project.org/package=Rclean)
![RStudio CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/Rclean)
![RStudio CRAN monthly
downloads](http://cranlogs.r-pkg.org/badges/Rclean)
[![Rdocumentation](http://www.rdocumentation.org/badges/version/Rclean)](http://www.rdocumentation.org/packages/Rclean)

<!-- Dev status -->
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

<!-- Package Review -->
[![](https://badges.ropensci.org/300_status.svg)](https://github.com/ropensci/onboarding/issues/300)
[![status](http://joss.theoj.org/papers/334d80d5508056dc6e7e17c6fd3ed5a6/status.svg)](http://joss.theoj.org/papers/334d80d5508056dc6e7e17c6fd3ed5a6)

<!-- Archiving -->
[![DOI](https://zenodo.org/badge/102645585.svg)](https://zenodo.org/badge/latestdoi/102645585)

Clean up your code
==================

-   Have you ever written a long script in R that conducts lots of
    analyses and wished that someone would come along and make it all
    clearer to understand and use?
-   Well you’re not alone.
-   A recent survey of over 1500 scientists reported a crisis of
    reproducibility with “selective reporting” being the most cited
    contributing factor and 80% saying code availability is playing a
    role.
-   [Rclean](https://github.com/ProvTools/Rclean) was created to help
    scientists more *easily* write “cleaner” code by providing a simple,
    rigorous way to isolate the minimal code you need in order to
    produce a specific result (e.g. object, plot, output written to
    disk).
-   [Rclean](https://github.com/ProvTools/Rclean) is built on data
    provenance, a formal representation of a computation, and uses graph
    analysis to determine the minimal path from inputs to results.
-   The goal is to help facilitate code transparency, reproduciblity,
    reusability and ultimately help scientists spend more time on
    research and less time on software.

Install and Setup
=================

You can install
[Rclean](https://cran.r-project.org/web/packages/Rclean/) from *CRAN*:

    install.packages("Rclean")
    #> 
    #> The downloaded binary packages are in
    #>  /var/folders/7x/4c5fkmrx5r54d6sgzglyffth0000gn/T//RtmpgCraih/downloaded_packages

You can install the most up to date (beta) version easily with
[devtools](https://github.com/hadley/devtools):

    install.packages("devtools")
    #> 
    #>   There is a binary version available but the source version is
    #>   later:
    #>          binary source needs_compilation
    #> devtools  2.0.2  2.1.0             FALSE
    #> installing the source package 'devtools'
    #> Warning in download.file(url, destfile, method, mode = "wb", ...): URL
    #> 'http://cran.r-project.org/src/contrib/devtools_2.1.0.tar.gz': status was
    #> 'Couldn't resolve host name'
    #> Warning in download.packages(pkgs, destdir = tmpd, available = available, :
    #> download of package 'devtools' failed
    devtools::install_github("ProvTools/Rclean", ref = "dev")
    #> Downloading GitHub repo ProvTools/Rclean@dev
    #>   
       checking for file ‘/private/var/folders/7x/4c5fkmrx5r54d6sgzglyffth0000gn/T/RtmpgCraih/remotes50c32724ce0/ProvTools-Rclean-1e727f1/DESCRIPTION’ ...
      
    ✔  checking for file ‘/private/var/folders/7x/4c5fkmrx5r54d6sgzglyffth0000gn/T/RtmpgCraih/remotes50c32724ce0/ProvTools-Rclean-1e727f1/DESCRIPTION’ (632ms)
    #> 
      
    ─  preparing ‘Rclean’:
    #>    checking DESCRIPTION meta-information ...
      
    ✔  checking DESCRIPTION meta-information
    #> 
      
    ─  checking for LF line-endings in source and make files and shell scripts
    #> 
      
    ─  checking for empty or unneeded directories
    #> 
      
    ─  looking to see if a ‘data/datalist’ file should be added
    #> 
      
    ─  building ‘Rclean_1.1.0.tar.gz’
    #> 
      
       
    #> 

Once installed, per usual R practice, just load the *Rclean*:

    library(Rclean)

Usage
=====

*Rclean* usage is simple. Have a script with code you want to clean
saved to disk. Then, just run the `clean` function with the path to the
script as the input:

    clean("./example/simple_script.R")
    #> Warning in clean("./example/simple_script.R"): Please supply a variable/
    #> object name
    #>  [1] "1"         "2"         "3"         "4"         "5"        
    #>  [6] "6"         "7"         "8"         "9"         "10"       
    #> [11] "11"        "12"        "13"        "14"        "15"       
    #> [16] "16"        "mat"       "dat"       "fit12"     "fit13"    
    #> [21] "fit14"     "fit15.aov" "tab.12"    "tab.13"    "tab.14"   
    #> [26] "tab.15"    "out"

This returns a list of possible results detected in the script,
including execution lines (not counting lines with no code or that are
commented). We can now pick the result we want to focus on for cleaning:

    clean("./example/simple_script.R", "tab.15")
    #>  [1] "library()"                                        
    #>  [2] "mat <- matrix(rnorm(400), nrow = 100)"            
    #>  [3] "dat <- as.data.frame(mat)"                        
    #>  [4] "dat[, \"V2\"] <- dat[, \"V2\"] + runif(nrow(dat))"
    #>  [5] "dat[, \"V5\"] <- gl(10, 10)"                      
    #>  [6] "fit14 <- lm(V1 ~ V4, data = dat)"                 
    #>  [7] "fit15.aov <- aov(V1 ~ V2 + V5, data = dat)"       
    #>  [8] "tab.14 <- summary(fit14)"                         
    #>  [9] "tab.15 <- append(fit15.aov, tab.14)"              
    #> [10] "dat <- 25 + 2"                                    
    #> [11] "dat[2] <- 10"

This produces the minimal code detected from the script. It also detects
library dependencies and inserts them into the code (`libs = TRUE`).

It can be handy just to take a look at the isolated code, but you can
save the code for later use or sharing (e.g. creating a reproducible
example for getting help) with the `write.code` function:

    my.code <- clean("./example/simple_script.R", "tab.15")
    write.code(my.code, file = "x.R")

If you would like to copy your code to your clipboard, you can do that
by not specifying a file path. You can now paste as needed to create a
simpler script.

    write.code(my.code)

Retrospective Provenance
------------------------

So far, we’ve been using “prosepective” provenance generated from the
static code prior to execution. *Rclean* can also be used with
“retrospective” provenance, which is recorded during execution of a
script. Using it facilitates more accurate code cleaning, We can pass
the provenance to the `clean` function via `options`:

    options(prov.json = readLines("prov_micro.json"))

Now that we have the provenance loaded, we can start cleaning.
[Rclean](https://github.com/ProvTools/Rclean) will give us a list of
possible values we can get code for, notice that the option *rp* (i.e.
“retrospective provenance”) has been set to `TRUE`:

    clean(rp = TRUE)

Similar to before, you can then pick and choose from among these results
and get the essential code to produce the output, like so:

    clean(x, rp = TRUE)

Happy cleaning!

*Contributing*: if you would like to contribute, please read
\[\[CONTRIBUTE.md\]\].
