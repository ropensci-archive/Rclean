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

#' path --- Lineage pathway for a given variable.
#'
#' Isolates the lineage for an variable. This can be either all steps
#' leading to the creation of a variable or all descendent steps that
#' use that variable.
#' 
#' @param g An adjacenty matrix that presents the use and creation of
#'     variables by steps (i.e. complexes of function and operation
#'     calls).
#'@param node.id The name of the variable of interest.
#'@param direction Determines the direction of searching on the graph,
#'     either "in" (path leading to a variable) or "out" (path leading
#'     from a variable).
#'@param sep Character string used as a separator in the unique IDs of
#'     object nodes.
#'@return A character vector of steps and objects found along the path
#'     for the object identified by the node ID.
#'@importFrom igraph graph_from_adjacency_matrix
#'@importFrom igraph dfs
#'@noRd
#'@author Matthew K. Lau

path <- function(g = "graph", 
                 node.id, 
                 direction = "in"){
    if (mode(g) == "list" & any(names(g) == "g")){g <- g[["g"]]}
    if (all(!(grepl(sep, rownames(g))))){sep <- ""}
    if (missing(node.id)){
        warning("Please supply a node name.")
        print("Possible node names:", quote = FALSE)
        rownames(g)[!(is.number(rownames(g)))]
    }else{
        ig <- graph_from_adjacency_matrix(g)
        dfs.result <- dfs(ig, node.id, 
                       direction, 
                       unreachable = FALSE)$order
        out <- as.character(na.omit(names(dfs.result)))
        if (direction == "in"){out <- out[length(out):1]}
    }
}

## Detect numbers in a character vector of variables.
is.number <- function(x) {
    out <- logical()
    for (i in seq_along(x)) {
        out[i] <- !(any(
               strsplit(x[i], split = "")[[1]] %in% 
               c(letters, LETTERS)
           ))
    }
    return(out)
}
