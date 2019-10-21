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
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.
#
# Contact: Matthew Lau <matthewklau@fas.harvard.edu>

#' clean --- Clean code.
#'
#' Reduce the size and complexity of a analytical script through
#' algorithmic detection of the essential code needed to produce a set
#' of results.
#'
#' @param file File path to a script.
#' @param vars The name of the variable(s) of interest.
#' @param format LOGICAL: should the minimized code be re-formatted
#'     following common syntax?
#' @return A character vector containing a minimized script based on
#'     the given input variable.
#' @importFrom CodeDepends readScript
#' @importFrom formatR tidy_source
#' @importFrom styler style_text
#' @export clean
#' @author Matthew K. Lau
#' @examples
#' script <- readScript(
#'     system.file(
#'         "example", 
#'         "simple_script.R", 
#'         package = "Rclean"))
#' clean(script)
#' clean(script, "mat")
#' clean(script, "tab.12")
#' clean(script, "out")

clean <- function(file, vars, format = TRUE){
    ## Check if file is passing a script object
    if (class(file) == "Script"){
        src <- file
    }else{
        src <- readScript(file)
    }
    ## Check if a variable has been supplied, then find
    ## minimal code.
    if (missing(vars)){
        print(paste("Please supply at least one variable:"))
        out <- unique(getVariables(src))
    }else{
        ## Define the lineage for all variables
        vl <- var_lineage(src)
        ## Reduce to the minimal code
        out <- min_code(vars, vl)
        ## Reformat?
        if (format){out <- style_text(out)}
    }
    return(out)
}

#' min_code --- Get the minimum code from a script.
#'
#' Extract the minimal code for required for one or more variables
#' from a longer script.
#'
#' @param vars The name of the variable(s) of interest.
#' @param vl Variable lineage for all variables in a graph.
#' @noRd
#' @author Matthew K. Lau
min_code <- function(vars = "variables", 
                     vl = "variable lineage") {
    
    ## Find the lines and variables for all vars
    vp <- sapply(vars, get_path, g = vl[["g"]])
    vp <- unique(unlist(vp))
    ## Subest the graph to only required nodes
    min.g <- vl[["g"]][rownames(vl[["g"]]) %in% vp, 
                       colnames(vl[["g"]]) %in% vp]
    cl <- as.character(unique(vl[["vdf"]][, "step"]))
    vp <- vp[vp %in% cl]
    vp <- sort(as.numeric(vp))
    out <- as.character(src[vp])
    return(out)
}

