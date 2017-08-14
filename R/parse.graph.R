#' .parse.graph --- Prases the PROV-JSON formatted output
#' OUTPUT = A symmetric matrix of provenance entity reltionships.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param prov PROV-JSON formatted provenance.
#' @param rm.env LOGICAL: should the environment entity be removed?
#' @return A symmetric matrix of provenance entity relationships.
#' @author Matthew K. Lau

parse.graph <- function(prov,rm.env = TRUE){
    if (grepl("rdatatracker",prov[[1]][[2]])){
        ## prefix: information about the provenance capture mechanism
        ## activity: information about process nodes and environment
        ## environment contains information about dependencies
        ## entity: information about data nodes
        ## wasInformedBy: relations among processes
        ## p1 is the "Start" node 
        ## wasGeneratedBy: relations of data output from processes
        ## used: relations of data used input to processes
        nodes <- c(names(prov['activity'][[1]]),names(prov['entity'][[1]]))
        el <- rbind(do.call(rbind,lapply(prov["wasGeneratedBy"][[1]],unlist)),
                    do.call(rbind,lapply(prov["used"][[1]],unlist)))
        g <- matrix(0,nrow = length(nodes), ncol = length(nodes))
        rownames(g) <- colnames(g) <- nodes
        g[el] <- 1
        if (rm.env){
            g[rownames(g) != "environment",colnames(g) != "environment"]
        }else{
            g
        }
    }else{
        warning("Unknown provenance: ",prov[[1]][[2]])
    }
}
