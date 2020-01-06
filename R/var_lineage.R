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
# along with Rclean; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# Contact: Matthew Lau <matthewklau@fas.harvard.edu>


#' var_lineage --- Determine the lineage of objects contained in an R
#' script.
#'
#' Determine the series of steps that leads to the production of
#' objects contained in a script.
#' 
#' @param src A Script object from readScript the CodeDepends
#'     package.
#' @return A list containing a graph (g) describing the lineage of
#'     objects with steps (i.e. complexes of function and operation
#'     calls) listed as numbers that "use" or "create" data objects
#'     and a variable data frame (vdf) containing details of the
#'     variables (var) and, possibly, unique identifiers (uid) that
#'     were used or created by each step.
#' @importFrom CodeDepends getDetailedTimelines
#' @importFrom CodeDepends getInputs
#' @noRd
#' @author Matthew K. Lau

var_lineage <- function(src = "script") {
    ## variable data frame
    vdf <- getDetailedTimelines(info = getInputs(src))
    rownames(vdf) <- seq(1, nrow(vdf))
    ## lineage graph
                                        # defined by
    def_by <- do.call(cbind, 
                      split(as.numeric(vdf[, "defined"]), 
                            vdf[, "var"]))
    rownames(def_by) <- seq(1, nrow(def_by))
                                        # used by
    use_by <- do.call(cbind, 
                      split(as.numeric(vdf[, "used"]), 
                            vdf[, "var"]))
    rownames(use_by) <- seq(1, nrow(use_by))
                                        # full lineage graph
                                        # adding empty subgraphs
    def_by <- cbind(
        array(0, dim = rep(nrow(def_by), 2)), 
        def_by
    )
    colnames(def_by)[seq(1, nrow(def_by))] <- seq(1, nrow(def_by))
    use_by <- cbind(
        t(use_by), 
        array(0, dim = rep(ncol(use_by), 2))
    )
                                        # sub-graph range
    sg_range <- seq((ncol(use_by) - nrow(use_by) + 1), ncol(use_by))
                                            # rename nodes
    colnames(use_by)[sg_range] <- rownames(use_by)
    lg <- rbind(def_by, use_by)
    out <- list(g = lg, vdf = vdf)
    return(out)
}
