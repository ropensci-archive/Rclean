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
#' 
#' @importFrom RDataTracker ddg.run
#' @export cleanR


library(jsonlite)
library(RDataTracker)
library(igraph)
source("../R/parse.graph.R")
source("../R/parse.info.R")
source("../R/read.prov.R")
source("../R/get.spine.R")
result <- "plot_xy.png"
script.path <- "simple.R"


cleanR <- function(result,
                   script,
                   save.comments = FALSE){
    ws <- "R_clean"
    dir.create(ws)
    ## Get provenance for script
    ddg.run(script.path,ddgdir = paste0(ws,"/.prov"))
    prov <- .read.prov(paste0(ws,"/.prov/ddg.json"))
    ## Breadth first search for code spine
    node.id <- names(which(prov$info$entity[,"rdt:name"] == result))
    spine <- .get.spine(node.id, prov$g)
    ## min.code == the minimum code to produce the output
    script <- readLines(script.path)
    lines <- prov$info$activity[grep("p",spine,value = TRUE),
                                c("rdt:startLine","rdt:endLine")]
    lines <- lines[order(
        as.numeric(
            gsub("p","",rownames(lines))),
        decreasing = FALSE),]
    lines <- cbind(process = rownames(lines),lines)
    lines[,2:3] <- apply(lines[,2:3],2,as.numeric)
    min.script <- character(0)
    for (i in 1:nrow(lines)){
        if (lines[i,2][[1]] != lines[i,3][[1]]){
            min.script <- c(min.script,script[unlist(lines[i,2:3])])
        }else{
            min.script <- c(min.script,script[unlist(lines[i,2])])
        }
    }
    ## Change the result line in the script
    if (grepl("dev.off",tail(min.script,1))){
        i <- tail(grep(result,min.script),1)
        gd <- strsplit(min.script[i],"\\(")[[1]][1]
        min.script[i] <- paste0(gd,"(\"","results/",result,"\")")
    }
    ## Save result to results
    dir.create(paste0(ws,"/results"))
    file.copy(grep(result,dir(paste0(ws,"/.prov/data"), full.names = TRUE),value = TRUE),
              paste0(ws,"/results/",result))
    ## Re-organize data
    dir.create(paste0(ws,"/data"))
    min.data <- data.frame(prov$info$entity[rownames(prov$info$entity) %in% spine,])
    min.data <- min.data[min.data[,"rdt.type"] == "File",]
    min.data <- min.data[!(grepl(result,min.data[,"rdt.name"])),]
    for (i in 1:length(min.data[,"rdt.value"])){
        cp.dat <- paste0(ws,"/.prov/",min.data[i,"rdt.value"][[1]])
        file.copy(cp.dat,
                  paste0(ws,"/data/",min.data[i,"rdt.name"]))
    }
    ## Write to src
    dir.create(paste0(ws,"/src"))
    out.file <- paste0(ws,"/src/",gsub("\\.","_",result),".R")
    file.create(out.file)
    fileConn <- file(out.file)
    writeLines(min.script, fileConn)
    close(fileConn)
    file.show(out.file)
    ## Check with lintr
    ## Format with formatR
    ## Option: create data directory
    ## Option: output metadata
    ## Option: gather dependencies
    ## Option: create a log from formatR and lintR
    ## Option: create a README
    ## Remove provenance
}
