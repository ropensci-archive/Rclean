#' cleanR --- Produce "clean" code.
#' OUTPUT = A workspace containing a cleanced script and associated
#' data files.
#' 
#' Produces simplifed, "cleaned" code that generates
#' a set of output from an initial, "draft" script. 
#' 
#' @param script A source script.
#' @param result.list A vector or list of result file names.
#' @param save.comments LOGICAL: should comments be preserved in cleaned code?
#' @return Workspace with the minimal code needed to produce the
#' specified results.
#' @author Matthew K. Lau
#' @examples
#' 
#' ### NOT RUN ###
#' 
#' 
#' @importFrom RDataTracker ddg.run
#' @export cleanR


cleanR <- function(result,
                   script, 
                   save.comments = FALSE){

    library(jsonlite)
    library(RDataTracker)
    library(igraph)
    source("../R/parse.graph.R")
    source("../R/parse.info.R")
    source("../R/read.prov.R")
    source("../R/get.spine.R")
    result <- "plot_xy.png"
    script.path <- "simple.R"
    ws <- "R_clean"


    #' Outline:
    #' Input result path
    #' Input script path
    #' Create workspace
    dir.create(wd)
    #' Get provenance for script
    ddg.run(script.path,ddgdir = ws)
    prov <- .read.prov(paste0(ws,"/ddg.json"))
    #' Breadth first search for code spine
    node.id <- names(which(prov$info$entity[,"rdt:name"] == result))
    spine <- .get.spine(node.id, prov$g)

    #' min.code
    script <- readLines(script.path)
    rownames(script) <- rownames(prov$info$activity),
    
    prov$info$entity

    min.code <- script[]

    #' Check with lintr

    #' Format with formatR
    #' Option: create data directory
    #' Option: output metadata
    #' Option: gather dependencies
    #' Option: create a log from formatR and lintR
    #' Option: create a README


}
