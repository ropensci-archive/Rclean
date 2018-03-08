#' .get.spine --- Find the minimal path through the provenance necessary to 
#' produce a result.
#'
#' OUTPUT = A vector with the set of nodes of the minimal path.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param node.id Name of the node.
#' @param g Provenance graph adjacency matrix.
#' @return A set of node names tracing the complete parantage of a result.
#' @author Matthew K. Lau
#' @importFrom igraph bfs
#' @importFrom igraph graph_from_adjacency_matrix

get.spine <- function(node.id,g){
    ig <- graph_from_adjacency_matrix(g)
    nodes <- names(na.omit(bfs(ig, 
                               root = node.id, 
                               neimode = c('in'),
                               unreachable = FALSE)$order))
    if (length(nodes) == 1 & any(grepl("d",nodes))){
        nodes <- names(na.omit(bfs(ig, 
                                   root = node.id, 
                                   neimode = c('out'),
                                   unreachable = FALSE)$order))
        nodes <- grep("p", nodes, value = TRUE)
        nodes <- paste0("p",sort(as.numeric(do.call(rbind,strsplit(nodes,"p"))[,2])))
    }else{
        nodes <- names(na.omit(bfs(ig, 
                                   root = node.id, 
                                   neimode = c('in'),
                                   unreachable = FALSE)$order))
        nodes <- grep("p", nodes, value = TRUE)
        nodes <- paste0("p",sort(as.numeric(do.call(rbind,strsplit(nodes,"p"))[,2])))
    }
    return(nodes)
}
