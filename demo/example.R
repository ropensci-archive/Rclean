
if (tail(strsplit(getwd(),split = "\\/")[[1]],1) != "codecleanR"){
    warning("Set directory to codecleanR")
}else{
    sapply(dir("R",full = TRUE),source)
    library(RDataTracker)
    library(jsonlite)
    library(igraph)
}

setwd("~/messycode/")
cleanR("messycode.R","fig1_biplot.png","clean")



