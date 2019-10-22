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
#' @param file File path to a script or a Script object from CodeDepends.
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
        ## Reduce to the minimal code
        out <- min_code(src, vars)
        ## Reformat code using styler?
        if (format){
            out <- style_text(out)
        }
    }
    return(out)
}

#' min_code --- Get the minimum code from a script.
#'
#' Extract the minimal code for required for one or more variables
#' from a longer script.
#'
#' @param src Script object.
#' @param vars The name of the variable(s) of interest.
#' @noRd
#' @author Matthew K. Lau
min_code <- function(src = "script", vars = "variables") {
    ## Define the lineage for all variables
    vl <- var_lineage(src)
    ## Find the lines and variables for all vars
    vp <- lapply(vars, get_path, g = vl[["g"]])
    ## Subest graphs with only required nodes for each var
    g.min <- min_graph(vp, vl)
    ## Create a set list of lines for subsetting
    l.min <- rownames(g.min)[is_number(rownames(g.min))]
    ## Subsest the code to the minimum lines
    out <- as.character(src[as.numeric(l.min)])
    return(out)
}

#' min_graph --- Minimize a graph to a list of paths.
min_graph <- function(vp = "variable path", vl = "variable lineage") {
    g.min <- vl[["g"]]
    nodes <- unique(unlist(vp))
    g.min <- g.min[rownames(g.min) %in% nodes, colnames(g.min) %in% nodes]
    return(g.min)
}

#' get_path --- Lineage pathway for a given variable.
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
#'@return A character vector of steps and objects found along the path
#'     for the object identified by the node ID.
#'@importFrom igraph graph_from_adjacency_matrix
#'@importFrom igraph dfs
#'@noRd
#'@author Matthew K. Lau

get_path <- function(g = "graph", 
                     node.id, 
                     direction = "in") {
    if (mode(g) == "list" & any(names(g) == "g")){
        g <- g[["g"]]
    }
    if (missing(node.id)){
        warning("Please supply a node name.")
        print("Possible node names:", quote = FALSE)
        rownames(g)[!(is_number(rownames(g)))]
    }else{
        ig <- graph_from_adjacency_matrix(g)
        dfs.result <- dfs(ig, node.id, 
                       direction, 
                       unreachable = FALSE)$order
        out <- as.character(na.omit(names(dfs.result)))
        if (direction == "in"){out <- out[length(out):1]}
    }
return(out)
}

## is_number --- Detect numbers in a character vector of variables.
is_number <- function(x) {
    out <- logical()
    for (i in seq_along(x)) {
        out[i] <- !(any(
               strsplit(x[i], split = "")[[1]] %in% 
               c(letters, LETTERS)
           ))
    }
    return(out)
}
