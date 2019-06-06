## clean.R
## get.libs.R 
## parse.graph.R
## p.spine.R
## rmd2chunks.R
## var.lineage.R
## codeGraph.R
## get.spine.R
## parse.info.R
## read.prov.R
## var.id.R
## write.code.

# Prospective Provenance (i.e. rp = FALSE)
test_that("clean options prospective", {
    load("opt.test.rda")
    opt <- clean("simple_script.R")
    expect_true(all(opt == opt.test))
})

test_that("clean prospective data.frame", {
    load("clean.simple.out.test.rda")
    clean.simple.out <- clean("simple_script.R", "out")
    expect_true(all(clean.simple.out == clean.simple.out.test))
})


test_that("clean libs prospective", {
    load("lib.test.rda")
    lib <- clean("lib_test.R", "out")
    expect_true(all(lib[1:2] == lib.test[1:2]))
})


test_that("clean prospective no re-formatting", {
    load("format.simple.out.test.rda")
    format.simple.out <- clean("simple_script.R", "out")
    expect_true(all(format.simple.out == format.simple.out.test))
})


# Retrospective Provenance (i.e. rp = TRUE)
## provR
## test_that("check provenance storage", {
##     options(prov.json = readLines("micro_R.json"))
##     prov <- read.prov(options()$prov.json)
##     expect_match(mode(prov), "list")
##     expect_equal(length(prov), 2)
## })

## test_that("Provenance graph", {
##     options(prov.json = readLines("micro_R.json"))
##     prov <- read.prov(options()$prov.json)
##     expect_match(mode(prov$graph), "numeric")
##     expect_match(class(prov$graph), "matrix")
## })

## test_that("Provenance info", {
##     options(prov.json = readLines("micro_R.json"))
##     prov <- read.prov(options()$prov.json)
##     expect_equal(length(prov$info), 3)
## })

## test_that("Code cleaning: initiate", {
##     options(prov.json = readLines("micro_R.json"))
##     micro.test <- clean(rp = TRUE)
##     expect_equal(length(micro.test), 2)
##     expect_match(mode(micro.test), "list")
##     expect_match(names(micro.test)[2], "Objects")
##     expect_match(micro.test$Files[1], "test.test")
##     expect_match(micro.test$Files[2], "test.pdf")
##     expect_match(micro.test$Objects[1], "x")
##     expect_match(micro.test$Objects[2], "y")
## })

## test_that("Code cleaning: get result", {
##     micro.result.x.test <- clean(var = "x")
##     expect_match(micro.result.x.test[1] , "x <- 1")
##     expect_match(micro.result.x.test[2] , "y <- 3")
##     expect_match(micro.result.x.test[3] , "x <- x \\+ y")
##     micro.result.y.test <- clean(var = "y")
##     expect_match(micro.result.y.test[1] , "y <- 3")
##     micro.result.test_test.test <- clean(var = "test.test")
##     expect_match(micro.result.test_test.test[1], "x <- 1")
##     expect_match(micro.result.test_test.test[2], "y <- 3")
##     expect_match(micro.result.test_test.test[3], "x <- x \\+ y")
##     expect_match(micro.result.test_test.test[4], "write\\.csv\\(x, \"~/test\\.test\"\\)")

##     micro.result.test_pdf.test <- clean(var = "test.pdf")
##     expect_match(micro.result.test_pdf.test[1], "x <- 1")
##     expect_match(micro.result.test_pdf.test[2], "y <- 3")
##     expect_match(micro.result.test_pdf.test[3], "x <- x \\+ y")
##     expect_match(micro.result.test_pdf.test[4], "pdf\\(\"~/test.pdf\"\\)" )
##     expect_match(micro.result.test_pdf.test[5], "plot\\(x\\)")
##     expect_match(micro.result.test_pdf.test[6], "dev.off()")
## })

## test_that("Code cleaning: prospective prov", {
##     simple_script.loc <- system.file("exec", "simple_script.R", package="Rclean")
##     clean.test <- clean(simple_script.loc, "dat")
##     expect_match(clean.test[1], "library()")
##     expect_match(clean.test[2], "dat <- read.csv(\"../data/data.csv\")")
##     expect_match(clean.test[3], "dat[, \"X2\"] <- dat[, \"X2\"] + runif(nrow(dat))")
##     expect_match(clean.test[4], "dat[, \"X5\"] <- gl(10, 10)")
##     expect_match(clean.test[5], "dat <- 25 + 2")
##     expect_match(clean.test[6], "dat[2] <- 10")
## })
