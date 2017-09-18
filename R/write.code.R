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

write.code <- function(x,file = NULL){
    if (is.null(file)){
        file <- getwd()
    }else{
        
    }
    
}
