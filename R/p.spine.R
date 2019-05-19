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

#'p.spine --- Parenatage spine for a given object.
#'
#' Isolates the line of parentage for an object. This can be either
#' all steps leading to an object or all steps leading out from an
#' object.
#' 
#'@param g A graph in matrix formate that presents the use and
#'     creation of variables by steps (i.e. complexes of function and
#'     operation calls).
#'@param node.id The name of the node of interest.
#'@param direction Determines the direction of searching on the graph,
#'     either "in" or "out".
#'@param sep Character string used as a separator in the unique IDs of
#'     object nodes.
#'@return A character vector of steps and objects found along the path
#'     for the object identified by the node ID.
#'@importFrom igraph graph_from_adjacency_matrix
#'@importFrom igraph dfs
#'@export p.spine
#'@author Matthew K. Lau

p.spine <- function(g = "graph", 
                    node.id, 
                    direction = "in", 
                    sep = "_"){
    if (mode(g) == "list" & any(names(g) == "g")){g <- g[["g"]]}
    if (all(!(grepl(sep, rownames(g))))){sep <- ""}
    if (missing(node.id)){
        warning("Please supply a node name.")
        print("Possible node names:", quote = FALSE)
        rownames(g)[grepl(sep, rownames(g))]
    }else{
        ig <- graph_from_adjacency_matrix(g)
        dfs.out <- dfs(ig, node.id, 
                       direction, 
                       unreachable = FALSE)$order
        as.character(na.omit(names(dfs.out)))
    }
}
