#' read.prov --- Read and parse provenance from a JSON file.
#' OUTPUT = Returns a dataframe containing the provenance.
#' 
#' This is an internal function for reading PROV-JSON formatted
#' provenance.
#' 
#' @param file JSON formatted object or path to PROV-JSON formatted file.
#' @return A list containing the provenance.
#' @author Matthew K. Lau
#' @importFrom jsonlite fromJSON
#' @export read.prov

read.prov <- function(file){
    prov <- fromJSON(file)
    g <- parse.graph(prov)
    info <- parse.info(prov)
    list(graph = g, info = info)
}

