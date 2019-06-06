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

#' clean --- Clean code.
#'
#' Reduce the size and complexity of a analytical script through
#' algorithmic detection of the essential code needed to produce a set
#' of results.
#' 
#'@param file File path to a script.
#'@param var The name of a variable of interest.
#'@param libs LOGICAL: should library dependencies be detected and
#'     included?
#'@param reformat LOGICAL: should the minimized code be re-formatted
#'     following common syntax?
#'@param plot LOGICAL: should a network diagram of the cleaned script
#'     be produced?
#'@param rp LOGICAL: should retrospective provenance be used? This
#'     should be made available in JSON format as an object within
#'     options (i.e. options(prov.json = <your retrospective
#'     provenance object>).
#'@return A character vector containing a minimized script based on
#'     the given input variable.
#'@importFrom CodeDepends getInputs
#'@importFrom CodeDepends readScript
#'@importFrom formatR tidy_source
#'@importFrom utils capture.output
#'@importFrom utils tail
#'@export clean
#'@author Matthew K. Lau

clean <- function(file, var, libs = TRUE, reformat = TRUE, plot = FALSE, rp = FALSE){
    if (!(rp) & missing(file)){
        warning("Please provide a script file path.")
    }else{
        if (missing(var)){
            print("Possible results:", quote = FALSE)
            rownames(var.lineage(readScript(file))[["g"]])
        }else{
            if (!(rp)){
                src <- readScript(file)
                vl <- var.lineage(src)
                sp <- p.spine(vl, var)
                min.g <- vl[["g"]][rownames(vl[["g"]]) %in% as.character(sp), 
                                   colnames(vl[["g"]]) %in% as.character(sp)]
                sp <- sp[sp %in% as.character(unique(vl[["vdf"]][, "step"]))]
                sp <- sort(as.numeric(sp))
                min.src <- as.character(src[sp])
                if (libs){
                    lib.l <- get.libs(src)
                    lib.l <- unique(lib.l)
                    if (length(lib.l) != 0){
                        lib.src <- paste0("library(", lib.l, ")")
                        out <- c(lib.src, min.src)
                    }else{out <- min.src}
                }else{
                    out <- min.src
                }
                                        # Re-formatting the code using formatR
                if (reformat){
                    capture.output(
                        out <- 
                            tidy_source(text = out)$text.tidy
                    )
                }
                if (plot){
                    codeGraph(min.g)
                }
                return(out)
            }else{
                ## Get provenance for script
                ## Check if the provenance is in memory
                if ("prov.json" %in% names(options())){
                    prov <- read.prov(options()$prov.json)
                }else{
                    warning("Please add options(prov.json = PROV.JSON)")
                }
                ## Check prov matches a file in the current working directory
                if (!(any(dir() == prov$info$activity[1,1]))){
                    print("No scripts matching current provenance.")
                }else{
                    script <- readLines(prov$info$activity[1,1][[1]])
                }
                ## Get result options
                ## Output files
                result.files <- unlist(
                    prov$info$entity[prov$info$entity[,4] == "File", 1]
                )
                ## Remove files that are inputs
                result.files <- result.files[
                    names(result.files) %in% 
                    names(which(apply(prov$graph,2,sum) == 0))]
                result.files <- as.character(result.files)
                ## Get objects for suggested results    
                result.obj <- unlist(prov$info$entity[,1])
                ## Removing dev.off calls
                result.obj <- result.obj[!(grepl("dev.", result.obj) &  
                                           prov$info$entity[,2] == "\"graph\"")]
                ## Remove output files
                result.obj <- result.obj[names(result.obj) %in% 
                                         rownames(prov$info$entity)[
                                             prov$info$entity[,4] != "File"]]
                result.obj <- as.character(result.obj)
                ## Combine vectors
                result.opts <- list(Files = unique(result.files), 
                                    Objects = unique(result.obj))
                ## If result is NULL then prompt
                if ((var == "Name of desired result") | 
                    !(var %in% unlist(result.opts))){
                    print("Possible results:", quote = FALSE)
                    ## Convert to simple character vector
                    result.opts
                }else{
                    ## Get the node that matches the result name
                    node.id <- tail(n = 1,
                                    rownames(prov$info$entity)[
                                        prov$info$entity[,1] == var]
                                    )
                    ## Graph search for the path from the result to inputs
                    spine <- get.spine(node.id, prov$g)
                    ## min.script == the minimum code to produce the output
                    ## Get the line numbers from the original source code
                    lines <- prov$info$activity[
                                           grep("p",spine, value = TRUE),
                                           grep("Line", 
                                                colnames(prov$info$activity))]
                                        # If the result is created on 
                                        # a single line, coerce to a matrix
                    if (length(grep("p", spine)) == 1){
                        lines <- as.numeric(lines)
                        lines <- t(as.matrix(lines))
                    }else{lines <- apply(lines, 2, as.numeric)}
                    rownames(lines) <- grep("p", spine, value = TRUE)
                    ## Remove processes which don't involve the creation of data
                    rm.p <- sapply(prov$info$activity[,1], 
                                   function(p, d) any(sapply(d, grepl, x = p)), 
                                   d = prov$info$entity[,1])
                    rm.p <- names(rm.p)[!(rm.p)]
                    lines <- lines[!(rownames(lines) %in% rm.p),]
                    if (length(grep("p", spine)) == 1){
                        lines <- as.numeric(lines)
                        lines <- t(as.matrix(lines))
                    }else{
                        node.rank <- as.numeric(gsub("p", "", rownames(lines)))
                        lines <- lines[order(node.rank),]
                    }
                    ## Extract the minimal code
                    min.script <- apply(lines, 1, function(line, src)  
                        src[seq(line[1], line[2])],
                        src = script)
                    min.script <- unlist(min.script)
                    min.script <- as.character(min.script)
                    ## Check for graphics out
                    plot.code <- sapply(c("jpeg", "png", "tiff", "pdf", "bmp"), 
                                        grepl, x = min.script)
                    if (any(plot.code)){
                        min.script <- c(min.script, "dev.off()")
                    }
                    ## Tidying the code using formatR
                    if (reformat){
                        capture.output(
                            min.script <- 
                                tidy_source(text = min.script)$text.tidy
                        )
                    }
                    out <- min.script
                    return(out)
                }
            }
        }
    }
}
