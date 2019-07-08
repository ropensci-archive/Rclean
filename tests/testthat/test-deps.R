## get.libs 
test_that("Check get.libs", {
    load("libs.test.rda")
    libs <- clean("./lib_test.R", "out")
    expect_true(all(libs == libs.test))
})

## read.prov
test_that("Check read.prov", {
    load("prov.test.rda")
    prov <- read.prov("micro_R.json")
    expect_true(all(unlist(prov) == unlist(prov.test)))
})


## parse.graph
test_that("Check parse.graph", {
    load("prov.g.test.rda")
    prov.json <- fromJSON("micro_R.json")
    prov.g <- parse.graph(prov.json)
    expect_true(all(prov.g == prov.g.test))
})

## var.lineage
test_that("Check variable lineage", {
    load("vl.test.rda")
    src <- readScript("simple_script.R")
    vl <- var.lineage(src)
    expect_true(all(unlist(vl) == unlist(vl.test)))
})


## p.spine
test_that("Check parentage sub-graph", {
    load("sp.test.rda")
    src <- readScript("simple_script.R")
    vl <- var.lineage(src)
    sp <- p.spine(vl, "out")
    expect_true(all(sp == sp.test))
})

test_that("Check parentage sub-graph length", {
    load("sp.test.rda")
    src <- readScript("simple_script.R")
    vl <- var.lineage(src)
    sp <- p.spine(vl, "out")
    expect_true(length(sp) == length(sp.test))
})


## get.spine
test_that("Check get.spine", {
    load("s.test.rda")
    var <- "x"
    prov <- read.prov("micro_R.json")
    node.id <- tail(n = 1,
                    rownames(prov$info$entity)[
                        prov$info$entity[,1] == var]
                    )
    s <- get.spine(node.id, prov$g)
    expect_true(all(s == s.test))
})

## ## parse.info
test_that("Check parse.info", {
    load("pi.test.rda")
    prov <- fromJSON("micro_R.json")
    pi <- parse.info(prov)
    expect_true(all(unlist(pi) == unlist(pi.test)))
})

## ## var.id
## test_that("Check var.id", {
##     load("vid.test.rda")
##     vid <- 
##     expect_true(all( == .test))
## })
