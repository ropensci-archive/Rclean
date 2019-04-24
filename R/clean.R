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

#'clean --- Clean code.
#'
#' Reduce the size and complexity of a analytical script through
#' algorithmic detection of the essential code needed to produce a set
#' of results.
#' 
#'@param file File path to a script.
#'@param var The name of a variable of interest.
#'@param libs LOGICAL: should library dependencies be detected and included?
#'@param plot LOGICAL: should a network diagram of the cleaned script be produced?
#'@return A character vector containing a minimized script based on the given input variable.
#'@importFrom CodeDepends getInputs
#'@importFrom CodeDepends readScript
#'@export clean
#'@author Matthew K. Lau

clean <- function(file, var, libs = TRUE, plot = FALSE){
    if (missing(file)){
        warning("Please provide a script file path.")
    }else{
        if (missing(var)){
            warning("Please supply a variable/object name")
            rownames(var.lineage(readScript(file))[["g"]])
        }else{
            src <- readScript(file)
            vl <- var.lineage(src)
            sp <- p.spine(vl, var)
            min.g <- vl[["g"]][rownames(vl[["g"]]) %in% as.character(sp), 
                               colnames(vl[["g"]]) %in% as.character(sp)]
            sp <- sp[sp %in% as.character(unique(vl[["vdf"]][, "step"]))]
            sp <- sort(as.numeric(sp))
            min.src <- as.character(src[sp])
            if (libs){
                libs <- na.omit(unlist(get.libs(src)[sp]))
                lib.src <- paste0("library(", libs, ")")
                out <- c(lib.src, min.src)
            }else{
                out <- min.src
            }
            if (plot){
                codeGraph(min.g)
            }
            return(out)
        }
    }
}
