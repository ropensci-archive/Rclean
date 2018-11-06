[![Build Status](https://travis-ci.org/ProvTools/Rclean.svg?branch=master)](https://travis-ci.org/ProvTools/Rclean) [![DOI](https://zenodo.org/badge/102645585.svg)](https://zenodo.org/badge/latestdoi/102645585)

Clean up your code
==================

- Have you ever written a long script in R that conducts oodles of
  analyses and wished that someone would come along and make it all
  clearer to understand and use?
- Well you’re not alone. 
- A recent survey of over 1500 scientists reported a crisis of
  reproducibility with "selective reporting" being the most cited
  contributing factor and 80% saying code availability is playing a
  role
- We created **Rclean** to help scientists more *easily* write "cleaner" code
- [Rclean](https://github.com/ProvTools/Rclean) provides a simple way
  get the code you need to produce a specific result
- **Rclean** uses data provenance to capture what your code actually
  does when it’s running and then allows you to pull out the essential
  code that produces specific outputs.
- By focusing in on the specific results you want, **Rclean** let’s
  you spend more energy on your science and less time figuring out
  your code.


Install and Setup
=================

You can install
[Rclean](https://cran.r-project.org/web/packages/Rclean/) from *CRAN*: 

```R
install.packages("Rclean")
```

You can install the most up to date version easily with
[devtools](https://github.com/hadley/devtools):

```R
install.packages("devtools")
devtools::install_github("ProvTools/cleanR")
```
You will also need to be able to generate data provenance from your
script. This can be done using [rdtLite](https://github.com/End-to-end-provenance/rdtLite):

```R
devtools::install_github("End-to-end-provenance/rdtLite")
```

Once installed, per usual R practice, just load the *Rclean* and
*rdtlite* packages:

```R
library(Rclean)
library(rdtLite)
```

Usage
=====

Here's a
[demo video](https://www.mtholyoke.edu/~blerner/DataProvenance/Rclean_demo.mov) for
the following example:

[![demo video](Rclean_demo.png)](https://www.mtholyoke.edu/~blerner/DataProvenance/Rclean_demo.mov)

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
[rdtLite](https://github.com/End-to-end-provenance/rdtLite) package to generate
provenance. The next bit of code runs our script and collects the
provenance, which we then pass to the `options` function, so
that [Rclean](https://github.com/ProvTools/Rclean) has access to it:

```R
prov.run("micro.R")
options(prov.json = prov.json())
```

Now that we have the provenance loaded, we can start
cleaning. [Rclean](https://github.com/ProvTools/Rclean) will give us a
list of possible values we can get code for:

```R
clean()

```

Altenatively, you can call clean.prov and pass in either the provenance or
the name of a file containing the provenance ("prov.json" in this example): 
```R
clean.prov (prov.json(), isFile=FALSE)
clean.prov ("prov.json")
```

You can then pick and choose from among these results and get the
essential code to produce the output, like so:

```R
clean(x)
```

or

```R
clean.prov (prov.json(), x, isFile=FALSE)
```

You can also collect provenance and clean in one step using clean.script:

```R
clean.script ("micro.R", x)
```

Notice that the 'clean' functions don't require you to quote your
results, they interpret all inputs as names of results. 

In many cases, it's handy just to take a look at the isolated code,
but you can also save the code for later use or sharing.

```R
my.code <- clean(x)
write.code(my.code, file = "x.R")

```

If you would like to copy your code to the clipboard, you can do that
by not specifying a file path. 

```R
write.code(my.code)

```

Happy cleaning!


*Contributing*: if you would like to contribute, please read [[CONTRIBUTING.md]].


