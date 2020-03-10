Rclean: Automated Tools for Cleaning R Code
===========================================

# What is Clean Code?

From R.C. Martin's "Clean Code"

"Leave the code cleaner than you found it." -- R.C. Martin

Interviews with software engineers
- Does one thing well
- Simple and direct
- Can be read and enhanced by others
- Comments don't make up for bad code

- Code Smells?

# What can Rclean do?


The goal of `Rclean` is to provide a set of tools that help someone
reduce and organize code based on results. More often then not, when
someone is writing an R script, the intent is to produce a set of
results, such as a statistical analysis, figure, table, etc. This set
of results is always a subset of a much larger set of possible ways to
explore a dataset, as there are many statistical approaches and tests,
let alone ways to create visualizations and other representations of
patterns in data. This commonly leads to lengthy, complicated scripts
from which researchers manually subset results, but likely never to be
refactored because of the difficulty in disentangling the code needed
to produce some results and not others. The 'Rclean' package uses an
automated technique based on data provenance (details below) to
analyze existing scripts and provide ways to identify and extract code
to produce a desired output. 


- Automatically, isolates code in a script that produces one or more objects.
- Manual searching of code not required.

## Applications

SCRIPT <-> Refactor
   |-----> Function 
   |          |------> Package
   |          |------> Workflow System (e.g. drake)
   |-----> Workbook
   |------> Shiny App
   |-----> Examples (e.g. reprex)

# The Provenance Engine Under the Hood

