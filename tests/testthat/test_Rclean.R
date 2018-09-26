context("Provenance capture")
library(Rclean)
library(formatR)
library(utils)

context ("No provenance in options")
expect_error (clean())

## Loading test data
test.dat.loc <- system.file("exec", "micro_R.json", package="Rclean")
options(prov.json = readLines(test.dat.loc))

context("Code cleaning: initiate")
expect_warning (micro.test <- clean())
expect_equal(length(micro.test), 2)
expect_match(mode(micro.test), "list")
expect_match(names(micro.test)[1], "Files")
expect_match(names(micro.test)[2], "Objects")
expect_match(micro.test$Files[1], "test.test")
expect_match(micro.test$Files[2], "test.pdf")
expect_match(micro.test$Objects[1], "x")
expect_match(micro.test$Objects[2], "y")

context("Code cleaning: get result")
micro.result.x.test <- clean(result = "x")
expect_match(micro.result.x.test[1] , "x <- 1")
expect_match(micro.result.x.test[2] , "y <- 3")
expect_match(micro.result.x.test[3] , "x <- x \\+ y")
micro.result.y.test <- clean(result = "y")
expect_match(micro.result.y.test[1] , "y <- 3")
micro.result.test_test.test <- clean(result = "test.test")
expect_match(micro.result.test_test.test[1], "x <- 1")
expect_match(micro.result.test_test.test[2], "y <- 3")
expect_match(micro.result.test_test.test[3], "x <- x \\+ y")
expect_match(micro.result.test_test.test[4], "write\\.csv\\(x, \"~/test\\.test\"\\)")

micro.result.test_pdf.test <- clean(result = "test.pdf")
expect_match(micro.result.test_pdf.test[1], "x <- 1")
expect_match(micro.result.test_pdf.test[2], "y <- 3")
expect_match(micro.result.test_pdf.test[3], "x <- x \\+ y")
expect_match(micro.result.test_pdf.test[4], "pdf\\(\"~/test.pdf\"\\)" )
expect_match(micro.result.test_pdf.test[5], "plot\\(x\\)")
expect_match(micro.result.test_pdf.test[6], "dev.off()")

# Object does not exist
micro.foo.test <- clean(result = "foo")
expect_equal(micro.foo.test, micro.test)

context ("Using prov file")
micro.result.x.test <- clean.prov (test.dat.loc, result="x")
expect_match(micro.result.x.test[1] , "x <- 1")
expect_match(micro.result.x.test[2] , "y <- 3")
expect_match(micro.result.x.test[3] , "x <- x \\+ y")
micro.result.y.test <- clean(result = "y")
expect_match(micro.result.y.test[1] , "y <- 3")
micro.result.test_test.test <- clean(result = "test.test")
expect_match(micro.result.test_test.test[1], "x <- 1")
expect_match(micro.result.test_test.test[2], "y <- 3")
expect_match(micro.result.test_test.test[3], "x <- x \\+ y")
expect_match(micro.result.test_test.test[4], "write\\.csv\\(x, \"~/test\\.test\"\\)")

# No files in provenance
context ("No files")
nofiles.dat.loc <- system.file("exec", "SuperSimple.json", package="Rclean")
nofiles.test <- clean.prov (nofiles.dat.loc)
expect_equal(length(nofiles.test), 2)
expect_match(mode(nofiles.test), "list")
expect_match(names(nofiles.test)[1], "Files")
expect_match(names(nofiles.test)[2], "Objects")
expect_equal (length (nofiles.test$Files), 0)

# Multi-line statements
context("Multi-line statement")
lines.dat.loc <- system.file("exec", "Lines.json", package="Rclean")
lines.result.cc.test <- clean.prov (lines.dat.loc, "cc")
expect_equal(length(lines.result.cc.test), 2)
expect_match(lines.result.cc.test[1] , "d <- 4")
expect_true(startsWith (lines.result.cc.test[2] , "if (d == 4)"))

test_that ("Multiple statement on one line", {
  skip ("Column numbers are currently ignored")
  lines.result.b.test <- clean.prov (lines.dat.loc, "b")
  expect_equal(length(lines.result.b.test), 1)
  expect_match(lines.result.b.test[1] , "b <- 2")
})

#####################
# Error checking

context ("Error checking")

# List to clean is not allowed
expect_warning (clean (c ("x", "y")))

# Input is not provenance
error.dat.loc <- system.file("exec", "micro.R", package="Rclean")
options(prov.json = readLines(error.dat.loc))
expect_error (clean())

# Script cannot be found
noscript.dat.loc <- system.file("exec", "prov.json", package="Rclean")
options(prov.json = readLines(noscript.dat.loc))
expect_error (clean())

