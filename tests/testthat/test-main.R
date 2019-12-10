test_that("clean prospective data.frame", {
    load("clean.simple.out.test.rda")
    simple.script <- system.file(
        "example", "simple_script.R", package = "Rclean")
    clean.simple.out <- clean(simple.script, "out")
    expect_true(all(clean.simple.out == clean.simple.out.test))
})


test_that("get_libs", {
    load("lib.test.rda")
    script <- readScript("lib_test.R")
    lib <- get_libs(script)
    expect_true(all(lib[1:2] == lib.test[1:2]))
})


test_that("clean no re-formatting", {
    load("format.simple.out.test.rda")
    simple.script <- system.file(
        "example", "simple_script.R", package = "Rclean")
    format.simple.out <- clean(simple.script, "out", format = FALSE)
    expect_true(all(format.simple.out == format.simple.out.test))
})

test_that("clean multiple variables", {
    load("clean.multi.test.rda")
    script <- system.file("example", "simple_script.R", package = "Rclean")
    simple.script <- readScript(script)
    vars <- c("tab.15", "out")
    clean.multi <- clean(simple.script, vars, format = FALSE)
    expect_true(all(clean.multi == clean.multi.test))
})

test_that("clean no vars", {
    load("novars.test.rda")
    simple.script <- system.file(
        "example", "simple_script.R", package = "Rclean")
    novars.out <- capture.output(clean(simple.script))
})

test_that("clean get_path g is list mode", {
    load("glist.test.rda")
    script <- system.file("example", "simple_script.R", package = "Rclean")
    vl <- Rclean:::var_lineage(readScript(script))
    glist.out <- Rclean:::get_path(vl, "out")
    expect_true(all(glist.out == glist.test))
})

test_that("clean get_path missing node id", {
    load("noid.test.rda")
    script <- system.file("example", "simple_script.R", package = "Rclean")
    vl <- Rclean:::var_lineage(readScript(script))
    noid.out <- testthat:::capture_output({Rclean:::get_path(vl)}, 
                                          print = FALSE)
    expect_true(all(noid.out == noid.test))
})


test_that("codeGraph as file", {
    load("codeGraph.src.rda")
    simple.script <- system.file(
        "example", "simple_script.R", package = "Rclean")
    output.cap <- capture.output(
        code_graph(simple.script)
    )
    expect_true(length(output.cap) == 0)
})

test_that("codeGraph as script", {
    load("codeGraph.src.rda")
    simple.script <- system.file(
        "example", "simple_script.R", package = "Rclean")
    simple.script <- readScript(simple.script)
    output.cap <- capture.output(
        code_graph(simple.script)
    )
    expect_true(length(output.cap) == 0)
})

test_that("codeGraph write pdf", {
    simple.script <- system.file(
        "example", "simple_script.R", package = "Rclean")
    code_graph(simple.script, pdf.file = "code_graph_test.pdf")
    expect_true(file.exists("code_graph_test.pdf"))
    file.remove("code_graph_test.pdf")
})


test_that("keep write", {
    load("keep.test.rda")    
    keep(clean.simple.out, file = "clean.simple.test.R")
    keep.test <- readLines("clean.simple.test.R")
    file.remove("clean.simple.test.R")
    expect_true(all(keep.test == clean.simple.out))
})

test_that("get_vars as path", {
    load("vars.out.rda")
    script <- system.file(
        "example", 
        "simple_script.R", 
        package = "Rclean")
    vars.test <- get_vars(script)
    expect_true(all(vars.test == vars.out))
})

test_that("get_vars as script", {
    load("vars.out.rda")
    script <- system.file(
        "example", 
        "simple_script.R", 
        package = "Rclean")
    script <- readScript(script)
    vars.test <- get_vars(script)
    expect_true(all(vars.test == vars.out))
})



