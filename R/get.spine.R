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

#' get.spine --- Find the minimal path through the provenance necessary to 
#' produce a result.
#'
#' OUTPUT = A vector with the set of nodes of the minimal path.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param node.id Name of the node.
#' @param g Provenance graph adjacency matrix.
#' @return A set of node names tracing the complete parentage of a result.
#' @author Matthew K. Lau
#' @importFrom igraph dfs
#' @importFrom igraph graph_from_adjacency_matrix
#' @importFrom stats na.omit
#' @export
#' @examples
#' data(prov_json)
#' prov <- read.prov(prov_json)
#' get.spine("d1", prov$graph)

get.spine <- function(node.id, g){
    ig <- graph_from_adjacency_matrix(g)
    as.character(na.omit(names(dfs(ig, node.id, "out" , unreachable = FALSE)$order)))
}
