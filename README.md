
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- # ijtiff  <img src="man/figures/logo.png" height="140" align="right"> -->

<!-- Code status -->

[![Build
Status](https://travis-ci.org/MKLau/Rclean.svg?branch=master)](https://travis-ci.org/MKLau/Rclean)
[![Coverage
status](https://codecov.io/gh/MKLau/Rclean/branch/master/graph/badge.svg)](https://codecov.io/github/MKLau/Rclean?branch=master)

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

[![](https://badges.ropensci.org/327_status.svg)](https://github.com/ropensci/software-review/issues/327)
[![status](http://joss.theoj.org/papers/334d80d5508056dc6e7e17c6fd3ed5a6/status.svg)](http://joss.theoj.org/papers/334d80d5508056dc6e7e17c6fd3ed5a6)

<!-- Archiving -->

[![DOI](https://zenodo.org/badge/102645585.svg)](https://zenodo.org/badge/latestdoi/102645585)

# Quick Start Guide

  - [Rclean](https://github.com/ProvTools/Rclean) was created to help
    scientists more *easily* write “cleaner” code.
  - Written with research scientists that are results oriented in mind,
    the package’s primary function provides a simple way to isolate the
    minimal code you need to produce a specific result, such as a
    statistical table or a figure. By focusing on specific results (aka.
    variables), large and/or complicated analytical scripts can be
    paired down to the essentials and easily re-factored to be more
    robust and easily shared.
  - Below, you’ll find a brief introduction to get you started using the
    package. For more details, see `vignette("Rclean")`.

# Install

You can install the most up to date version easily with
[devtools](https://github.com/hadley/devtools):

``` r
install.packages("devtools")
devtools::install_github("MKLau/Rclean")
```

You will also likely need to install the
[RGraphViz](bioconductor.org/packages/release/bioc/html/Rgraphviz.html):

``` r

install.packages("BiocManager")
BiocManager::install("Rgraphviz")
```

Once installed, per usual R practice just load the *Rclean* package
with:

``` r
library(Rclean)
```

# Usage

*Rclean* usage is simple. Have a script with code you want to clean
saved to disk. Then, just run the `clean` function with the path to the
script as the input. Here, we can use an example script that is included
with the package:

``` r
script <- "example/simple_script.R"
```

Here’s a quick look at the code:

``` r
readLines(script)
#>  [1] "## Make a data frame"                             
#>  [2] "mat <- matrix(rnorm(400), nrow = 100)"            
#>  [3] "dat <- as.data.frame(mat)"                        
#>  [4] "dat[, \"V2\"] <- dat[, \"V2\"] + runif(nrow(dat))"
#>  [5] "dat[, \"V5\"] <- gl(10, 10)"                      
#>  [6] "## Conduct some analyses"                         
#>  [7] "fit12 <- lm(V1 ~ V2, data = dat)"                 
#>  [8] "fit13 <- lm(V1 ~ V3, data = dat)"                 
#>  [9] "fit14 <- lm(V1 ~ V4, data = dat)"                 
#> [10] "fit15.aov <- aov(V1 ~ V2 + V5, data = dat)"       
#> [11] "## Summarize analyses"                            
#> [12] "summary(fit15.aov)"                               
#> [13] "tab.12 <- summary(fit12)"                         
#> [14] "tab.13 <- summary(fit13)"                         
#> [15] "tab.14 <- summary(fit14)"                         
#> [16] "tab.15 <- append(fit15.aov, tab.14)"              
#> [17] "## Conduct an off-hand calculation"               
#> [18] "dat <- 25 + 2"                                    
#> [19] "dat[2] <- 10"                                     
#> [20] "out <- dat * 2"
```

You can get a list of the variables found in an object with `get_vars`.

``` r
get_vars(script)
#>  [1] "mat"       "dat"       "fit12"     "fit13"     "fit14"    
#>  [6] "fit15.aov" "tab.12"    "tab.13"    "tab.14"    "tab.15"   
#> [11] "out"
```

Sometimes for more complicated scripts, it can be helpful to see a
network graph showing the interdependencies of variables. `code_graph`
will produce a network diagram showing which lines of code produce or
use which variables:

``` r

code_graph(script)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="75%" />

Now, we can pick the result we want to focus on for cleaning:

``` r

clean(script, "tab.15")
#> mat <- matrix(rnorm(400), nrow = 100)
#> dat <- as.data.frame(mat)
#> dat[, "V2"] <- dat[, "V2"] + runif(nrow(dat))
#> dat[, "V5"] <- gl(10, 10)
#> fit14 <- lm(V1 ~ V4, data = dat)
#> fit15.aov <- aov(V1 ~ V2 + V5, data = dat)
#> tab.14 <- summary(fit14)
#> tab.15 <- append(fit15.aov, tab.14)
#> dat <- 25 + 2
#> dat[2] <- 10
```

We can also select several variables at the same time:

``` r
my.vars <- c("tab.12", "tab.15")
clean(script, my.vars)
#> mat <- matrix(rnorm(400), nrow = 100)
#> dat <- as.data.frame(mat)
#> dat[, "V2"] <- dat[, "V2"] + runif(nrow(dat))
#> dat[, "V5"] <- gl(10, 10)
#> fit12 <- lm(V1 ~ V2, data = dat)
#> fit14 <- lm(V1 ~ V4, data = dat)
#> fit15.aov <- aov(V1 ~ V2 + V5, data = dat)
#> tab.12 <- summary(fit12)
#> tab.14 <- summary(fit14)
#> tab.15 <- append(fit15.aov, tab.14)
#> dat <- 25 + 2
#> dat[2] <- 10
```

While just taking a look at the simplified code can be very helpful, you
can also save the code for later use or sharing (e.g. creating a
reproducible example for getting help) with `keep`:

``` r
my.code <- clean(script, my.vars)
keep(my.code, file = "results_tables.R")
```

If you would like to copy your code to your clipboard, you can do that
by not specifying a file path. You can now paste the simplified as
needed.

``` r
keep(my.code)
```

# Contributing

This is an open-source project. If you would like to contribute to the
project, please check out [CONTRIBUTING.md](CONTRIBUTING.md).

Please note that the ‘Rclean’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