All of these processes rely on the generation of data provenance.  The
term provenance means information about the origins of some
object. Data provenance is a formal representation of the execution of
a computational process (https://www.w3.org/TR/prov-dm/), to
rigorously determine the the unique computational pathway from inputs
to results [@Carata2014]. To avoid confusion, note that "data" in this
context is used in a broad sense to include all of the information
generated during computation, not just the data that are collected in
a research project that are used as input to an analysis. Having the
formalized, mathematically rigorous representation that data
provenance provides guarantees that the analyses that `Rclean`
conducts are theoretically sound. Most importantly, because the
relationships defined by the provenance can be represented as a graph,
it is possible to apply network search algorithms to determine the
minimum and sufficient code needed to generate the chosen result in
the `clean` function.

There are multiple approaches to collecting data provenance, but
`Rclean` uses "prospective" provenance, which analyzes code and uses
language specific information to predict the relationship among
processes and data objects. `Rclean` relies on a library called
`CodeDepends` to gather the prospective provenance for each
script. For more information on the mechanics of the `CodeDepends`
package, see [@R-CodeDepends]. To get an idea of what data provenance
is, take a look at the `code_graph` function. The plot that it
generates is a graphical representation of the prospective provenance
generated for `Rclean` \@ref(fig:prov-graph).

```{R load-script, echo = FALSE, results = "hide"}
library(CodeDepends)
library(Rclean)
```

```{R prov-graph, fig.cap = "Network diagram of the prospective data provenance generated for an example script. Arrows indicate which lines of code (numbered) produced which objects (named).", echo = FALSE}

script <- system.file(
    "example", 
    "simple_script.R", 
    package = "Rclean")
code_graph(script)

```

## CodeDepends Provenance Collection Summary

- Review paper
- How it's used in Rclean
- Depth first search

# How you can use Rclean


Data analysis can be messy and complicated, so it's no wonder that the
code often reflects this. "What did I measure? What analyses are
relevant to them? Do I need to transform the data? What's the function
for the analysis I want to run?" This is why having a way to isolate
code based on variables can be valuable. `Rclean` provides an
automatic way to do this. Although potentially useful to all R coders,
it was designed to ease refactoring for scientists that use R but do
not have formal training in software engineering and specifically with
the "art" of creating clean code.

The following is an example of a script that has some "complications."
As you can see, although the script is not extremely long or
complicated, it's difficult enough to make it frustrating to visualize
it in its entirety and pick through it.

```{R long-setup, echo = FALSE, eval = TRUE, results = "hide"}

script.long <- system.file(
    "example", 
    "long_script.R", 
    package = "Rclean")
script <- script.long

```

```{R long-script, echo = FALSE, eval = FALSE}

library(stats)
x <- 1:100
x <- log(x)
x <- x * 2
x <- lapply(x, rep, times = 4)
### This is a note that I made for myself.
### Next time, make sure to use a different analysis.
### Also, check with someone about how to run some other analysis.
x <- do.call(cbind, x)

### Now I'm going to create a different variable.
### This is the best variable the world has ever seen.

x2 <- sample(10:1000, 100)
x2 <- lapply(x2, rnorm)

### Wait, now I had another thought about x that I want to work through.

x <- x * 2
colnames(x) <- paste0("X", seq_len(ncol(x)))
rownames(x) <- LETTERS[seq_len(nrow(x))]
x <- t(x)
x[, "A"] <- sqrt(x[, "A"])

for (i in seq_along(colnames(x))) {
    set.seed(17)
    x[, i] <- x[, i] + runif(length(x[, i]), -1, 1)
}

### Ok. Now I can get back to x2.
### Now I just need to check out a bunch of stuff with it.

lapply(x2, length)[1]
max(unlist(lapply(x2, length)))
range(unlist(lapply(x2, length)))
head(x2[[1]])
tail(x2[[1]])

## Now, based on that stuff, I need to subset x2.

x2 <- lapply(x2, function(x) x[1:10])

## And turn it into a matrix.
x2 <- do.call(rbind, x2)

## Now, based on x2, I need to create x3.
x3 <- x2[, 1:2]
x3 <- apply(x3, 2, round, digits = 3)

## Oh wait! Another thought about x.

x[, 1] <- x[, 1] * 2 + 10
x[, 2] <- x[, 1] + x[, 2]
x[, "A"] <- x[, "A"] * 2

## Now, I want to run an analysis on two variables in x2 and x3.

fit.23 <- lm(x2 ~ x3, data = data.frame(x2[, 1], x3[, 1]))
summary(fit.23)

## And while I'm at it, I should do an analysis on x.

x <- data.frame(x)
fit.xx <- lm(A~B, data = x)
summary(fit.xx)
shapiro.test(residuals(fit.xx))

## Ah, it looks like I should probably transform A.
## Let's try that.
fit_sqrt_A <- lm(I(sqrt(A))~B, data = x)
summary(fit_sqrt_A)
shapiro.test(residuals(fit_sqrt_A))

## Looks good!

## After that. I came back and ran another analysis with 
## x2 and a new variable.

z <- c(rep("A", nrow(x2) / 2), rep("B", nrow(x2) / 2))
fit_anova <- aov(x2 ~ z, data = data.frame(x2 = x2[, 1], z))
summary(fit_anova)



```

So, let's say we've come to our script wanting to extract the code to
produce one of the results `fit_sqrt_A`, which is an analysis that is
relevant to some product. Not only do we want to double check the
results, we also want to use the code again for another purpose, such
as creating a plot of the patterns supported by the test. Manually
tracing through our code for all the variables used in the test and
finding all of the lines that were used to prepare them for the
analysis would be annoying and difficult, especially given the fact
that we have used "x" as a prefix for multiple unrelated objects in
the script. Instead, we can easily do this automatically with
`Rclean`.

```{R long}
library(Rclean)
clean(script, "fit_sqrt_A")

```

As you can see, `Rclean` has picked through the tangled bits of code
and found the minimal set of lines relevant to our object of
interest. This code can now be visually inspected to adapt the
original code or ported to a new, "refactored" script using `keep`. 

```{R ex-keep, eval = FALSE}
fitSA <- clean(script, "fit_sqrt_A")
keep(fitSA)

```

This will pass the code to the clipboard for pasting into another
document. To write directly to a new file, a file path can be
specified.

```{R ex-keep-write, eval = FALSE}
fitSA <- clean(script, "fit_sqrt_A")
keep(fitSA, file = "fit_SA.R")

```

To explore more possible variables to extract, the `get_vars` function
can be used to produce a list of the variables (aka. objects) that are
created in the script.

```{R ex-get_vars-hid, eval = TRUE, echo = TRUE}

get_vars(script)

```

Especially when the code for different variables are entangled, it can
be useful to visual the code in order to devise an approach to
cleaning. As seen above \@ref(fig:prov-graph), `code_graph` will
produce a visual of the code and the objects that they produce. 

```{R ex-code_graph, fig.cap = "Example of the plot produced by the code_graph function showing which lines of code produce which variables and which variables are used by other lines of code."}

code_graph(script)

```

After examining the output from `get_vars` and `code_graph`, it is
possible that more than one object needs to be isolated. To do this is
simple in `keep` by passing the set of desired objects to the *vars*
argument.

```{R clean-mlti}

clean(script, vars = c("fit_sqrt_A", "fit_anova"))

```

Currently, because of the data provenance that is used, libraries can
not be isolated directly during the cleaning process. So, the
`get_libs` function provides a way to detect the libraries for a given
script. Just supply a file path and `get_libs` will return the
libraries that are called by that script.

```{R ex-get_libs}

get_libs(script)

```


## Software Availability

The software is currently hosted on Github, and we recommend using the
`devtools` library [@R-devtools] to install directly from the
repository (https://github.com/ROpenSci/Rclean). The package is
open-source and welcomes contributions. Please visit the repository
page to report issues, request features or provide other feedback.


# Future Work and Contributing

Relatedly, it is important to point out that `Rclean` *does not* keep
comments present in code. This could be seen as a limitation of the
data provenance, which currently does not assign them a
relationships. Therefore, although there is often very useful or even
invaluable information in comments, the `clean` function removes
them. This is a general issue with automated methods for detecting the
relationships between comments and the code itself. Comments at the
end of lines are typically relevant to the line they are on, but this
is not a requirement and could refer to other lines. Also, comments
occupying their own lines usually refer to the following lines, but
this is also not necessarily the case. As `clean` depends on the
unambiguous determination of relationships in the production of
results, it cannot operate automatically on comments. However,
comments in the original code remain untouched and can be used to
inform the reduced code. Also, as the `clean` function is oriented
toward isolating code based on a specific result, the resulting code
tends to naturally support the generation of new comments that are
higher level (e.g. "The following produces a plot of the mean response
of each treatment group."), and lower level comments are not necessary
because the code is simpler and clearer.

In the future, it would also be useful to extend the existing
framework to support other provenance methods. One possibility is
*retrospective provenance*, which tracks a computational process as it
is executing. Through this active, concurrent monitoring,
retrospective provenance can gather information that static
prospective provenance can't. Greater details of the computational
process would enable other features that could address some
challenges, such as processing information from comments, parsing
control statements and replicating random processes. However, using
retrospective provenance comes at a cost. In order to gather it, the
script needs to be executed. When scripts are computationally
intensive or contain bugs that stop execution, then retrospective
provenance can not be obtained for part or all of the code. Some work
has already been done in the direction of implementing retrospective
provenance for code cleaning in R (see
http://end-to-end-provenance.github.io).

Although the current implementation of Rclean for minimizing code is
useful on its own, we see promise in connecting it with other clean
code and reproducibility tools. One example is the `reprex` package,
which provides a simple API for sharing reproducible examples
[@R-reprex]. Another possibility is to help transition scripts to
function, package and workflow creation and refactoring via toolboxes
like `drake` [@R-drake]. `Rclean` could provide a reliable way to
extract parts of a larger script that would be piped to a simplified
reproducible example, in the case of `reprex`, or, since it can
isolate the code from inputs to one or more outputs, be used to
extract all of the components needed to write one or more functions
that would be a part of a package or workflow, as is the goal of
`drake`. 

To conclude, we hope that `Rclean` makes writing scientific software
easier for the R community. As an open-source project, we look forward
to feedback and help with extending it, particularly in the area of
reproducibility. We invite people to use the package and get involved
by reporting bugs and suggesting or contributing features. For more
information please visit the project page on Github.


#### Old Text for JOSS before the hard edit of content

---
title: 'Rclean: A Tool for Writing Cleaner, More Transparent Code'
tags:
  - R
  - reproducibility
  - transparency
  - code cleaning
  - data provenance
authors:
  - name: Matthew K. Lau
    orcid: 0000-0003-3758-2406
    affiliation: 1
  - name: Thomas F. J.-M. Pasquier
    orcid: 0000-0001-6876-1306
    affiliation: "2, 3" 
  - name: Margo Seltzer
    orcid: 0000-0002-2165-4658
    affiliation: "4"
affiliations:
 - name: Harvard Forest, Harvard University 
   index: 1
 - name: Department of Computer Science, University of Bristol 
   index: 2
 - name: School of Engineering and Applied Science, Harvard University
   index: 3
 - name: Department of Computer Science, University of British Columbia
   index: 4
date: 
bibliography: paper.bib
---

# Introduction

The growth of programming in the sciences has been explosive in the
last decade. This has facilitated the rapid advancement of science
through the agile development of computational tools. However,
concerns have begun to surface about the reproducibility of scientific
research in general [@Peng2011 @Baker2016] and the potential issues
stemming from issues with analytical software [@Pasquier2017
@Stodden2018]. Specifically, there is a growing recognition across
disciplines that simply making data and software "available" is not
enough and that there is a need to improve the transparency and
stability of scientific software [@Pasquier2018].

At the core of the growth of scientific computation, the ``R``
statistical programming language has grown exponentially to become one
of the top ten programming languages in use today. At its root R is a
*statistical* programming language. That is, it was designed for use
in analytical workflows; and the majority of the R community is
focused on producing code for idiosyncratic projects that are
*results* oriented. Also, R's design is intentionally at a level that
abstracts many aspects of programming that would otherwise act as a
barrier to entry for many users. This is good in that there are many
people who use R to their benefit with little to no formal training in
computer science or software engineering, but these same users can
also be frequently frustrated by code that is fragile, buggy and
complicated enough to quickly become obtuse even to the authors. The
stability, reproducibility and re-use of scientific analyses in R
would be improved by refactoring, which is a common practice in
software engineering [@Martin2009CleanCraftsmanship]. From this
perspective, tools that can lower the time and energy required to
refactor analytical scripts and otherwise help to "clean" code, but
abstracted enough to be easily accessible, could have a significant
impact on scientific reproducibility across all disciplines
[@Visser2015].







## Data Provenance



# Results


# Discussion

We have created ``Rclean`` to provide a simple, easy to use tool for
scientists who would like help refactoring code. Using ``Rclean`` the
code necessary to produce a specified result (e.g., an object stored
in memory or a table or figure written to disk) can be easily and
*reliably* isolated even when tangled with code for other
results. This functionality is enabled by graph analysis of data
provenance collected from the user's script. This is likely to be a
broadly useful tool as statistical programming becomes more common
across the sciences. Tools, such as this, that make it easier to
produce transparent, accessible code will be an important aid for
improving scientific reproducibility.





# Acknowledgments

This work was improved by discussions with ecologists at Harvard
Forest and through the helpful review provided by the ROpenSci
community, particularly Anna Krystalli, Will Landau and Clemens
Schmid. Much of the work was funded by US National Science Foundation
grant SSI-1450277 for applications of End-to-End Data Provenance.

# References

<!-- Use overleaf papers.bib + knitr::write_bib -->





