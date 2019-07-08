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
test_that("check provenance storage", {
    options(prov.json = readLines("micro_R.json"))
    prov <- read.prov(options()$prov.json)
    expect_match(mode(prov), "list")
    expect_equal(length(prov), 2)
})

test_that("Provenance graph", {
    options(prov.json = readLines("micro_R.json"))
    prov <- read.prov(options()$prov.json)
    expect_match(mode(prov$graph), "numeric")
    expect_match(class(prov$graph), "matrix")
})

test_that("Provenance info", {
    options(prov.json = readLines("micro_R.json"))
    prov <- read.prov(options()$prov.json)
    expect_equal(length(prov$info), 3)
})

test_that("clean RP options", {
    load("rp.options.test.rda")
    options(prov.json = readLines("micro_R.json"))
    rp.options <- clean("micro.R", rp = TRUE)
    expect_true(all(rp.options == rp.options.test))
})

test_that("clean RP x", {
    load("rp.clean.x.test.rda")
    options(prov.json = readLines("micro_R.json"))
    rp.clean.x <- clean("micro.R", "x", rp = TRUE)
    expect_true(all(rp.clean.x == rp.clean.x.test))
})

test_that("clean RP y", {
    load("rp.clean.y.test.rda")
    options(prov.json = readLines("micro_R.json"))
    rp.clean.y <- clean("micro.R", "y", rp = TRUE)
    expect_true(all(rp.clean.y == rp.clean.y.test))
})


## test_that("rmd2chunks", {
##     load("rmd.file.rda")
##     load("rmd.chunks.test.rda")
##     rmd.chunks <- rmd2chunks(rmd.file)
##     expect_true(all(rmd.chunks == rmd.chunks.test))
## })

test_that("codeGraph", {
    load("codeGraph.src.rda")
    vl <- var.lineage(src)
    sp <- p.spine(vl, "out")
    min.g <- vl[["g"]][rownames(vl[["g"]]) %in% as.character(sp), 
                       colnames(vl[["g"]]) %in% as.character(sp)]
    output.cap <- capture.output(codeGraph(min.g))
    expect_true(length(output.cap) == 0)
})

test_that("read.prov", {
    load("read.prov.test")
    prov <- read.prov("micro_R.json")
    expect_true(all(unlist(prov) == unlist(prov.test)))
})


test_that("write.code", {
    load("write.code.test.rda")    
    write.code(clean.simple.out, file = "clean.simple.test.R")
    write.code.test <- readLines("clean.simple.test.R")
    file.remove("clean.simple.test.R")
    expect_true(all(clean.simple.out == write.code.test))
})

