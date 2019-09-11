# Copyright (C) 2017 Harvard University, Mount Holyoke College
#
# This file is part of Rclean
#
# Rclean is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# Rclean is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Rclean; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# Contact: Matthew Lau <matthewklau@fas.harvard.edu>


#' .parse.graph --- Parses the PROV-JSON formatted output
#' OUTPUT = A symmetric matrix of provenance entity relationships.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param prov PROV-JSON formatted provenance.
#' @param rm.env LOGICAL: should the environment entity be removed?
#' @return A symmetric matrix of provenance entity relationships.
#' @author Matthew K. Lau
#' @export 
#' @examples
#'  data(prov_json)
#'  prov <- jsonlite::fromJSON(prov_json)
#'  parse.graph(prov)

parse.graph <- function(prov,rm.env = TRUE){
    if (grepl("rdatatracker", prov[[1]][[2]]) | grepl("provR", prov[[1]][[2]])){
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
