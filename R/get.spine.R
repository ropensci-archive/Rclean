#' .get.spine --- Find the minimal path through the provenance necessary to 
#' produce a result.
#'
#' OUTPUT = A vector with the set of nodes of the minimal path.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param node.id Name of the node.
#' @param g Provenance graph.
#' @return A set of node names tracing the complete parantage of a result.
#' @author Matthew K. Lau
#' @importFrom igraph bfs

get.spine <- function(node.id,g){
    ig <- graph_from_adjacency_matrix(g)
    names(na.omit(bfs(ig,root = node.id, neimode = c('out'),unreachable = FALSE)$order))
}
