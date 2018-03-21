#' .parse.info --- Parse node information from PROV-JSON.
#' OUTPUT = A matrix of node information.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param prov PROV-JSON formatted provenance.
#' @return A symmetric matrix of provenance entity relationships.
#' @author Matthew K. Lau
#' @examples
#' \dontrun{
#'  data(prov_json)
#'  prov <- read.prov(prov_json)
#'  parse.info(prov)
#' }

parse.info <- function(prov){
    if (grepl("rdatatracker",prov[[1]][[2]])){
        activity <- prov['activity'][[1]][names(prov['activity'][[1]]) != "environment"]
        environment <- prov['activity'][[1]][names(prov['activity'][[1]]) == "environment"]
        entity <- prov['entity'][[1]]
        list(activity = do.call(rbind,activity),
             environment = environment,
             entity = do.call(rbind,entity))
    }else{
        warning("Unknown provenance: ",prov[[1]][[2]])
    }
}
