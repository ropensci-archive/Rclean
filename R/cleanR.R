#' cleanR --- Produce "clean" code.
#' OUTPUT = A workspace containing a cleanced script and associated
#' data files.
#' 
#' Produces simplifed, "cleaned" code that generates
#' a set of output from an initial, "draft" script. 
#' 
#' @param file Path to an R script.
#' @param result A desired output present in the script.
#' @param save.comments LOGICAL: should comments be preserved in cleaned code?
#' @return Workspace with the minimal code needed to produce the
#' specified results.
#' @export cleanR
#' @author Matthew K. Lau
cleanR <- function(file = "Path to an R script",
                   result,
                   ws = "R_clean",
                   save.comments = FALSE){
    #' Outline:
    #' Input result path
    #' Input script path
    #' Create workspace
    print(getwd())
    dir.create(ws)
    ## Get provenance for script
    ddg.run(file,ddgdir = paste0(ws,"/.prov"))
    prov <- read.prov(paste0(ws,"/.prov/ddg.json"))
    ## If result is NULL then prompt
    r.opts <- as.character(unlist(prov$info$entity[(rownames(prov$info$entity) %in% 
                                                    rownames(prov$graph)[(apply(prov$graph,1,sum) != 0)] &
                                                        prov$info$entity[,"rdt:type"] == "File"),"rdt:name"]))
    if (!("result" %in% ls())){}else{
        if (!(result %in% r.opts)){rm(result)}else{}
    }
    while (!("result" %in% ls())){
        ## Detect nodes that are not input data and have on of 
        ## the result function tags
        print("Choose a result (CTRL-C CTRL-C to quit):")
        print(r.opts)
        usr.opt <- readline()
        if (usr.opt %in% r.opts){
            result <- usr.opt
        }else{}
    }
    ## Breadth first search for code spine
    node.id <- names(which(prov$info$entity[,"rdt:name"] == result))
    spine <- get.spine(node.id, prov$g)
    ## min.script == the minimum code to produce the output
    script <- readLines(file)
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
    ## Add working directory header to script
    min.script <- c("### The main project directory should be the working directory",
                    "### See setwd()",
                    min.script)
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
