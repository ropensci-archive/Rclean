#' cleanR --- Produce "clean" code.
#' OUTPUT = The essential code needed to produce a result.
#' 
#' Produces simplifed, "cleaned" code that is needed to create a result.
#' 
#' @param file Path to an R script.
#' @param result A desired output present in the script.
#' @param refresh.prov LOGICAL: do you want the script re-run to generate new provenance?
#' @return 
#' @export cleanR
#' @author Matthew K. Lau

cleanR <- function(file = "Path to an R script",
                   result = "Result name",
                   refresh.prov = FALSE){
    #' Outline:
    #' Input result path
    #' Input script path
    ## Get provenance for script
    if (refresh.prov){prov.capture(file)}
    prov <- read.prov(prov.json())
    ## Get result options
    result.opts <- as.character(unlist(
        prov$info$entity[(rownames(prov$info$entity) %in% 
                          rownames(prov$graph)[(apply(prov$graph,1,sum) != 0)] &
                              prov$info$entity[,"rdt:type"] == "File"),"rdt:name"]))
    ## If result is NULL then prompt
    if ((result == "Result name")){
        print("Possible results:", quote = FALSE)
        result.opts
    }else{
            ## Breadth first search for code spine
        node.id <- names(which(prov$info$entity[,"rdt:name"] == result))
        spine <- get.spine(node.id, prov$g)
        ## min.script == the minimum code to produce the output
        script <- readLines(file)
        lines <- data.frame(prov$info$activity)[grep("p",spine,value = TRUE),
                                                c("rdt.startLine","rdt.endLine")]
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
        return(min.script)
        ## Signoff
        print("These codes are clean!", quote = FALSE)
    }
}
