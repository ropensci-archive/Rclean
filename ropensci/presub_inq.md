Title: Rclean: A Tool for Writing Cleaner, More Transparent Code

Submitting Author: Matthew K. Lau (@mklau)
Repository: https://github.com/provtools/rclean

---

-   Paste the full DESCRIPTION file inside a code block below:

```
Type: Package
Package: Rclean
Title: A Tool for Writing Cleaner, More Transparent Code
Version: 1.1.0
Date: 2019-04-24
Author: Matthew K. Lau
Maintainer: Matthew K. Lau <matthewklau@fas.harvard.edu>
Description: To create clearer, more concise code provides this
	     toolbox helps coders to isolate the essential parts of a script that
	     produces a chosen result, such as an object, tables and figures
	     written to disk and even warnings and errors. 
URL: https://github.com/ProvTools/Rclean
BugReports: https://github.com/ProvTools/Rclean/issues
License: GPL-3 | file LICENSE
Imports: igraph, jsonlite, formatR, CodeDepends
Suggests: roxygen2, testthat
RoxygenNote: 6.0.1

```


## Scope 

- Please indicate which category or categories from our [package fit policies](https://ropensci.github.io/dev_guide/policies.html#package-categories) this package falls under: (Please check an appropriate box below.:

	- [ ] data retrieval
	- [ ] data extraction
	- [ ] database access
	- [ ] data munging
	- [ ] data deposition
	- [X] reproducibility
	- [ ] geospatial data
	- [ ] text analysis
	

- Explain how the and why the package falls under these categories (briefly, 1-2 sentences).  Please note any areas you are unsure of:

In writing analytical scripts, software best practices are often a
lower priority than producing inferential results, leading to large,
complicated code bases that often need refactoring. The "code
cleaning" capabilities of the Rclean package provide a means to
rigorously identify the minimal code required to produce a given
result (e.g. object, table, plot, etc.), reducing the effort required
to create simpler, more transparent code that is easier to reproduce.

-   Who is the target audience and what are scientific applications of
    this package?
	
The target audience is domain scientists that have little to no formal
training in software engineering. Multiple studies on scientific
reproducibility have pointed to data and software availability as
limiting factors. This tool will provide an easy to use tool for
writing cleaner analytical code.

-   Are there other R packages that accomplish the same thing? If so,
    how does yours differ or meet [our criteria for
    best-in-category](https://ropensci.github.io/dev_guide/policies.html#overlap)?

There are other packages that analyze the syntax and structure of
code, such as lintr, formatr and cleanr. Rclean, as far as we are
aware, is the only package written for R that uses a data provenance
approach to construct the interdependencies of objects and functions
and then uses graph analytics to rigorously determine the desired
pathways to determine the minimal code-base needed to generate an
result.

-  Any other questions or issues we should be aware of?:

Not that I can think of at the moment.
