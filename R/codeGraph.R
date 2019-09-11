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

#'codeGraph --- A network diagram of computational dependencies. 
#'
#' Plot the dependencies among functions and objects for a given script.
#' 
#'@param g Matrix representation of the graph.
#'@return A network plot.
#'@importFrom igraph graph_from_adjacency_matrix
#'@importFrom igraph igraph.to.graphNEL
#'@importFrom Rgraphviz plot
#'@export codeGraph
#'@author Matthew K. Lau


codeGraph <- function(g){
    ig <- graph_from_adjacency_matrix(g)
    gNEL <- igraph.to.graphNEL(ig)
    Rgraphviz::plot(gNEL)
}
