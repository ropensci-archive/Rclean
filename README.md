# cleanR

R is a great language for doing rapid, innovative analyses. 

Once you've gotten the results you want, leverage data provenance to
help clean your code up and focus on the specific results that you
really want.

Install
=======

Install the latest version easily with [devtools](https://github.com/hadley/devtools):

```R
library(devtools)
install_packages("ProvTools/cleanR")
```

Clean up your code
==================

[cleanR](https://github.com/ProvTools/cleanR) provides a simple API to
hone in on a specific result that you want from your script, and
return the specific code you need to produce it.

```R
library(cleanR)
cleanR("messycode.R") # This will give you a list of results
cleanR("messycode.R", result = "save1.csv") # Code for some saved data
```

[Checkout a demo of how to use the package!](http://tinyurl.com/ProvTools-cleanR)
