[![Build Status](https://travis-ci.org/ProvTools/Rclean.svg?branch=master)](https://travis-ci.org/ProvTools/Rclean)

[![Build Status](https://travis-ci.org/ProvTools/Rclean.svg?branch=dev)](https://travis-ci.org/ProvTools/Rclean)

Clean up your code
==================

- Have you ever written a long script in R that conducts oodles of
  analyses and wished that someone would come along and make it all
  clearer to understand and use?
- Well you’re not alone. 
- A recent survey of over 1500 scientists reported a crisis of reproducibility with "selective reporting" being 
  the most cited contributing factor and 80% saying code availability is playing a role
- We created **Rclean** to help scientists more *easily* write "cleaner" code
- [Rclean](https://github.com/ProvTools/Rclean) provides a simple way get the code you need to produce a specific result
- **Rclean** uses data provenance tp capture what your code actually
  does when it’s running and then allows you to pull out the essential
  code that produces specific outputs.
- By focusing in on the specific results you want, **Rclean** let’s
  you spend more energy on your science and less time figuring out
  your code.


Install and Setup
=================

Install the latest version easily with [devtools](https://github.com/hadley/devtools):

```R
library(devtools)
install_github("ProvTools/cleanR")
install_github("ProvTools/provR")
install.packages("jsonlite”)
install.packages("igraph”)
install.packages("formatR”)
```

Then prior to use, load-up the following packages:

```R
library(cleanR)
library(provR)
library("jsonlite")
library(igraph)
library(formatR)
```

Usage
=====

Once you have your script and workspace setup, you can use
[Rclean](https://github.com/ProvTools/Rclean) to get clean chunks of a
larger script that produce specific results you want. We'll use the
micro.R script, which can be found inside the package repo in the
*exec* directory. The following example assumes that your current
working directory is *exec*. 

First, you'll need to record information about the script you would
like to parse. [Rclean](https://github.com/ProvTools/Rclean) uses data
provenance to verify what lines of code depend on each other inside of
the larger script. We can use the
[provR](https://github.com/ProvTools/provR) package to generate
provenance. The next bit of code runs our script and saves the
provenance to memory, which we then pass to the `options` function, so that [Rclean](https://github.com/ProvTools/Rclean) has access to it:

```R
prov.capture("micro.R")
options(prov.json = prov.json())
```

Now that we have the provenance loaded, we can start cleaning. [Rclean](https://github.com/ProvTools/Rclean) will give us a list of possible values we can get code for:

```R
Rclean()

```

You can then pick and choose from among these results and get the
essential code to produce the output, like so:

```R
Rclean("x")

```


In many cases, it's handy just to take a look at the isolated code,
but if you can also save the code for later use or sharing.

```R
my.code <- Rclean("x")
write.code(my.code, file = "x.R")

```
