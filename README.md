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

- Have you ever written a long script in R that uses multiple data
  files and conducts oodles of analyses and wished that someone would
  come along and make it all clearer for others and you to understand
  and use?
- Well you’re not alone. 
- In a recent survey of over 1500 scientists from across multiple
  disciplines reported high levels of irreproducibility, with "slective reporting" being 
  most cited contributing factor being issues with code availability
  and usability and code availability contributing over 80% of the time.
- **cleanR** is a package that does just that
- [cleanR](https://github.com/ProvTools/cleanR) provides a simple API to
hone in on a specific result that you want from your script, and
return the specific code you need to produce it.
- **cleanR** uses data provenance tp capture what your code actually
  does when it’s running and then allows you to pull out the essential
  code that produces specific outputs.
- Here’s a simple example:
```R
library(cleanR)
cleanR("messycode.R")
```
- [Checkout a demo of how to use the package!](http://tinyurl.com/ProvTools-cleanR)
- By focusing in on the specific results you want, **cleanR** let’s
  you spend more energy on your science and less time figuring out
  your code.




