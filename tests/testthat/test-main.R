test_that("clean prospective data.frame", {
    load("clean.simple.out.test.rda")
    simple.script <- system.file(
        "example", "simple_script.R", package = "Rclean")
    clean.simple.out <- clean(simple.script, "out")
    expect_true(all(clean.simple.out == clean.simple.out.test))
})


test_that("get_libs provide file path", {
    load("get_libs.filepath.test.rda")
    script <- system.file(
        "example", "long_script.R", package = "Rclean")
    filepath.out <- get_libs(script)
    expect_true(all(filepath.out == filepath.test))
})


test_that("get_libs provide script", {
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
    expect_true(all(novars.out == novars.test))
})

test_that("clean reproduce var", {
    long.script <- system.file(
        "example", "long_script.R", package = "Rclean")
    ## Clean some variables in long_script.R
    clean.x <- clean(long.script, "x")
    clean.x2 <- clean(long.script, "x2")
    clean.x3 <- clean(long.script, "x3")
    clean.x2x3 <- clean(long.script, c("x2", "x3"))
    clean.z <- clean(long.script, "z")
    keep(clean.x, "clean_x.R")
    keep(clean.x2, "clean_x2.R")
    keep(clean.x3, "clean_x3.R")
    keep(clean.x2x3, "clean_x2x3.R")
    keep(clean.z, "clean_z.R")
    ## Create environments
    env.long <- new.env()
    env.x <- new.env()
    env.x2 <- new.env()
    env.x3 <- new.env()
    env.x2x3 <- new.env()
    env.z <- new.env()
    ## Run scripts in separate environments
    set.seed(42)
    source(long.script, local = env.long)
    set.seed(42)
    source("clean_x.R", local = env.x)
    set.seed(42)
    source("clean_x2.R", local = env.x2)
    set.seed(42)
    source("clean_x3.R", local = env.x3)
    set.seed(42)
    source("clean_x2x3.R", local = env.x2x3)
    set.seed(42)
    source("clean_z.R", local = env.z)
    ## Compare variables to original script
    expect_true(all(c(env.long$x == env.x$x, 
                      all(env.long$x2 == env.x2$x2),
                      all(env.long$x3 == env.x3$x3),
                      all(env.long$x2 == env.x2x3$x2),
                      all(env.long$x3 == env.x2x3$x3),
                      all(env.long$z == env.z$z))))
    file.remove("clean_x.R", "clean_x2.R", "clean_x3.R",
                "clean_x2x3.R", "clean_z.R")
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
                                          print = TRUE)
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

