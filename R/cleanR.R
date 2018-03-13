#' cleanR --- Produce "clean" code.
#' OUTPUT = The essential code needed to produce a result.
#' 
#' Produces simplifed, "cleaned" code that is needed to create a result.
#' 
#' @param result A desired output present in the script.
#' @param file Path to an R script.
#' @param tidy LOGICAL: should the cleaned script be formatted using syntax best practices?
#' @return Cleaned-up code as a vector of strings ordered by line number.
#' @importFrom provR prov.json
#' @importFrom provR prov.capture
#' @importFrom formatR tidy_source
#' @export cleanR
#' @author Matthew K. Lau

cleanR <- function(result = "Name of desired result",
                   file = "Path to script", 
                   tidy = TRUE){
    ## Make sure result is of length 1
    result <- result[1]
    if (length(result) != 1){
        warning("Please enter one result at a time.", quote = FALSE)
    }
    ## Get provenance for script
    if (file == "Path to script"){
        if ("cleanR.file" %in% names(options())){
            file <- options("cleanR.file")[[1]]
            refresh.prov <- FALSE
        }else{
            print("Please specify the file pathway to a script")
        }
    }else {
        options("cleanR.file" = file)
        refresh.prov <- TRUE
    }
    ## Refreshing provenance
    if (refresh.prov){
        prov.capture(file)
    }else{}
    prov <- read.prov(prov.json())
    ## Get result options
    ## Output files
    result.files <- unlist(
        prov$info$entity[prov$info$entity[,4] == "File", 1]
        )
    ## Remove files that are inputs
    result.files <- result.files[names(result.files) %in% names(which(apply(prov$graph,2,sum) == 0))]
    result.files <- as.character(result.files)
    ## Get objects for suggested results    
    result.obj <- unlist(prov$info$entity[,1])
    ## Removing dev.off calls
    result.obj <- result.obj[!(grepl("dev.", result.obj) &  prov$info$entity[,2] == "\"graph\"")]
    ## Remove output files
    result.obj <- result.obj[names(result.obj) %in% rownames(prov$info$entity)[prov$info$entity[,4] != "File"]]
    result.obj <- as.character(result.obj)
    ## Combine vectors
    result.opts <- list(Files = unique(result.files), Objects = unique(result.obj))
    ## If result is NULL then prompt
    if ((result == "Name of desired result") | !(result %in% unlist(result.opts))){
        print("Possible results:", 
              quote = FALSE)
        ## Convert to simple character vector
        result.opts
    }else{
        ## Get the node that matches the result name
        node.id <- tail(n = 1,
                        rownames(prov$info$entity)[prov$info$entity[,1] == result][]
                        )
        ## Graph search for the path from the result to inputs
        spine <- get.spine(node.id, prov$g)
        ## min.script == the minimum code to produce the output
        script <- readLines(file)
        ## Get the line numbers from the original source code
        lines <- prov$info$activity[grep("p",spine, value = TRUE),
                                    grep("Line", colnames(prov$info$activity))]
        ### If the result is created on a single line, coerce to a matrix
        if (length(grep("p", spine)) == 1){
            lines <- as.numeric(lines)
            lines <- t(as.matrix(lines))
        }else{lines <- apply(lines, 2, as.numeric)}
        rownames(lines) <- grep("p", spine, val = TRUE)
        ## Remove processes which don't involve the creation of data
        rm.p <- sapply(prov$info$activity[,1], 
                       function(p, d) any(sapply(d, grepl, x = p)), 
                       d = prov$info$entity[,1])
        rm.p <- names(rm.p)[!(rm.p)]
        lines <- lines[!(rownames(lines) %in% rm.p),]
        ## If a single process, re-matricize, else re-order ascending 
        if (length(grep("p", spine)) == 1){
            lines <- as.numeric(lines)
            lines <- t(as.matrix(lines))
        }else{
            node.rank <- as.numeric(gsub("p", "", rownames(lines)))
            lines <- lines[order(node.rank),]
        }
        ### Extract the minimal code
        min.script <- apply(lines, 1, function(line, src)  
            src[seq(line[1], line[2])],
                            src = script)
        min.script <- unlist(min.script)
        ### Tidying the code using formatR
        if (tidy){
            capture.output(
                min.script <- 
                    tidy_source(text = min.script)$text.tidy
                )
        }
        ### Return to user
        return(min.script)
        ## Signoff
        print("These codes are clean!", quote = FALSE)
    }
}
