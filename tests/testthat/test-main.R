# Prospective Provenance 
test_that("clean prospective data.frame", {
    load("clean.simple.out.test.rda")
    simple.script <- readScript(system.file(
        "example", "simple_script.R", package = "Rclean"))
    clean.simple.out <- clean(simple.script, "out")
    expect_true(all(clean.simple.out == clean.simple.out.test))
})


test_that("get_libs", {
    load("lib.test.rda")
    lib.test <- readScript("lib_test.R")
    lib <- get_libs(lib.test)
    expect_true(all(lib[1:2] == lib.test[1:2]))
})


test_that("clean no re-formatting", {
    load("format.simple.out.test.rda")
    simple.script <- readScript(system.file(
        "example", "simple_script.R", package = "Rclean"))
    format.simple.out <- clean(simple.script, "out", format = FALSE)
    expect_true(all(format.simple.out == format.simple.out.test))
})


test_that("codeGraph", {
    load("codeGraph.src.rda")
    vl <- var.lineage(src)
    sp <- p.spine(vl, "out")
    min.g <- vl[["g"]][rownames(vl[["g"]]) %in% as.character(sp), 
                       colnames(vl[["g"]]) %in% as.character(sp)]
    output.cap <- capture.output(codeGraph(min.g))
    expect_true(length(output.cap) == 0)
})


test_that("keep", {
    load("keep.test.rda")    
    keep(clean.simple.out, file = "clean.simple.test.R")
    keep.test <- readLines("clean.simple.test.R")
    file.remove("clean.simple.test.R")
    expect_true(all(keep.test == clean.simple.out))
})

